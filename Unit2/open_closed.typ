== Clases Abiertas y Cerradas

=== Problema de la Base Frágil (Fragile Base Class Problem)

Este problema surge cuando cambios en una clase base causan que las clases derivadas dejen de funcionar correctamente. 
Una causa común es la sobreescritura no intencionada de miembros de la clase base, lo que puede alterar el comportamiento esperado de las clases derivadas.

Joshua Bloch, en su obra "Effective Java", resume este desafío con la frase: “Design and document for inheritance or else prohibit it”. 
Esto sugiere que las clases deberían diseñarse con la herencia en mente o, de lo contrario, limitar quién puede extender de ellas para prevenir problemas.

=== Clases Abiertas y Cerradas

- *Clase Abierta:* En Kotlin, una clase es abierta a la extensión (puede ser heredada) solo si se marca explícitamente con la palabra clave `open`.
- *Clase Cerrada o Final:* Una clase es cerrada o final si no permite extensión. Esta es la configuración por defecto en Kotlin para evitar el problema de la base frágil inadvertidamente.

==== Métodos en Clases Abiertas

Los métodos en una clase abierta que se pueden sobreescribir deben ser marcados también como `open`. 
Por el contrario, los métodos en una clase cerrada no necesitan esta marca, ya que no pueden ser heredados.

==== Clases y Métodos Abstractos

Las clases y métodos abstractos son intrínsecamente abiertos porque esperan ser completados en las clases derivadas.

=== Ejemplos de Clases Abiertas y Cerradas

*Clase Abierta:*

```kotlin
// Esta clase es abierta, así que puede ser heredada.
open class UniversityStudent(
    name: String,
    val university: String
) : AbstractStudent(name) {
    override fun study() {
        println("Studying at $university")
    }

    open fun party() {
        println("Partying at $university")
    }
}
```

*Clase Cerrada:*

```kotlin
// Esta clase es cerrada, así que no puede ser heredada.
class PhDStudent(
    name: String,
    university: String,
    val thesisTopic: String
) : UniversityStudent(name, university) {
    override fun study() {
        println("I'm studying a lot!")
    }

    override fun party() {
        println("I'm too busy to party!")
    }
}
```

En el ejemplo de `PhDStudent`, se demuestra cómo una clase derivada puede sobrescribir métodos de su clase base abierta, pero al mismo tiempo, se declara como final para prevenir más herencia.
