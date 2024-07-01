== Compilación de bibliotecas

Creemos un proyecto simple que se compone de dos servicios:
- *EchoLib*: Una librería con una función `id` que recibe un string de `texto` y retorna el mismo `texto` sin transformaciones.
- *EchoApp*: Una aplicación que pide palabras a un usuario y las imprime sin realizar modificación.

Recordemos que queremos que nuestras APIs:
- Estén versionadas, por lo que necesitamos almacenar el número de versión.
- Sigan un estándar de formato, por lo que es conveniente configurar una herramienta de análisis estático como Detekt.

=== Configuración de Propiedades

```properties
# gradle.properties
kotlin.code.style=official
kotlin.version=2.0.0
echo.version=1.0.0
detekt.version=1.23.1
```

=== Configuración de Proyectos

```kotlin
// settings.gradle.kts
rootProject.name = "echo"
include("echoLib", "echoApp")

pluginManagement {
    repositories {
        gradlePluginPortal()
    }

    plugins {
        kotlin("jvm") version extra["kotlin.version"] as String
        id("io.gitlab.arturbosch.detekt") version extra["detekt.version"] as String
    }
}
```

=== Configuración del Proyecto Raíz

```kotlin
// build.gradle.kts
plugins {
    kotlin("jvm")
    id("io.gitlab.arturbosch.detekt")
}

allprojects {
    group = "cl.ravenhill.echo"
    version = extra["echo.version"] as String
}

subprojects {
    repositories {
        mavenCentral()
    }
}
```

=== Configuración del Proyecto EchoApp

```kotlin
// echoApp/build.gradle.kts
plugins {
    id("io.gitlab.arturbosch.detekt")
    kotlin("jvm")
}

kotlin {
    jvmToolchain(17)
}
```

=== Configuración del Proyecto EchoLib

```kotlin
// echoLib/build.gradle.kts
plugins {
    id("io.gitlab.arturbosch.detekt")
    kotlin("jvm")
}

kotlin {
    jvmToolchain(17)
}
```

=== Implementación de la Librería

Supongamos que nuestra librería se compone de una función `id(String): String`.
Esta función recibe un parámetro y lo retorna sin modificaciones.

```kotlin
// echoLib/src/main/kotlin/cl/ravenhill/echo/util/Id.kt
package cl.ravenhill.echo.util

fun id(text: String): String = text
```

=== Creando una biblioteca .jar

Un archivo JAR (Java ARchive) es un formato de archivo de paquete utilizado para agrupar múltiples archivos de clase Java, metadatos y recursos (como textos, imágenes, etc.) en un solo archivo para distribución y despliegue. Los archivos JAR se basan en el formato de archivo ZIP y tienen una estructura similar.

Dentro del archivo JAR, hay un directorio especial llamado META-INF que contiene un archivo llamado MANIFEST.MF. El archivo de manifiesto contiene metadatos sobre el archivo JAR, como la versión, la clase principal (para JARs ejecutables), y otra información del paquete. Para los JARs ejecutables, el archivo de manifiesto especifica el punto de entrada de la aplicación utilizando el atributo Main-Class.

==== Configuración del Archivo JAR en echoLib

```kotlin
// echoLib/build.gradle.kts
/* ... */
tasks.jar {
    manifest {
        attributes["Implementation-Title"] = "echoLib"
        attributes["Implementation-Version"] = project.version
    }
    from(sourceSets.main.get().output)
}
```

==== Copia del Archivo JAR en echoApp

```kotlin
// build.gradle.kts
/* ... */
tasks.register<Copy>("copyLib") {
    group = "build"
    description = "Copia el archivo JAR de la biblioteca a la aplicación"
    dependsOn(":echoLib:jar")
    from("echoLib/build/libs")
    into("echoApp/libs")
}
```

==== Configuración de Dependencias en echoApp

```kotlin
// echoApp/build.gradle.kts
/* ... */
repositories {
    flatDir {
        dirs("libs")
    }
}

dependencies {
    implementation(fileTree("libs") { include("*.jar") })
}
```

