#import "@preview/ctheorems:1.1.2": *

#show: thmrules

#let definition = thmbox("definition", "Definición", inset: (x: 1.2em, top: 1em))

== Usos Comunes

1. *Configuración Reutilizable*: Permite definir el proceso de compilación una sola vez y reutilizar
  esa configuración en múltiples proyectos, lo que ahorra tiempo y asegura consistencia a través de 
  diferentes entornos de desarrollo y producción.

2. *Gestión de Dependencias*: Automatiza la resolución y actualización de librerías y otros paquetes
  necesarios para el desarrollo del proyecto. Esto incluye la descarga de las versiones correctas de
  cada dependencia y asegurar que todas sean compatibles entre sí.

3. *Automatización de Pruebas*: Integra y ejecuta automáticamente suites de pruebas para verificar 
  que el software funcione correctamente antes de ser desplegado, mejorando la calidad y seguridad
  del software.

4. *Integración y Despliegue Continuos*: Facilita la implementación de prácticas de integración
  continua (CI) y despliegue continuo (CD), permitiendo que los cambios en el código sean
  automáticamente compilados, probados y desplegados.

== Ejemplos de Build Systems

- *Make*: Uno de los primeros sistemas de compilación, ampliamente usado en proyectos de C y C++.
- *Maven y Gradle*: Muy utilizados en proyectos Java y Android por su poderosa gestión de
  dependencias y facilidades para la construcción de proyectos.
- *Apache Ant*: Utilizado en Java, se centra en ser flexible y extensible.
- *Webpack y Babel*: Populares en el desarrollo de aplicaciones web modernas, manejan la
  transformación y empaquetado de módulos JavaScript.

== Gradle

Gradle es una herramienta poderosa y flexible utilizada para automatizar el proceso de construcción 
de software, incluyendo compilación, prueba, despliegue y empaquetado. Su diseño modular y su 
capacidad de personalización lo hacen adecuado para una amplia variedad de proyectos, desde 
aplicaciones móviles hasta grandes sistemas empresariales.

=== Características Principales

1. *DSL Basado en Groovy y Kotlin*: Gradle utiliza lenguajes de configuración específicos del 
  dominio (DSL) basado en Groovy y Kotlin. Esto permite a los desarrolladores escribir scripts de 
  construcción expresivos y mantenibles.

2. *Personalización y Extensibilidad*: Uno de los puntos fuertes de Gradle es su capacidad para
  ser personalizado y extendido. Los desarrolladores pueden crear tareas personalizadas y añadir
  funcionalidades específicas al proceso de construcción utilizando su API extensa.

3. *Compatibilidad con Entornos de Desarrollo*: Gradle es compatible con los principales entornos
  de desarrollo integrado (IDE) como Eclipse, IntelliJ IDEA y Android Studio, lo que permite una
  integración sin fisuras y un flujo de trabajo eficiente para los desarrolladores.

4. *Integración con Herramientas de CI/CD*: Se integra perfectamente con sistemas de integración
  continua y despliegue continuo como Jenkins, facilitando la automatización del ciclo de vida del
  desarrollo de software.

5. *Gestión de Dependencias Avanzada*: Ofrece un robusto sistema de gestión de dependencias que 
  simplifica el manejo de librerías y módulos necesarios para el desarrollo de proyectos.

=== A Taste of Gradle

```kotlin
// build.gradle.kts
plugins {
  kotlin("jvm") version "1.9.23"
}

group = "cl.ravenhill"
version = "1.0-SNAPSHOT"

repositories {
  mavenCentral()
}

dependencies {
  testImplementation(kotlin("test"))
}

tasks.test {
  useJUnitPlatform()
}

kotlin {
  jvmToolchain(21)
}
```

=== `gradle.properties`

El archivo `gradle.properties` es un archivo de configuración para Gradle que utiliza el formato `clave=valor` para definir las propiedades. Este archivo permite definir propiedades que actúan como variables de entorno durante la compilación. Es una buena práctica almacenar valores como las versiones de las librerías utilizadas en el proyecto en este archivo.

```properties
kotlin.code.style=official
kotlin.version=2.0.0
build-systems-kt.version=1.0.0

org.gradle.parallel=true
org.gradle.caching=true

detekt.version=1.23.1
dokka.version=1.9.10
kotest.version=5.9.0
kotlinx.datetime.version=0.4.1
```

- `kotlin.code.style=official`: 
  - Define el estilo de código de Kotlin a utilizar, en este caso, el estilo oficial recomendado por Kotlin.
- `kotlin.version=2.0.0`: 
  - Especifica la versión de Kotlin a utilizar en el proyecto.
- `build-systems-kt.version=1.0.0`: 
  - Define la versión del proyecto.
- `org.gradle.parallel=true`: 
  - Habilita la construcción en paralelo para mejorar el rendimiento.
- `org.gradle.caching=true`: 
  - Habilita la caché de Gradle para acelerar la construcción reutilizando los resultados de compilaciones anteriores.
