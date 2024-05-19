#import "@preview/ctheorems:1.1.2": *

#show: thmrules

#let definition = thmbox("definition", "Definición", inset: (x: 1.2em, top: 1em))

== Build systems

#definition("Build system")[
  Un sistema de compilación es una herramienta de software que automatiza el proceso de convertir 
  código fuente en un ejecutable o una librería, realizando tareas como la compilación de código, 
  gestión de dependencias y empaquetado de software.
]

Estos sistemas son esenciales para la gestión eficiente de proyectos de software, especialmente en 
entornos donde la escalabilidad y la reproducibilidad son importantes.

=== Usos Comunes

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

=== Ejemplos de Build Systems

- *Make*: Uno de los primeros sistemas de compilación, ampliamente usado en proyectos de C y C++.
- *Maven y Gradle*: Muy utilizados en proyectos Java y Android por su poderosa gestión de
  dependencias y facilidades para la construcción de proyectos.
- *Apache Ant*: Utilizado en Java, se centra en ser flexible y extensible.
- *Webpack y Babel*: Populares en el desarrollo de aplicaciones web modernas, manejan la
  transformación y empaquetado de módulos JavaScript.

=== Gradle

Gradle es una herramienta poderosa y flexible utilizada para automatizar el proceso de construcción 
de software, incluyendo compilación, prueba, despliegue y empaquetado. Su diseño modular y su 
capacidad de personalización lo hacen adecuado para una amplia variedad de proyectos, desde 
aplicaciones móviles hasta grandes sistemas empresariales.

==== Características Principales

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

==== A Taste of Gradle

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

==== Configuración de Repositorios en Gradle

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

2. *Google*: Especialmente importante para proyectos Android, el repositorio de Google alberga 
  librerías y herramientas específicas necesarias para el desarrollo en Android.

3. *Repositorio Maven Personalizado*: Utilizado para alojar artefactos privados o de terceros no
  disponibles en repositorios públicos. Es ideal para empresas que necesitan un control más estricto
  sobre las librerías utilizadas en sus proyectos.

4. *Seguridad de Credenciales*: Es vital no "hardcodear" credenciales directamente en los archivos
  de configuración. Utiliza variables de entorno para gestionar las credenciales de forma segura,
  como se muestra en el ejemplo. Esto ayuda a prevenir la exposición de información sensible.

5. *Flat Directory Repository*: Un repositorio de directorio plano se usa para incluir librerías que 
  se encuentran directamente en el sistema de archivos local del proyecto, sin un repositorio Maven 
  o Ivy. Es útil para librerías que no están disponibles en ningún repositorio remoto o para desarrollo y pruebas rápidas.

*Consejos y Mejores Prácticas*

- *Orden de Repositorios*: El orden en la que declaras los repositorios es importante, ya que
  Gradle buscará las dependencias en el orden en que aparecen. Si una dependencia está disponible en
  más de un repositorio, Gradle descargará la versión del primero que encuentre.

- *Uso de Repositorios Seguros*: Asegúrate de usar URLs seguras (`https`), especialmente cuando
  configures repositorios personalizados para garantizar que las transferencias de datos sean
  cifradas.

==== Dependencias

#definition("Dependencia")[
  Las dependencias son componentes externos o bibliotecas que un proyecto requiere para compilar y 
  ejecutarse correctamente.
]

Gradle facilita la automatización de la descarga e integración de estas dependencias desde
repositorios configurados, ya sean locales o remotos.

Gradle define varias configuraciones que determinan cómo y cuándo las dependencias están disponibles
para tu proyecto durante su ciclo de vida:

- *`compileOnly`*: Las dependencias están disponibles solo durante la fase de compilación. No se 
  incluyen en el tiempo de ejecución, útil para anotaciones, preprocesadores, etc.
- *`runtimeOnly`*: Las dependencias solo están disponibles en tiempo de ejecución. No están
  disponibles durante la compilación, adecuadas para implementaciones de interfaces que son
  proporcionadas en tiempo de ejecución.
- *`implementation`*: Las dependencias están disponibles tanto en tiempo de compilación como en 
  tiempo de ejecución. No se exponen a los consumidores del proyecto, lo que ayuda a mantener el 
  encapsulamiento.
- *`api`*: Similar a `implementation`, pero estas dependencias también se exponen a los
  consumidores, lo que significa que cualquier módulo que dependa de tu biblioteca tendrá acceso a
  ellas.
- *`testCompileOnly`*: Dependencias que solo son necesarias para compilar el código de prueba, no
  para ejecutarlo.
- *`testRuntimeOnly`*: Dependencias que son necesarias solo en el tiempo de ejecución de las
  pruebas.
- *`testImplementation`*: Dependencias que son necesarias tanto para compilar como para ejecutar las
  pruebas.
- *`testApi`*: Dependencias de la API utilizadas en el código de prueba, disponibles tanto para la
  compilación como para la ejecución de pruebas.

En el siguiente ejemplo de configuración de Gradle, definimos algunas dependencias que se utilizarán
en el curso, incluyendo la librería de reflexión de Kotlin y varias librerías de Kotest para pruebas:

