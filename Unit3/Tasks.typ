== Tareas

Una tarea es una unidad de trabajo que Gradle puede ejecutar. 
Puede representar cualquier cosa, desde compilar código, ejecutar pruebas, generar documentación, hasta desplegar una aplicación. 
Las tareas se definen en algún archivo `build.gradle.kts` y pueden ser muy simples o bastante complejas dependiendo de lo que necesiten hacer.

=== Tareas Predefinidas

Gradle proporciona un conjunto de tareas predefinidas que son comunes en la mayoría de los proyectos. 
Algunos ejemplos de tareas predefinidas son:

==== Ejemplo de Tarea de Prueba

```kotlin
tasks.test {
    useJUnitPlatform()
}
```

Esta tarea configura Gradle para utilizar el motor de JUnit para correr los tests.

==== Ejemplo de Tarea de Copiado

```kotlin
tasks.create<Copy>("copy") {
    // Es buena práctica añadir esto a nuestras tareas
    description = "Copies sources to the destination directory"
    group = "Custom"

    from("src")
    into("dst")
}
```

Esta tarea de copiado mueve archivos desde el directorio `src` al directorio `dst`.

- *description*: 
  - Proporciona una descripción de la tarea. 
  Es una buena práctica para hacer nuestras tareas más comprensibles.
- *group*: 
  - Asigna la tarea a un grupo. 
  En este caso, se asigna al grupo "Custom".

==== Ejecución de Tareas Predefinidas

```powershell
# Windows
.\gradlew.bat test
.\gradlew.bat copy
```

```bash
# Unix
./gradlew test
./gradlew copy
```

Para ejecutar las tareas predefinidas, utiliza el comando `gradlew` seguido del nombre de la tarea. 
En Windows, usa `.\gradlew.bat`, y en Unix, usa `./gradlew`.

==== Tareas Predefinidas Comunes

- *assemble*: 
  - Ensambla el proyecto completo.
- *build*: 
  - Construye el proyecto.
- *clean*: 
  - Elimina los archivos generados por la construcción previa.
- *check*: 
  - Ejecuta todas las verificaciones, incluyendo pruebas.

Estas tareas predefinidas facilitan la configuración y ejecución de las operaciones comunes en los proyectos Gradle.

=== Acciones

- `doFirst`:
  - Agrega una acción que se ejecutará al inicio de la tarea, antes de cualquier otra acción configurada en la tarea.
  - Se usa cuando necesitas realizar alguna preparación o configuración previa antes de la ejecución principal de la tarea.

- `doLast`:
  - Agrega una acción que se ejecutará al final de la tarea, después de todas las demás acciones configuradas en la tarea.
  - Se usa cuando necesitas realizar alguna operación de limpieza, validación final o cualquier acción que debe ejecutarse después de la ejecución principal de la tarea.

==== Ejemplo de Uso de `doFirst` y `doLast`

```kotlin
tasks.register("Fib") {
    var first = 0
    var second = 1
    doFirst {
        println("What's going on?")
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

En este ejemplo:

- *doFirst*: 
  - Imprime un mensaje antes de iniciar el cálculo de la serie de Fibonacci y calcula los primeros 12 números de la serie.
- *doLast*: 
  - Imprime el 12.º número de Fibonacci después de que se ha completado el cálculo.

Para ejecutar esta tarea, utiliza el comando:

```powershell
# Windows
.\gradlew.bat Fib
```

```bash
# Unix
./gradlew Fib
```

Aquí tienes la versión mejorada y desarrollada usando la sintaxis de Typst:

==== Orden de ejecución de acciones

Las acciones agregadas con `doFirst` se ejecutan en el orden inverso en que se definen (las últimas se ejecutan primero). 
Las acciones agregadas con `doLast` se ejecutan en el orden en que se definen (las primeras se ejecutan primero).

#line(length: 100%)
*Ejercicio: Orden de Ejecución de Acciones*

¿Qué se imprimirá al ejecutar la siguiente tarea?

```
tasks.register("advancedTask") {
    doFirst {
          println("First action - Preparation Step 1")
    }
    doFirst {
          println("First action - Preparation Step 2")
    }
    doLast {
          println("Last action - Cleanup Step 1")
    }
    doLast {
          println("Last action - Cleanup Step 2")
    }
}
```
#line(length: 100%)

=== Dependencia de Tareas

Las tareas pueden depender de otras tareas. 
Esto asegura que las tareas se ejecuten en un orden específico.

```kotlin
tasks.register("cleanAll") {
    // Define una tarea que limpia todos los subproyectos
    dependsOn(":subproject1:clean", ":subproject2:clean", ":subproject3:clean")
}
```

En este ejemplo, la tarea `cleanAll` depende de las tareas `clean` de los subproyectos `subproject1`, `subproject2`, y `subproject3`. 
Esto significa que cuando se ejecuta `cleanAll`, Gradle primero ejecutará las tareas `clean` de cada uno de los subproyectos especificados.

#line(length: 100%)
*Ejercicio: Tamaño del Proyecto*

Crea una tarea de Gradle que calcule el tamaño de su proyecto luego de compilarse. 
Para esto, considera que puedes acceder a los archivos compilados haciendo `project.fileTree("build/classes/kotlin/main").files`. 
Luego, puedes acceder al tamaño del archivo con el método `length()`. 
Incluye un grupo y descripción para tu tarea. 
Tu tarea debe depender de `compileKotlin`.
#line(length: 100%)

Aquí tienes la versión mejorada y desarrollada usando la sintaxis de Typst:

=== Tareas como clases

Supongamos que tenemos que calcular el número de Fibonacci de forma repetida. Podemos definir una clase (abstracta)#footnote[
  Podemos usar una clase abierta, pero tiene más sentido que sea abstracta ya que es abierta por definición y sólo será ocupada para ser extendida.
] para representar familias de tareas.

==== Caso de estudio: Tarea de Fibonacci

```kotlin
abstract class FibonacciTask : DefaultTask() {  // 1
    @get:Input
    abstract val number: Property<Int>  // 2

