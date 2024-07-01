#import "@preview/ctheorems:1.1.2": *

#show: thmrules

#let definition = thmbox("definition", "Definición", inset: (x: 1.2em, top: 1em))

= Unidad 3: Build systems

#definition("Build system")[
  Un sistema de compilación es una herramienta de software que automatiza el proceso de convertir 
  código fuente en un ejecutable o una librería, realizando tareas como la compilación de código, 
  gestión de dependencias y empaquetado de software.
]

Estos sistemas son esenciales para la gestión eficiente de proyectos de software, especialmente en 
entornos donde la escalabilidad y la reproducibilidad son importantes.

#include "Unit3/BuildSystems.typ"
#include "Unit3/StaticAnalysis.typ"
#include "Unit3/Tasks.typ"
#include "Unit3/Plugins.typ"
#include "Unit3/Compilation.typ"
#include "Unit3/Publish.typ"

== Respuestas

*Ejercicio: Orden de Ejecución de Acciones*

```txt
First Action - Preparation Step 2
First Action - Preparation Step 1
Last Action - Cleanup Step 1
Last Action - Cleanup Step 2
```

*Ejercicio: Tamaño del Proyecto*

```kt
tasks.register("countCompiledSize") {
    group = "build"
    description = "Count the size of the compiled classes"
    dependsOn("compileKotlin")
    doLast {
        val files = fileTree("build/classes/kotlin/main")
        var size = 0L
        for (file in files) {
            size += file.length()
        }
        println(
            "The size of the compiled classes in subproject1 is $size bytes"
        )
    }
}
```

*Ejercicio: Tarea de Fibonacci*

```txt
Preparing to calculate the 10th Fibonacci number
The 10th Fibonacci number is 55
Finished calculating the 10th Fibonacci number
```

*Ejercicio: Reporte de Archivos*

```kt
class KotlinFilesReportPlugin : Plugin<Project> {
    override fun apply(project: Project) {
        project.tasks.register("generateKotlinFilesReport") {
            group = "reporting"
            description = "Generates a report of all Kotlin files in the project."

            doLast {
                val kotlinFiles = project.fileTree(".").matching {
                    include("**/*.kt", "**/*.kts")
                }.files

                println("Kotlin Files Report:\n\n")
                for (file in kotlinFiles) {
                        println(file.name)
                }
            }
        }
    }
}

apply<KotlinFilesReportPlugin>()
```