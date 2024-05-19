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

*Ejercicio: Uso de `lateinit` y `Delegates.notNull` en la Clase Configuration*

```kotlin	
class Configuration {
    lateinit var serverUrl: String
    var timeout: Int by Delegates.notNull()

    fun printConfiguration() {
        if (::serverUrl.isInitialized) {
            try {
                println("Server URL: $serverUrl, Timeout: $timeout")
            } catch (e: IllegalStateException) {
                println("Timeout has not been initialized.")
            }
        } else {
            println("Server URL has not been initialized.")
        }
    }
}
```

*Ejercicio: Sistema de Gestión de Vehículos*

```kotlin
interface Vehicle {
    val owner: String
    val brand: String
}

abstract class AbstractVehicle(override val owner: String) : Vehicle

class Diablo(owner: String) : AbstractVehicle(owner) {
    override val brand = "Lamborghini"
}

class Punto(owner: String) : AbstractVehicle(owner) {
    override val brand = "Fiat"
}
```	