    @TaskAction // 3
    fun calculateFibonacci() {
        val n = number.get()
        if (n < 0) {
            throw StopExecutionException("The number must be positive")
        }
        var first = 0
        var second = 1
        repeat(n) {
            second += first
            first = second - first
        }
        println("The $n-th Fibonacci number is $first")
    }
}
```

1. *Todas las tareas deben extender de DefaultTask*:
   - Esto asegura que nuestra clase personalizada se comporte como una tarea de Gradle.
2. *Podemos definir inputs para nuestra tarea*:
   - Utilizamos propiedades anotadas con `@Input` para definir los parámetros que nuestra tarea necesitará.
3. *`@TaskAction` marca el código principal que ejecutará la tarea*:
   - Este método contiene la lógica principal que se ejecutará cuando la tarea se ejecute.

==== Registro de Tareas

```kotlin
tasks.register<FibonacciTask>("Fib_10") {
    number.set(10)
}

tasks.register<FibonacciTask>("Fib_20") {
    number.set(20)
}
```

En este ejemplo, registramos dos instancias de la tarea `FibonacciTask`, una para calcular el 10.º número de Fibonacci y otra para el 20.º.

==== Ejecución de Tareas

```powershell
# Windows
.\gradlew.bat Fib_10
.\gradlew.bat Fib_20
```

```bash
# Unix
./gradlew Fib_10
./gradlew Fib_20
```

Para ejecutar las tareas `Fib_10` y `Fib_20`, utiliza el comando `gradlew` seguido del nombre de la tarea correspondiente. En Windows, usa `.\gradlew.bat`, y en Unix, usa `./gradlew`.

#line(length: 100%)
*Ejercicio: Tarea de Fibonacci*

¿Qué imprime el siguiente código?

```kotlin
tasks.register<FibonacciTask>("Fib_10") {
    number.set(10)
    doFirst {
        println("Preparing to calculate the 10th Fibonacci number")
    }
    doLast {
        println("Finished calculating the 10th Fibonacci number")
    }
}
```
#line(length: 100%)

==== Caso de estudio: Procesar archivos de texto

Implementaremos una tarea para procesar archivos de texto. Tendremos archivos de entrada y salida. El texto debe ser tomado de un archivo de texto (input), transformado en mayúsculas y ser guardado en otro archivo de texto (output).


```kotlin
abstract class TextProcessingTask : DefaultTask() {

    @get:InputFile
    abstract val inputFile: RegularFileProperty

    @get:OutputFile
    abstract val outputFile: RegularFileProperty

    @TaskAction
    fun processText() {
        val inputText = inputFile.get().asFile.readText()
        val processedText = inputText.uppercase(Locale.getDefault())
        outputFile.get().asFile.writeText(processedText)
        println(
            "Text has been processed and written to " +
                outputFile.get().asFile.absolutePath
        )
    }
}
```

===== Registro de la Tarea

```kotlin
tasks.register<TextProcessingTask>("processText") {
    inputFile.set(file("src/main/resources/input.txt"))
    outputFile.set(file("build/output.txt"))

    // Acción que se ejecuta antes de la acción principal
    doFirst {
        println(
            "Preparing to process text from ${inputFile.get().asFile.absolutePath}"
        )
    }

    // Acción que se ejecuta después de la acción principal
    doLast {
        println(
          "Finished processing text. Output written to " +
              outputFile.get().asFile.absolutePath
        )
    }
}
```



===== Ejecución de la Tarea

```powershell
# Windows
.\gradlew.bat processText
```

```bash
# Unix
./gradlew processText
```

Para ejecutar la tarea `processText`, utiliza el comando `gradlew` seguido del nombre de la tarea correspondiente. En Windows, usa `.\gradlew.bat`, y en Unix, usa `./gradlew`.

===== Explicación del Código

- *TextProcessingTask*:
  - *`@InputFile` y `@OutputFile`*:
    - Define los archivos de entrada y salida usando las propiedades `RegularFileProperty`.
  - *`@TaskAction`*:
    - Marca el método `processText` como la acción principal de la tarea.
    - Lee el texto del archivo de entrada, lo transforma a mayúsculas y lo escribe en el archivo de salida.

- *Registro de la tarea*:
  - Configura los archivos de entrada y salida.
  - Usa `doFirst` para realizar acciones antes de la tarea principal y `doLast` para acciones después de la tarea principal.