- `detekt.version=1.23.1`: 
  - Especifica la versión de Detekt, una herramienta de análisis estático de código para Kotlin.
- `dokka.version=1.9.10`: 
  - Define la versión de Dokka, una herramienta de documentación para Kotlin.
- `kotest.version=5.9.0`: 
  - Especifica la versión de Kotest, un framework de pruebas para Kotlin.
- `kotlinx.datetime.version=0.4.1`: 
  - Define la versión de `kotlinx-datetime`, una librería de fecha y hora para Kotlin.

=== Configuración de Repositorios en Gradle

En Gradle, los repositorios especifican las ubicaciones de las librerías necesarias para un 
proyecto. La configuración de los repositorios determina el orden en que Gradle buscará las 
dependencias requeridas, procediendo de arriba hacia abajo en el script.

Aquí se muestra cómo configurar varios tipos de repositorios en un archivo `build.gradle.kts`:

```kotlin
repositories {
    mavenCentral()  // (1)
    google()        // (2)
    maven {         // (3)
        url = uri("https://your.company.com/maven")
        credentials { // (4)
            username = System.getenv("MAVEN_USERNAME") ?: "defaultUser"
            password = System.getenv("MAVEN_PASSWORD") ?: "defaultPassword"
        }
    }
    flatDir {       // (5)
        dirs("lib")
    }
}
```

1. *Maven Central*: Este es el repositorio central de Sonatype, utilizado por defecto por
  proyectos Maven y Gradle en todo el mundo. Contiene una vasta cantidad de librerías para Java, 
  Kotlin y Scala.

1. *Google*: Especialmente importante para proyectos Android, el repositorio de Google alberga 
  librerías y herramientas específicas necesarias para el desarrollo en Android.

1. *Repositorio Maven Personalizado*: Utilizado para alojar artefactos privados o de terceros no
  disponibles en repositorios públicos. Es ideal para empresas que necesitan un control más estricto
  sobre las librerías utilizadas en sus proyectos.

1. *Seguridad de Credenciales*: Es vital no "hardcodear" credenciales directamente en los archivos
  de configuración. Utiliza variables de entorno para gestionar las credenciales de forma segura,
  como se muestra en el ejemplo. Esto ayuda a prevenir la exposición de información sensible.

1. *Flat Directory Repository*: Un repositorio de directorio plano se usa para incluir librerías que 
  se encuentran directamente en el sistema de archivos local del proyecto, sin un repositorio Maven 
  o Ivy. Es útil para librerías que no están disponibles en ningún repositorio remoto o para desarrollo y pruebas rápidas.

*Consejos y Mejores Prácticas*

- *Orden de Repositorios*: El orden en la que declaras los repositorios es importante, ya que
  Gradle buscará las dependencias en el orden en que aparecen. Si una dependencia está disponible en
  más de un repositorio, Gradle descargará la versión del primero que encuentre.

- *Uso de Repositorios Seguros*: Asegúrate de usar URLs seguras (`https`), especialmente cuando
  configures repositorios personalizados para garantizar que las transferencias de datos sean
  cifradas.

=== Dependencias

#definition("Dependencia")[
  Las dependencias son componentes externos o bibliotecas que un proyecto requiere para compilar y 
  ejecutarse correctamente.
]

Gradle facilita la automatización de la descarga e integración de estas dependencias desde
repositorios configurados, ya sean locales o remotos.

```kotlin	
dependencies {
    implementation(kotlin("reflect"))
    testImplementation("group:name:version")
    implementation(group = "group", name = "name", version = "version")
}

```

En el siguiente ejemplo de configuración de Gradle, definimos algunas dependencias que se utilizarán
en el curso, incluyendo la librería de reflexión de Kotlin y varias librerías de Kotest para pruebas:

```kotlin
val kotestVersion = extra["kotest.version"] as String

dependencies {
    implementation(kotlin("reflect"))
    testImplementation("io.kotest:kotest-property:$kotestVersion")
    testImplementation("io.kotest:kotest-runner-junit5:$kotestVersion")
    testImplementation("io.kotest:kotest-framework-datatest:$kotestVersion")
}
```

=== `settings.gradle.kts`

El archivo `settings.gradle.kts` se utiliza para configurar y gestionar los ajustes de configuración de un proyecto Gradle. Este archivo define la estructura de módulos del proyecto y puede incluir configuraciones adicionales para la gestión de plugins.

```kotlin
// El nombre del proyecto raíz
rootProject.name = "build-systems-kt"

// Incluye los subproyectos del proyecto raíz
include(
    ":subproject1", 
    ":subproject2", 
    ":subproject3"
)
```

A continuación, un ejemplo más completo que incluye la configuración de la gestión de plugins:

