== Funciones de Extensión

Las funciones de extensión en Kotlin permiten añadir nuevas funcionalidades a una clase sin necesidad de heredar de ella o modificar su código original. 
Estas funciones no modifican la clase extendida de ninguna manera y se resuelven estáticamente, lo que significa que no forman parte de la clase real.

Es importante notar que, si la clase original ya tiene un método con la misma firma que la función de extensión, el método original tendrá preferencia sobre la función de extensión.

=== Ejemplo de una Función de Extensión

```kotlin
fun String.replaceSpaces(replacement: String): String {
    return this.replace(" ", replacement)
}
```

En este ejemplo, estamos extendiendo la clase `String` con una nueva función `replaceSpaces`.
 La palabra clave `this` se refiere a la instancia de `String` sobre la que se llama la función.

=== Uso de la Función de Extensión

Una vez definida, la función de extensión puede ser llamada como si fuera un método miembro de la clase.

```kotlin	
fun main() {
    val text = "Hello World"
    println(text.replaceSpaces("_"))
}
```

En este caso, la función `replaceSpaces` se llama sobre una instancia de `String`, reemplazando todos los espacios en blanco por guiones bajos.

=== Limitaciones de las Funciones de Extensión

Es importante tener en cuenta que las funciones de extensión no pueden acceder a los miembros protegidos o privados de la clase que están extendiendo. 
Esto asegura que no se violen los principios de encapsulación y acceso seguro a los datos.

=== Operadores de Extensión

Al igual que con las funciones de extensión, Kotlin permite definir operadores de extensión, que son operadores personalizados añadidos a las clases existentes.

==== Definición de un Operador de Extensión

```kotlin
operator fun String.times(n: Int): String = this.repeat(n)
```

En este ejemplo, estamos extendiendo la clase `String` con el operador de multiplicación (`*`).
Este operador utiliza la función `repeat` para repetir la cadena `n` veces.

==== Uso del Operador de Extensión

Una vez definido, el operador de extensión puede ser utilizado como cualquier otro operador nativo de la clase.

```kotlin
fun main() {
    val text = "Hello"
    println(text * 3)  // Output: HelloHelloHello
}
```

En este caso, el operador `*` se utiliza para repetir la cadena `"Hello"` tres veces.


=== Propiedades de Extensión

En Kotlin, también es posible definir propiedades de extensión, lo que permite añadir nuevas propiedades a las clases existentes sin modificar su código fuente.
Estas propiedades se implementan mediante getters y setters.

==== Definición de Propiedades de Extensión

Las propiedades de extensión permiten añadir nuevas propiedades a las clases existentes de manera similar a como se añaden nuevas funciones.

```kotlin
val String.wordCount: Int
    get() = this.split("""\s+""".toRegex()).size
```

En este ejemplo, se define una propiedad de extensión `wordCount` para la clase `String`, que cuenta el número de palabras en la cadena dividiéndola por espacios en blanco.

==== Propiedades de Extensión con Getter y Setter

También es posible definir propiedades de extensión con un setter, permitiendo modificar el valor de la propiedad.

```kotlin
var MutableList<String>.firstElement: String
    get() = this[0]
    set(value) {
        this[0] = value
    }
```

En este caso, se añade una propiedad de extensión `firstElement` a la clase `MutableList<String>`, que permite acceder y modificar el primer elemento de la lista.

==== Uso de Propiedades de Extensión

Una vez definidas, las propiedades de extensión pueden ser utilizadas como cualquier otra propiedad miembro de la clase.

```kotlin
fun main() {
    val text = "Hello World"
    println(text.wordCount)  // Output: 2

    val list = mutableListOf("Apple", "Banana", "Cherry")
    println(list.firstElement)  // Output: Apple
    list.firstElement = "Apricot"
    println(list.firstElement)  // Output: Apricot
}
```

En este ejemplo, la propiedad `wordCount` se utiliza para contar las palabras en una cadena, y la propiedad `firstElement` se utiliza para acceder y modificar el primer elemento de una lista mutable.
