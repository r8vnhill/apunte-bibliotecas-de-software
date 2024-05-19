== Interfaces

Una interfaz define un contrato que debe ser cumplido por las clases que la implementan. 
Las interfaces especifican qué métodos y propiedades debe implementar una clase, sin proporcionar 
una implementación completa.

=== Características de las Interfaces

- *No instanciables:* No se pueden crear instancias directamente de una interfaz.
- *Sin estado:* Las interfaces no almacenan estado.

=== Definición de una Interfaz

Aquí tienes un ejemplo de una interfaz simple en Kotlin, que define propiedades de solo lectura:

```kotlin
interface ReadPlayer {
    val name: String
    val lifePoints: Int
}
```

=== Extensión de Interfaces

Las interfaces pueden heredar de otras interfaces. En este caso, una interfaz extendida puede 
sobreescribir las propiedades de la interfaz base para cambiar sus características, como convertir 
una propiedad de solo lectura en una propiedad mutable.

```kotlin
interface ReadWritePlayer : ReadPlayer {
    override var lifePoints: Int
}
```

=== Aspectos Importantes de la Herencia y Sobrescritura

- *Herencia:* Se declara usando el operador `:` después del nombre de la interfaz.
- *Sobrescritura explícita:* En Kotlin, cualquier miembro de una interfaz que se sobrescribe en una 
  subinterfaz o en una clase implementadora debe ser marcado explícitamente con la palabra clave 
  `override`.

=== Ejemplo Práctico

Aquí un ejemplo de cómo una clase puede implementar `ReadWritePlayer`:

```kotlin
class Player(override val name: String, override var lifePoints: Int) : ReadWritePlayer {
    fun updateLifePoints(points: Int) {
        lifePoints += points
    }
}
```

Este código define una clase `Player` que implementa la interfaz `ReadWritePlayer`.
La clase proporciona una implementación concreta para las propiedades definidas en la interfaz y agrega un método adicional para actualizar los puntos de vida del jugador.
