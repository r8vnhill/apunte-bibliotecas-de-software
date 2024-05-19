== Clases

Una clase en programación es un modelo o plantilla que define las características y comportamientos 
de los objetos. En Kotlin, una clase sirve para crear objetos específicos, definiendo sus 
propiedades (atributos) y sus capacidades (métodos).

Consideremos una clase `Player` para un juego. Esta clase define dos propiedades básicas para un 
jugador: su nombre y sus puntos de vida.

```kotlin
class Player {
    var name: String = ""
    var lifePoints: Int = 8000
}
```

Para utilizar esta clase en Kotlin, crearemos una instancia de `Player` y asignaremos valores a sus 
propiedades. Luego, accederemos a estas propiedades para realizar operaciones, como imprimir el 
estado del jugador.

```kotlin
fun main() {
    val player = Player()  // Creación de un objeto de tipo Player
    player.name = "Seto Jaiva"  // Asignación de nombre al jugador
    player.lifePoints = 7000  // Asignación de puntos de vida

    // Impresión de los datos del jugador
    println("El jugador ${player.name} tiene ${player.lifePoints} puntos de vida")
}
```
