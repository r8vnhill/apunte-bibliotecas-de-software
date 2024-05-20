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
