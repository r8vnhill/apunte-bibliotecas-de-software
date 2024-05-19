
== Null-safety: Inicialización tardía

A veces no es posible inicializar una variable en el momento de su declaración sin comprometer la 
limpieza del código o la eficiencia. Para estos casos, Kotlin ofrece dos herramientas útiles: 
`lateinit` y `Delegates.notNull()`.

=== Uso de `lateinit`

- *Propósito*: La palabra clave `lateinit` permite declarar variables no nulas que serán
  inicializadas posteriormente. Es especialmente útil cuando una variable depende de inyección de
  dependencias o configuración inicialización que no está disponible en el momento de la creación
  del objeto.
- *Aplicabilidad*: Solo se puede usar con variables de tipos que son inherentemente no nullables
  y que no son primitivos (como `Int`, `Float`, etc.).
- *Verificación*: Puedes verificar si una variable `lateinit` ha sido inicializada mediante
  `::variable.isInitialized` antes de acceder a ella para evitar errores en tiempo de ejecución.

```kotlin
class Player {
    lateinit var name: String  // Declaración de una variable que se inicializará más tarde

    fun initializePlayer(name: String) {
        this.name = name
    }
}
```

=== Uso de `Delegates.notNull()`

- *Propósito*: `Delegates.notNull()` es una forma de crear una propiedad que debe ser inicializada
  eventualmente, y se utiliza cuando las variables son de tipo primitivo o cuando `lateinit` no es
  aplicable.

- *Comportamiento*: Acceder a una propiedad delegada por `notNull()` antes de su inicialización
  lanzará una `IllegalStateException`, indicando que la propiedad no ha sido inicializada.

```kotlin
class Player {
    var lifePoints: Int by Delegates.notNull()  // Delegación para asegurar la inicialización antes de uso
}
```

#line(length: 100%)
*Ejercicio: Implementación de un Perfil de Usuario*

Desarrolla una clase `UserProfile` que administre la información de un usuario, utilizando inicialización tardía para ciertos campos.

Descripción de la Clase:
- *Campos con Inicialización Tardía:* La clase `UserProfile` debe incluir dos campos que se inicializarán tardíamente:
  - `username`: Una cadena de texto (`String`) que representa el nombre de usuario.
  - `age`: Un entero (`Int`) que representa la edad del usuario.
- *Requisitos Funcionales:*
  - *Función de Visualización de Información:* Define una función `displayUserInfo()` dentro de la clase que:
    - Imprima los datos del usuario (nombre de usuario y edad) si ambos campos han sido inicializados.
    - Muestre un mensaje de error si el nombre de usuario no se ha inicializado
#line(length: 100%)