== Enumeraciones

Vamos a desarrollar un sistema para una tienda en línea que necesita manejar distintos estados de pedidos:

- Pendiente
- Pagado
- Enviado
- Entregado
- Cancelado

=== Primer Enfoque: Strings

```
fun handleOrderState(state: String) = when (state) {
    "Pending" -> println("Order is pending")
    "Paid" -> println("Order is paid")
    "Shipped" -> println("Order is shipped")
    "Delivered" -> println("Order is delivered")
    "Cancelled" -> println("Order is cancelled")
    else -> println("Unknown state")
}
```

=== Problemas con el uso de Strings

Usar strings o enteros para representar estados puede llevar a varios problemas:

- *Errores en tiempo de ejecución*: Debido a valores inválidos o mal escritos, los estados pueden no ser manejados correctamente.
- *Manejo complicado*: El manejo de múltiples estados con estructuras de control puede volverse complicado y propenso a errores si los estados o las transiciones cambian.
- *Falta de verificación en tiempo de compilación*: No hay una verificación en tiempo de compilación para las transiciones de estado, lo que puede resultar en errores difíciles de detectar.

```
fun main() {
    handleOrderState("Delibered") // Estado incorrecto
}
``` 

=== Segundo Enfoque: Enumeraciones

Una enumeración (`enum`) es un tipo de dato especial que permite a los desarrolladores definir variables que pueden tomar uno de un conjunto fijo de constantes predefinidas.
Las enumeraciones mejoran la legibilidad del código y reducen errores, al garantizar que las variables solo puedan contener uno de los valores definidos en el enum.
Cada elemento de una enumeración puede actuar como una instancia de la enumeración.

==== Ventajas de las Enumeraciones

- *Seguridad de Tipos*: Aseguran que solo se puedan asignar valores válidos a las variables del tipo enumerado, evitando errores en tiempo de ejecución.
- *Legibilidad del Código*: Proporcionan nombres significativos para un conjunto de constantes, mejorando la claridad del código.
- *Mantenibilidad*: Facilitan la actualización y mantenimiento del código, ya que los valores válidos están centralizados y son fácilmente auditables.

==== Definición de Enumeraciones

Las enumeraciones se definen usando la palabra clave `enum class`.
Aquí un ejemplo simple:

```kotlin
enum class Bool { TRUE, FALSE }
```

Este `enum` define un tipo `Bool` que puede tener uno de dos valores: `TRUE` o `FALSE`.

==== `when` exhaustivo

Un `when` es exhaustivo cuando cubre todas las posibilidades lógicas para la expresión que se está evaluando.
Para enumeraciones, Kotlin fuerza que el `when` sea exhaustivo.

```kotlin
enum class DeliveryState {
    PENDING, PAID, SHIPPED, DELIVERED, CANCELLED
}
```

En el siguiente ejemplo, el `when` es exhaustivo porque cubre todos los posibles valores de la enumeración `DeliveryState`:

```kotlin
fun handleOrderState(state: DeliveryState) = when (state) {
    DeliveryState.PENDING -> println("Order is pending")
    DeliveryState.PAID -> println("Order is paid")
    DeliveryState.SHIPPED -> println("Order is shipped")
    DeliveryState.DELIVERED -> println("Order is delivered")
    DeliveryState.CANCELLED -> println("Order is cancelled")
    else -> println("Unknown state")  // Este else es redundante si el when es exhaustivo
}
```

Cuando el `when` es exhaustivo, el bloque `else` puede ser omitido:

```kotlin
fun handleOrderState(state: DeliveryState) = when (state) {
    DeliveryState.PENDING -> println("Order is pending")
    DeliveryState.PAID -> println("Order is paid")
    DeliveryState.SHIPPED -> println("Order is shipped")
    DeliveryState.DELIVERED -> println("Order is delivered")
    DeliveryState.CANCELLED -> println("Order is cancelled")
}
```

Aquí tienes un ejemplo de uso en el método `main`:

```kotlin
fun main() {
    handleOrderState(DeliveryState.PENDING)
    handleOrderState(DeliveryState.PAID)
    handleOrderState(DeliveryState.SHIPPED)
    handleOrderState(DeliveryState.DELIVERED)
    handleOrderState(DeliveryState.CANCELLED)
}
```

En este código, la función `handleOrderState` maneja todos los posibles estados de un pedido utilizando un `when` exhaustivo, asegurando que no haya estados no manejados.

Aquí tienes la versión mejorada del texto:

==== Métodos en enumeraciones

Las enumeraciones pueden tener métodos abstractos que deben ser sobrescritos por cada uno de los casos de la enumeración.
También pueden tener métodos concretos que serán heredados por cada uno de los elementos.