==== Explicación del Código

- *Configuración del Archivo JAR en echoLib*:
  - Configura la tarea `jar` para incluir un manifiesto con los atributos `Implementation-Title` y `Implementation-Version`.
  - Incluye los archivos de salida del conjunto de fuentes principal en el archivo JAR.

- *Copia del Archivo JAR en echoApp*:
  - Registra una tarea `copyLib` que copia el archivo JAR generado en `echoLib` al directorio `libs` de `echoApp`.
  - La tarea `copyLib` depende de la tarea `jar` en `echoLib`, asegurando que el archivo JAR se genere antes de copiarlo.

- *Configuración de Dependencias en echoApp*:
  - Configura el repositorio `flatDir` para incluir el directorio `libs`.
  - Define una dependencia de implementación que incluye todos los archivos JAR en el directorio `libs`.

=== Creando un Ejecutable

Supongamos que tenemos un archivo `Echo.kt` en el paquete `cl.ravenhill.echo` con el siguiente código:

```kotlin
// echoApp/src/main/kotlin/cl/ravenhill/echo/Echo.kt
package cl.ravenhill.echo

import cl.ravenhill.echo.util.id

fun main(args: Array<String>) {
    for (arg in args) {
        println(id(arg))
    }
}
```

=== Configuración del Proyecto EchoApp

```kotlin
// echoApp/build.gradle.kts
plugins {
    id("io.gitlab.arturbosch.detekt")
    kotlin("jvm")
    // Declaramos que nuestro programa es una aplicación
    application
}

/* ... */
application {
    mainClass.set("cl.ravenhill.echo.EchoKt")
}
```

En esta configuración, declaramos el punto de entrada de la aplicación. Si la función `main` está definida en el archivo `cl.ravenhill.echo.Echo.kt`, entonces el punto de entrada es `cl.ravenhill.echo.EchoKt`.

=== Ejecución de la Aplicación

```powershell
.\gradlew.bat run
```

```bash
./gradlew run
```

Esta configuración es útil para probar la aplicación, pero no es ideal para “publicarla”. Nos gustaría que nuestro “cliente” pueda ejecutar la aplicación sin necesidad de Gradle.

Aquí tienes la versión mejorada y desarrollada usando la sintaxis de Typst:

=== Creación de un JAR Ejecutable

Podemos crear JAR ejecutables con Gradle. Un fat JAR (también conocido como uber JAR) es un archivo JAR que contiene no solo las clases y recursos de tu propia aplicación, sino también todas las dependencias necesarias para ejecutarla.

```kotlin
tasks.register<Jar>("fatJar") { // 1
    archiveClassifier.set("fat")  // 2
    duplicatesStrategy = DuplicatesStrategy.EXCLUDE // 3
    manifest {  // 4
        attributes["Main-Class"] = application.mainClass.get()
        attributes["Implementation-Title"] = "Echo"
        attributes["Implementation-Version"] = "1.0"
    }
    from(sourceSets.main.get().output)  // 5
    dependsOn(configurations.runtimeClasspath)  // 6
    from({  // 7
        configurations.runtimeClasspath
            .get()
            .filter { it.name.endsWith("jar") }
            .map { project.zipTree(it) }
    })
}
```

1. Registramos una tarea `fatJar` para empaquetar la aplicación.
2. Configura el nombre del archivo JAR resultante con el sufijo "fat".
3. Establece la estrategia de manejo de duplicados a `EXCLUDE` (excluir archivos duplicados).
4. Configura el manifiesto del JAR.
5. Añade el código fuente de la aplicación al JAR.
6. Establece que esta tarea depende de las clases en el classpath de tiempo de ejecución.
7. Añade las dependencias del classpath de tiempo de ejecución al JAR.

Con la tarea creada podemos compilar el JAR:

```powershell
# Windows
.\gradlew.bat fatJar
```

```bash
# Unix
./gradlew fatJar
```

Para ejecutar un JAR necesitamos Java:

```bash
java -jar echoApp/build/libs/echoApp-1.0.0-fat.jar Hello world
```
