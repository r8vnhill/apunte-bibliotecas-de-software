== Constructores en Kotlin

Un constructor en Kotlin es un bloque especial de código que se ejecuta durante la creación de una instancia de una clase.
Su función principal es inicializar el objeto recién creado con los datos necesarios o realizar configuraciones iniciales.

Kotlin ofrece dos tipos de constructores: *primarios* y *secundarios*.

=== Constructor Primario

El constructor primario se integra directamente en la declaración de la clase, ofreciendo una forma directa y concisa de inicializar objetos.

```kotlin
class Player(val name: String, var lifePoints: Int)
```

En este ejemplo, `Player` es una clase con un constructor primario que acepta dos parámetros: `name` y `lifePoints`. 
Es importante notar que la visibilidad `public` es la predeterminada en Kotlin y declararla explícitamente es redundante.

==== Bloques `init`

Los bloques `init` son útiles para realizar validaciones o inicializaciones adicionales que no se pueden expresar directamente en los parámetros del constructor.

```kotlin
class Player(val name: String, var lifePoints: Int) {
    init {
        require(lifePoints >= 0) { "Los puntos de vida no pueden ser negativos." }
    }
}
```

Aquí, el bloque `init` garantiza que los puntos de vida no sean negativos en el momento de crear un objeto de tipo `Player`.

=== Constructores Secundarios

Una clase puede tener múltiples constructores, lo cual se realiza utilizando la palabra clave `constructor`.

```kotlin
class Player(val name: String, var lifePoints: Int) {
    init {
        require(lifePoints >= 0) { "Los puntos de vida no pueden ser negativos." }
    }

    constructor() : this("Unknown", 8000) {
        println("New player $name has $lifePoints life points.")
    }
}
```

Un constructor secundario siempre comienza llamando a otro constructor de la clase (usualmente el primario), como se indica con `: this(...)`.

==== Uso de Parámetros por Defecto

Frecuentemente, los constructores secundarios pueden ser reemplazados por parámetros por defecto en el constructor primario para simplificar el código.

```kotlin
class Player(
    val name: String = "Unknown", 
    var lifePoints: Int = 8000
) {
    init {
        require(lifePoints >= 0) { "Los puntos de vida no pueden ser negativos." }
    }
}
```

Este enfoque hace que el código sea más limpio y fácil de mantener, al reducir la cantidad de constructores secundarios necesarios.
