== Companion Object

Un `companion object` es un objeto que es común a todas las instancias de una clase. 
Está vinculado a la clase en sí misma en lugar de a sus instancias. 
Los `companion objects` proporcionan un lugar para almacenar propiedades y funciones que son lógicamente parte de una clase, pero que no requieren que se cree una instancia de la clase para ser accedidos.

=== Características del Companion Object

- *Acceso Estático:* Permite acceder a propiedades y métodos sin necesidad de instanciar la clase.
- *Extensión de Interfaces:* Pueden extender interfaces o clases, aunque esto es poco común.
- *No Heredados:* No son heredados por las subclases.

=== Ejemplo de Uso

```kotlin
class Number(val value: Int) {
    operator fun plus(other: Number) = Number(value + other.value)

    companion object {
        fun add(a: Int, b: Int) = Number(a + b)
    }
}
```

En este ejemplo, la clase `Number` tiene un `companion object` que contiene una función estática `add`.
Esta función puede ser llamada sin crear una instancia de `Number`.

```kotlin
fun main() {
    val a = Number(10)
    println("10 + 5 = ${a + Number(5)}")
    println("10 + 5 = ${Number.add(10, 5)}")
}
```

En el código anterior, se muestra cómo utilizar tanto la función de operador `plus` como la función estática `add` definida en el `companion object`.
