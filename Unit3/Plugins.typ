== Plugins

Los plugins extienden las capacidades de Gradle al agregar nuevas tareas, configuraciones y funcionalidades a los scripts de build.
Permiten la reutilización de configuraciones de build sin necesidad de duplicar código en múltiples proyectos.

```kotlin
plugins {
    kotlin("jvm") version "2.0.0"
    id("io.gitlab.arturbosch.detekt") version "1.23.6"
}
```

=== Plugins vs Tareas

==== Propósito

*Tareas*:
- Se utilizan para definir una acción específica dentro del build script.
- Las tareas son componentes individuales que realizan trabajos concretos.

*Plugins*:
- Son componentes reutilizables que pueden agregar y configurar múltiples tareas y extender la funcionalidad del build script.
- Los plugins encapsulan lógica y configuración que puede aplicarse a uno o más proyectos.

==== Alcance

*Tareas*:
- Tienen un alcance limitado al build script o proyecto en el que se definen.
- Las tareas pueden ser específicas a una parte del proceso de construcción.

*Plugins*:
- Tienen un alcance más amplio, ya que pueden aplicarse a múltiples proyectos y pueden incluir lógica para configurar y extender esos proyectos de manera más compleja.

Aquí tienes la versión mejorada y desarrollada usando la sintaxis de Typst:

=== Plugins personalizados

Los plugins personalizados se crean para extender Gradle con funcionalidades específicas a las necesidades de un proyecto o equipo. Estos plugins permiten:

- Automatizar tareas repetitivas.
- Centralizar configuraciones comunes.
- Modularizar scripts de construcción para mejorar la mantenibilidad.

Se pueden crear como clases dentro del proyecto o como proyectos independientes (no haremos esto último).

== Ejemplo de Plugin Personalizado

```kotlin
// build.gradle.kts
class SamplePlugin : Plugin<Project> {
    override fun apply(target: Project) {
        target.tasks.register("pluginTask") {
            doLast {
                println("A plugin task was called")
            }
        }
    }
}

apply<SamplePlugin>()
```

En este ejemplo, se define un plugin personalizado `SamplePlugin` que registra una tarea llamada `pluginTask` que imprime un mensaje cuando se ejecuta.

== Ejecución del Plugin

```powershell
# Windows
.\gradlew.bat pluginTask
```

```bash
# Unix
./gradlew pluginTask
```

Para ejecutar la tarea `pluginTask` definida en el plugin personalizado, utiliza el comando `gradlew` seguido del nombre de la tarea correspondiente. En Windows, usa `.\gradlew.bat`, y en Unix, usa `./gradlew`.

== Beneficios de los Plugins Personalizados

- *Automatización*: 
  - Los plugins automatizan tareas repetitivas, reduciendo errores manuales y aumentando la eficiencia.
- *Centralización*:
  - Centralizan configuraciones comunes, facilitando la gestión y actualización de las mismas.
- *Modularización*:
  - Modularizan scripts de construcción, mejorando la mantenibilidad y organización del código de construcción.

#line(length: 100%)
*Ejercicio: Reporte de archivos*

Implementa un plugin que se encargue de generar un reporte con la lista de todos los archivos `.kt` y `.kts` mediante una tarea. Basta con que imprima en pantalla los nombres de todos los archivos. Puedes obtener la lista de archivos haciendo:

```kotlin
val kotlinFiles = project.fileTree(".").matching {
    include("**/*.kt", "**/*.kts")
}.files
```
#line(length: 100%)