== Clases abstractas

Una clase abstracta es un tipo de clase que no está completa por sí misma; es decir, no puede ser instanciada directamente.
Estas clases son útiles como base para otras clases, permitiendo compartir métodos y propiedades comunes mientras se obliga a las clases derivadas a implementar ciertos métodos.

=== Características de las Clases Abstractas

- *No Instanciables:* A diferencia de las clases regulares, no puedes crear instancias de una clase abstracta directamente.
- *Pueden Tener Estado:* A diferencia de las interfaces, las clases abstractas pueden tener propiedades con estado.
- *Uso como Tipo:* Generalmente, se recomienda no usar clases abstractas como tipo en parámetros, retornos de funciones o variables, para promover el uso de interfaces y favorecer la composición sobre la herencia.
- *Nomenclatura:* Como buena práctica, se sugiere que el nombre de una clase abstracta comience con la palabra `Abstract` para clarificar su propósito y naturaleza.

=== Definición de una Clase Abstracta

Aquí tienes un ejemplo de una clase abstracta que implementa la interfaz `ReadWritePlayer` y declara un método abstracto:

```kotlin
abstract class AbstractPlayer(
  override val name: String,
  override var lifePoints: Int
) : ReadWritePlayer {
    abstract fun attack(player: ReadWritePlayer)
}
```

=== Métodos Abstractos

- *Declaración Explícita:* Todos los métodos abstractos deben ser declarados explícitamente como tal. 
  No tienen una implementación en la clase abstracta y deben ser implementados por cualquier clase no abstracta que herede de esta.

=== Ejemplo de Implementación

Una clase que extiende `AbstractPlayer` podría verse así:

```kotlin
class Warrior(name: String, lifePoints: Int) : AbstractPlayer(name, lifePoints) {
    override fun attack(player: ReadWritePlayer) {
        player.lifePoints -= 10  // Simula un ataque restando puntos de vida
    }
}
```

Este ejemplo muestra cómo una clase concreta `Warrior` implementa el método `attack` definido en `AbstractPlayer`. 
Al hacerlo, proporciona la funcionalidad específica para el método abstracto.
