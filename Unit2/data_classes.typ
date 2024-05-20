== Data Classes

Las data classes en Kotlin están diseñadas principalmente para contener datos. 
Estas clases proporcionan automáticamente funcionalidades estándar como `toString()`, `equals()`, `hashCode()`, y `copy()` sin necesidad de implementarlas manualmente.

=== Características de las Data Classes

- *Funcionalidades Automáticas:*Las data classes generan automáticamente métodos como `toString()`, `equals()`, `hashCode()`, y `copy()`.
- *No Heredables:* No pueden ser heredadas, pero pueden ser extendidas mediante funciones de extensión.

=== Ejemplo de una Data Class

```kotlin
data class Person(val name: String, val age: Int)
```

En este ejemplo, `Person` es una data class que tiene dos propiedades: `name` y `age`.

=== Constructor Primario

Las data classes necesitan tener un constructor primario.
Aunque se puede usar `var`, es recomendable utilizar `val` para propiedades inmutables y el método `copy` para crear nuevas instancias con modificaciones.

```kotlin
val person1 = Person("Alice", 29)
val person2 = person1.copy(age = 30)
```

En el ejemplo anterior, `person2` es una copia de `person1` pero con una edad modificada.

=== Descomposición de Data Classes

Las data classes pueden ser descompuestas en sus componentes individuales utilizando la sintaxis de desestructuración.

```kotlin
fun main() {
    val (name, age) = Person("Alice", 29)
    println("name = $name, age = $age") 
}
```

En este ejemplo, la data class `Person` se descompone en las variables `name` y `age`.
