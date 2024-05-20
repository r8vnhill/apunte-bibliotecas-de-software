== Funciones Infijas

Las funciones infijas en Kotlin permiten llamar a una función sin usar un punto y paréntesis, haciendo el código más legible.
Estas funciones solo requieren un argumento y tienen ciertos requisitos para ser definidas.

=== Requisitos para Funciones Infijas

- Debe ser miembro de una clase o una extensión de una clase.
- Debe tener un solo parámetro.
- Debe estar marcada con el modificador `infix`.

=== Ejemplo de Función Infija en una Clase

```kotlin
class Point(val x: Int, val y: Int) {
    infix fun shift(dx: Int) = Point(x + dx, y)
}
```

En este ejemplo, `shift` es una función infija que desplaza el punto en el eje x por una cantidad `dx`.

```kotlin
fun main() {
    val point = Point(1, 2)
    val newPoint = point shift 3
    println("Point shifted to x=${newPoint.x}, y=${newPoint.y}")
}
```

En el código anterior, la función infija `shift` se llama sin paréntesis, haciendo el código más conciso y legible.

=== Ejemplo de Función Infija como Extensión

También es posible definir funciones infijas como extensiones de una clase.

```kotlin
class Point(val x: Int, val y: Int)

infix fun Point.shift(dx: Int) = Point(x + dx, y)
```

Aquí, `shift` se define como una función de extensión infija para la clase `Point`.

```kotlin
fun main() {
    val point = Point(1, 2)
    val newPoint = point shift 3
    println("Point shifted to x=${newPoint.x}, y=${newPoint.y}")
}
```

Este ejemplo demuestra cómo se puede usar una función infija de extensión de manera similar a una función infija miembro de una clase.
