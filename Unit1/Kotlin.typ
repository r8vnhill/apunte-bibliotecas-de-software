== Kotlin

Kotlin es un lenguaje de programación multiplataforma, desarrollado por JetBrains, que integra características
de la programación orientada a objetos y funcional. Es conocido por su sintaxis concisa y capacidad para
compilar no solo en JavaScript (JS) y WebAssembly (WASM) para ejecución en navegadores, sino también en Java
Virtual Machine (JVM) para servidores y aplicaciones Android, así como en LLVM para aplicaciones de escritorio
y sistemas embebidos.

En este curso, nos centraremos en la programación en Kotlin para la JVM, que es la plataforma más utilizada para
este lenguaje. Sin embargo, los conceptos y técnicas que aprenderás son ampliamente aplicables a otras
plataformas que soporta Kotlin y pueden ser útiles incluso en el aprendizaje de otros lenguajes de programación modernos.


=== A Taste of Kotlin

A continuación, te presentamos un ejemplo simple de Kotlin para darte una idea de cómo se ve y se siente el
lenguaje.

```kotlin
data class Person(        // (1)
    val name: String,
    val age: Int? = null  // (2)
)

fun main() {
    val persons = listOf( // (3)
        Person("Harrier Du Bois"),
        Person("Kim Kitsuragi", age = 43) // (4)
    )
    val youngest = persons.minByOrNull { it.age ?: Int.MAX_VALUE }  // (5)
    println("The youngest is: $youngest") // (6)
}
// Output: The youngest is: Person(name=Kim Kitsuragi, age=43)
```

1. Declara una clase de datos `Person` con dos propiedades: `name` de tipo `String` y `age` de tipo `Int` opcional.
2. La propiedad `age` tiene un valor predeterminado de `null`.
3. Declara una lista inmutable de personas con dos elementos.
4. El segundo elemento de la lista tiene un valor de edad nombrado de 43.
5. Encuentra la persona más joven en la lista utilizando `minByOrNull` y el operador de elvis `?:`.
6. Interpola la variable `youngest` en una cadena y la imprime en la consola.
