= Unidad 2: Programación orientada a objetos

#include "Unit2/OOP.typ"
#include "Unit2/Objects.typ"
#include "Unit2/Classes.typ"
#include "Unit2/Lateinit.typ"
#include "Unit2/Encapsulation.typ"
#include "Unit2/Inheritance.typ"
#include "Unit2/Constructors.typ"
#include "Unit2/Interfaces.typ"
#include "Unit2/abstract_classes.typ"
#include "Unit2/open_closed.typ"
#include "Unit2/operator_overloading.typ"
#include "Unit2/properties.typ"
#include "Unit2/Extension.typ"
#include "Unit2/infix.typ"
#include "Unit2/data_classes.typ"
#include "Unit2/companion.typ"
#include "Unit2/enums.typ"

== Respuestas:

*Ejercicio: Implementación de un Gestor de Eventos*

```kotlin
object EventManager {   
    val events = mutableListOf<String>()

    fun addEvent(event: String) {
        events.add(event)
    }

    fun getEvents(): List<String> {
        return events.toList()
    }
}
```

*Ejercicio: Interfaz y Enumeración de Acciones del Juego*

```
class Player(health: Int, mana: Int) {
    var health = health
        private set
    var mana = mana
        private set

    fun increaseHealth(amount: Int) {
        health += amount
    }

    fun decreaseHealth(amount: Int) {
        health -= amount
    }

    fun increaseMana(amount: Int) {
        mana += amount
    }

    fun decreaseMana(amount: Int) {
        mana -= amount
    }
}
```

```
enum class GameEvent : GameAction {
    HEALTH_BOOST {
        override fun execute(player: Player) {
            player.increaseHealth(20)
        }
    },
    MANA_DRAIN {
        override fun execute(player: Player) {
            player.decreaseMana(15)
        }
    },
    POISON {
        override fun execute(player: Player) {
            player.decreaseHealth(10)
        }
    },
    ENERGY_SURGE {
        override fun execute(player: Player) {
            player.increaseMana(20)
        }
    };
}
```
