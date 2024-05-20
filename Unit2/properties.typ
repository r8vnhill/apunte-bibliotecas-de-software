== Propiedades en Kotlin

- Las propiedades en Kotlin son esencialmente variables que son miembros de una clase.
- Son equivalentes a los campos combinados con sus métodos getter y setter en otros lenguajes de programación como Java.
- Kotlin genera automáticamente getters para las propiedades inmutables y getters y setters para las propiedades mutables.

=== Ejemplo de Propiedad con Getter y Setter Personalizados

```kotlin
class GettersAndSetters {
    var name: String = "John"
        get() { // Getter personalizado
            return field
        }
        set(value) { // Setter personalizado
            field = value
        }
}
```
- `field` se refiere al valor almacenado de la propiedad.

=== Propiedad con Getter como Expresión

```kotlin
class GettersAndSetters {
    var name: String = "John"
        get() = field // Getter como expresión
        set(value) {
            field = value
        }
}
```

=== Propiedad con Getters y Setters por Defecto

```kotlin
class GettersAndSetters {
    var name: String = "John"
}
```
- Este código es equivalente a tener getters y setters por defecto.

=== Propiedad que Calcula su Valor

```kotlin
class GettersAndSetters {
    val now: String
        get() = Clock.System
                     .now()
                     .toString()
}
```
- Esta propiedad no almacena un valor, sino que calcula un valor cada vez que se accede a ella.

=== Propiedad con Setter Privado

```kotlin
class GettersAndSetters(age: Int) {
    var age: Int = age
        private set // Setter privado
}
```
- Podemos restringir la visibilidad del método set.

=== Propiedad con Backing Field

```kotlin
class GettersAndSetters(private var _age: Int) {
    val age: Int
        get() = _age
}
```
- Utilizando un backing field, podemos lograr lo mismo que con un setter privado.

Aquí tienes una versión mejorada y más explicativa del código sobre interfaces con getters y setters en Kotlin:

=== Interfaces con Getters y Setters Personalizados

En Kotlin, las interfaces pueden incluir propiedades con getters y setters personalizados, lo que permite añadir lógica adicional al acceder o modificar dichas propiedades.
A continuación se presenta un ejemplo de una interfaz con getters y setters personalizados.

```kotlin
interface InterfaceWithGettersAndSetters {
    val name: String
        get() {
            println("Getting name")
            return "InterfaceWithGettersAndSetters"
        }
    var age: Int
        get() {
            println("Getting age")
            return 0
        }
        set(value) {
            println("Setting age")
        }
}
```

En este ejemplo, la interfaz `InterfaceWithGettersAndSetters` define dos propiedades: `name` y `age`. 
El getter de `name` imprime un mensaje y devuelve una cadena, mientras que el getter y el setter de `age` imprimen mensajes al acceder o modificar el valor de la propiedad. 
Este enfoque es útil para agregar lógica adicional, como validaciones o registros, al trabajar con propiedades.

La clase `ClassWithGettersAndSetters` implementa esta interfaz y proporciona su propia lógica para los getters y setters. 
Además, utiliza la palabra clave `super` para invocar los getters y setters de la interfaz.

```kotlin
class ClassWithGettersAndSetters : InterfaceWithGettersAndSetters {
    override val name: String
        get() {
            super.name
            return "ClassWithGettersAndSetters"
        }
    override var age: Int = 0
        get() {
            super.age
            return field
        }
        set(value) {
            super.age = value
            field = value
        }
}
```

En la clase `ClassWithGettersAndSetters`, el getter de `name` llama al getter de la interfaz y luego devuelve un valor diferente. 
El getter y el setter de `age` llaman a los métodos correspondientes de la interfaz antes de acceder o modificar el valor del campo respaldado (`field`). 
Este enfoque permite realizar validaciones o cualquier otra lógica adicional antes de completar la operación.