```kotlin
enum class DeliveryState {
    PENDING {
        override fun signal() = "Order is pending"
    },
    PAID {
        override fun signal() = "Order is paid"
    },
    SHIPPED {
        override fun signal() = "Order is shipped"
    },
    DELIVERED {
        override fun signal() = "Order is delivered"
    },
    CANCELLED {
        override fun signal() = "Order is cancelled"
    }; // El ; es necesario si hay métodos o propiedades en la enumeración

    abstract fun signal(): String

    // Método concreto heredado por todos los elementos de la enumeración
    fun isFinalState() = this == DELIVERED || this == CANCELLED
}
```

En este ejemplo, cada estado de la enumeración `DeliveryState` sobrescribe el método abstracto `signal`, proporcionando un mensaje específico para cada estado.
Además, la enumeración tiene un método concreto `isFinalState` que determina si el estado es final (es decir, `DELIVERED` o `CANCELLED`).
Este método concreto es heredado por todos los elementos de la enumeración.


Aquí tienes la versión mejorada del texto:

==== Herencia en enumeraciones

Las enumeraciones pueden implementar interfaces, pero no pueden ser heredadas.

```kotlin
// Definición de la interfaz State
interface State {
    fun signal(): String
}
```

```kotlin
// Implementación de la interfaz State por la enumeración DeliveryState
enum class DeliveryState : State {
    PENDING {
        override fun signal() = "Order is pending"
    },
    PAID {
        override fun signal() = "Order is paid"
    },
    SHIPPED {
        override fun signal() = "Order is shipped"
    },
    DELIVERED {
        override fun signal() = "Order is delivered"
    },
    CANCELLED {
        override fun signal() = "Order is cancelled"
    };

    // Método concreto heredado por todos los elementos de la enumeración
    fun isFinalState() = this == DELIVERED || this == CANCELLED
}
```

En este ejemplo, la enumeración `DeliveryState` implementa la interfaz `State`, lo que obliga a cada uno de los estados de la enumeración a sobrescribir el método `signal`.
Además, la enumeración incluye un método concreto `isFinalState` que determina si el estado es final (es decir, `DELIVERED` o `CANCELLED`).
Este método concreto es heredado por todos los elementos de la enumeración.

```
fun handleOrderState(state: DeliveryState) = if (state.isFinalState()) {
    println("Final state: ${state.signal()}")
} else {
    println("Non-final state: ${state.signal()}")
}
```

Se puede acceder a todas las entradas con entries

```
fun listOrderStates() = DeliveryState.entries.forEach { println(it) }
```

Puedo “buscar” un enum con valueOf, si el valor no existe se arroja una excepción

```
fun getOrderState(name: String) = DeliveryState.valueOf(name)
```

#line(length: 100%)

*Ejercicio: Interfaz y Enumeración de Acciones del Juego*

Implementa una interfaz `GameAction`, una clase `Player` y una enumeración `GameEvent` que representen las acciones de un juego.

*Instrucciones:*

1. *Interfaz `GameAction`*:
   - Define una interfaz `GameAction` que incluya un método `execute(player: Player)`.
   - El método `execute` debe afectar al estado de un jugador de acuerdo con el tipo de evento.

2. *Clase `Player`*:
   - Crea una clase `Player` que contenga dos propiedades: `healthPoints` y `manaPoints`.
   - La clase debe incluir métodos para aumentar y disminuir los puntos de salud (`healthPoints`) y los puntos de maná (`manaPoints`) en una cantidad dada.
   - No es necesario considerar casos de borde ni validaciones de datos.

3. *Enumeración `GameEvent`*:
   - Crea una enumeración `GameEvent` que implemente la interfaz `GameAction`.
   - Cada constante de la enumeración debe sobrescribir el método `execute` y definir cómo afecta al jugador.

#line(length: 100%)

Aquí tienes una versión mejorada de la sección sobre las limitaciones de las enumeraciones:

==== Limitaciones de las Enumeraciones

- *Datos Asociados*: Los `enum` no pueden tener datos asociados específicos de instancia sin definirlos de manera estática para todos los estados. Esto significa que no puedes agregar información dinámica a cada instancia sin complicar el diseño.
- *Información Dinámica*: Tienen una capacidad limitada para manejar información dinámica, como un identificador de seguimiento para el estado `SHIPPED`. No es posible asignar datos específicos de instancia sin definirlos estáticamente para todos los estados.
- *Métodos Abstractos y Propiedades*: Aunque los `enum` pueden tener métodos abstractos que los estados individuales implementan, agregar nuevos métodos o propiedades que solo se aplican a algunos estados puede volverse complicado y menos intuitivo. Esto puede llevar a un diseño inconsistente y difícil de mantener.
- *Complejidad del Manejo del Estado*: Si el manejo del estado se vuelve más complejo y requiere más lógica y datos, mantener todo dentro de una definición de `enum` puede hacer que la clase sea demasiado pesada y difícil de mantener. En tales casos, es mejor considerar el uso de otras estructuras de datos más flexibles, como clases selladas.

Estas limitaciones pueden hacer que el uso de enumeraciones no sea la mejor opción para sistemas con estados muy dinámicos o complejos.