```kotlin
// Define el nombre del proyecto raíz
rootProject.name = "build-systems-kt"

// Incluye los subproyectos
include(":subproject1", ":subproject2", ":subproject3")

pluginManagement {
    // Define los repositorios para la resolución de plugins
    repositories {
        gradlePluginPortal()
    }

    // Configura los plugins con sus respectivas versiones
    plugins {
        kotlin("jvm") version extra["kotlin.version"] as String
        id("io.gitlab.arturbosch.detekt") version extra["detekt.version"] as String
    }
}
```

- `rootProject.name = "build-systems-kt"`:
  - Define el nombre del proyecto raíz, que es el identificador principal del proyecto en Gradle.
  
- `include(":subproject1", ":subproject2", ":subproject3")`:
  - Incluye los subproyectos en el proyecto raíz. Cada subproyecto puede tener su propia configuración y código independiente.
  
- `pluginManagement`:
  - Configura la gestión de plugins para el proyecto. Esto incluye la definición de los repositorios y las versiones de los plugins necesarios.
  
- `repositories { gradlePluginPortal() }`:
  - Define el repositorio `gradlePluginPortal` para resolver y descargar los plugins utilizados en el proyecto.
  
- `plugins`:
  - Especifica los plugins y sus versiones que serán utilizados en el proyecto. En este ejemplo, se utilizan los plugins de Kotlin JVM y Detekt con versiones definidas en el archivo `gradle.properties`.

Aquí tienes la versión mejorada usando la sintaxis de Typst:

=== `build.gradle.kts`

El archivo `build.gradle.kts` es el script principal de Gradle que define las tareas y configuraciones de construcción del proyecto. En este archivo se especifican las dependencias, plugins, tareas personalizadas y otros ajustes necesarios para compilar y ejecutar el proyecto.

```kotlin
// Define los plugins que se aplicarán al proyecto raíz
plugins {
    kotlin("jvm")
}

// Configura el grupo y la versión para todos los proyectos
allprojects {
    group = "build-systems-kt"
    version = extra["build-systems-kt.version"] as String
}

// Define el repositorio de Maven Central como fuente para las dependencias de los subproyectos
subprojects {
    repositories {
        mavenCentral()
    }
}
```

- *plugins*: 
  - Define los plugins que se aplicarán al proyecto raíz. 
  - En este caso, se aplica el plugin de Kotlin para JVM.
- *allprojects*: 
  - Configura el grupo y la versión para todos los proyectos. 
  - El grupo se establece como "build-systems-kt" y la versión se obtiene de las propiedades extra.
- *subprojects*: 
  - Define el repositorio de Maven Central como fuente para las dependencias de los subproyectos.
  - Esto asegura que todas las dependencias necesarias para los subproyectos se puedan resolver desde Maven Central.

==== `subproject1/build.gradle.kts`

```kotlin
val kotestVersion = extra["kotest.version"] as String
val kotlinxDatetimeVersion = extra["kotlinx.datetime.version"] as String

plugins {
    id("io.gitlab.arturbosch.detekt")
    kotlin("jvm")
}

dependencies {
    implementation(kotlin("reflect"))
    implementation("org.jetbrains.kotlinx:kotlinx-datetime:$kotlinxDatetimeVersion")
    testImplementation("io.kotest:kotest-property:$kotestVersion")
    testImplementation("io.kotest:kotest-runner-junit5:$kotestVersion")
    testImplementation("io.kotest:kotest-framework-datatest:$kotestVersion")
}

tasks.test {
    useJUnitPlatform()
}

kotlin {
    jvmToolchain(17)
}
```

- *kotestVersion* y *kotlinxDatetimeVersion*:
  - Obtiene las versiones de Kotest y kotlinx-datetime de las propiedades extra.
- *plugins*:
  - Aplica el plugin de Detekt para análisis estático y el plugin de Kotlin para JVM.
- *dependencies*:
  - Define las dependencias necesarias para el subproyecto:
    - `implementation(kotlin("reflect"))`: Añade la dependencia de reflexión de Kotlin.
    - `implementation("org.jetbrains.kotlinx:kotlinx-datetime:$kotlinxDatetimeVersion")`: Añade la dependencia de kotlinx-datetime con la versión especificada.
    - `testImplementation("io.kotest:kotest-property:$kotestVersion")`: Añade la dependencia de Kotest para pruebas de propiedades.
    - `testImplementation("io.kotest:kotest-runner-junit5:$kotestVersion")`: Añade la dependencia de Kotest para JUnit5.
    - `testImplementation("io.kotest:kotest-framework-datatest:$kotestVersion")`: Añade la dependencia de Kotest para pruebas basadas en datos.
- *tasks.test*:
  - Configura las pruebas para usar JUnit Platform.
- *kotlin*:
  - Configura el toolchain de JVM para usar la versión 17.
  
=== Construyendo el proyecto

```powershell
# Windows
.\gradlew.bat :subproject1:build
.\gradlew.bat build
```

```bash
# Unix
./gradlew :subproject1:build
./gradlew build
```