```kotlin
val kotestVersion = "5.8.0"

dependencies {
    implementation(kotlin("reflect"))
    testImplementation("io.kotest:kotest-property:$kotestVersion")
    testImplementation("io.kotest:kotest-runner-junit5:$kotestVersion")
    testImplementation("io.kotest:kotest-framework-datatest:$kotestVersion")
}
```

==== Tasks

En Gradle, las tareas son la unidad fundamental de trabajo. Son conjuntos de instrucciones
ejecutables que realizan acciones específicas como compilar código, correr tests, construir un
archivo JAR, publicar a un repositorio MAVEN, entre otras.

Gradle proporciona varias tareas predeterminadas que están configuradas para realizar acciones 
comunes de manera eficiente. Además, los usuarios pueden definir tareas personalizadas para 
adaptarse a necesidades específicas del proyecto.

*Ejemplos de Tareas en Gradle*

1. *Ejecutar Tests con JUnit*:
   Gradle facilita la configuración para utilizar frameworks de testing como JUnit. Por ejemplo, 
   para configurar Gradle para usar el motor de JUnit Platform en la ejecución de tests:
   ```kotlin
   tasks.test {
       useJUnitPlatform()
   }
   ```
   Nota: Otros frameworks de testing como Kotest utilizan el motor de JUnit, por lo que esta
   configuración también se aplica a ellos.

2. *Copiar Archivos*:
   Puedes crear tareas para copiar archivos de un directorio a otro. Este ejemplo muestra cómo 
   definir una tarea para copiar recursos:
   ```kotlin
   tasks.create<Copy>("copy") {
       description = "Copies resources to the output directory"
       group = "Custom"
       from("src")
       into("dst")
   }
   ```

3. *Calcular un Número de Fibonacci*:
   Este ejemplo ilustra cómo definir una tarea personalizada para calcular el 12º número de 
   Fibonacci:
   ```kotlin
   tasks.register("Fib") {
       var first = 0
       var second = 1
       doFirst {
           println("Calculating the 12th Fibonacci number...")
           for (i in 1..11) {
               second += first
               first = second - first
           }
       }
       doLast {
           println("The 12th Fibonacci number is $second")
       }
   }
   ```
   - `doFirst`: Se ejecuta antes de las demás acciones en la tarea.
   - `doLast`: Se ejecuta después de todas las demás acciones en la tarea.

Para ejecutar tareas en Gradle, utiliza el Gradle Wrapper, que garantiza que todos los 
desarrolladores del proyecto usen la misma versión de Gradle, proporcionando consistencia a través 
del entorno de desarrollo:

- *En sistemas Unix*:
  ```bash
  ./gradlew test
  ./gradlew copy
  ./gradlew Fib
  ```

- *En sistemas Windows*:
  ```powershell
  .\gradlew.bat test
  .\gradlew.bat copy
  .\gradlew.bat Fib
  ```

#line(length: 100%)

*Ejercicio: Crear una Tarea de Gradle para Calcular el Tamaño del Proyecto Compilado*

Desarrolla una tarea de Gradle que determine y reporte el tamaño total de los archivos compilados de
tu proyecto.

1. *Definición de la Tarea*:
   Crea una nueva tarea en tu archivo `build.gradle.kts` que calcule el tamaño total de los archivos
   en el directorio de clases compiladas de Kotlin.

2. *Acceso a los Archivos Compilados*:
   Utiliza el método `project.fileTree` para acceder a los archivos en el directorio de salida de 
   compilación (`build/classes/kotlin/main`).

3. *Cálculo del Tamaño*:
   Itera sobre los archivos obtenidos y suma sus tamaños utilizando el método `length()` para
   obtener el tamaño total en bytes. 

4. *Reportar el Tamaño*:
   Imprime el tamaño total calculado en la consola.
#line(length: 100%)

==== Plugins

Los plugins son componentes esenciales en Gradle que extienden sus capacidades al introducir nuevas
tareas, configuraciones y funcionalidades a los scripts de build. Permiten modularizar y reutilizar 
configuraciones de construcción, evitando la duplicación de código en múltiples proyectos y 
facilitando la gestión de procesos de construcción complejos.

*Beneficios de los Plugins*

- *Extensión de Funcionalidades*: Los plugins pueden añadir tareas específicas para compilar
  código, ejecutar pruebas, generar documentación, entre otras.
- *Reutilización de Configuraciones*: Facilitan la estandarización de las configuraciones de 
  construcción a través de diferentes proyectos, mejorando la coherencia y la eficiencia.
- *Automatización Mejorada*: Con los plugins, se puede automatizar desde la gestión de 
  dependencias hasta la integración y despliegue continuos (CI/CD).

*Ejemplos de Plugins en Gradle*

En el curso, utilizaremos dos plugins, en particular habilitar el desarrollo en Kotlin y realizar 
análisis estático de código. Aquí te mostramos cómo puedes aplicar estos plugins en tu archivo 
`build.gradle.kts`:

```kotlin
plugins {
    kotlin("jvm") version "1.9.23" // Plugin de Kotlin para soporte de JVM
    id("io.gitlab.arturbosch.detekt") version "1.23.6" // Plugin para análisis estático de código Kotlin
}
```