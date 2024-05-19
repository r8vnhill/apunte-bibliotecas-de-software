== Objetos

En Kotlin, la palabra clave `object` se usa para declarar un objeto singleton. 
Este patrón es útil para casos donde se necesita una única instancia global de una clase para 
coordinar acciones a través del sistema.

```kotlin
object Dice {
    val sides = 6

    fun roll() = (1..sides).random()
}
```

#line(length: 100%)
*Ejercicio: Implementación de un Gestor de Eventos*

Desarrolla un objeto llamado `EventManager`, que se encargue de administrar una lista de eventos. 
Cada evento será representado como una cadena de texto (`String`).

Requisitos:
1. *Estructura de Datos:* Utiliza un `MutableList<String>` para almacenar los eventos. 
    La lista puede ser inicializada utilizando `mutableListOf()`.

2. *Métodos Requeridos:*
   - *Agregar Evento:* Define un método `addEvent(String)` que permita añadir un nuevo evento a la lista.
   - *Obtener Eventos:* Define un método `getEvents(): List<String>` que retorne una copia inmutable de la lista de eventos.
    Puedes utilizar el método `toList()` para crear una copia de la lista mutable.

Ejemplo de uso:

```kotlin
fun main() {
    EventManager.addEvent("Concierto de Rock")
    EventManager.addEvent("Festival de Cine")
    
    println(EventManager.getEvents())  
    // Debería imprimir: ["Concierto de Rock", "Festival de Cine"]
}
```

_Nota: Por ahora no te preocupes de la visibilidad de los métodos y variables._
#line(length: 100%)