== Sobrecarga de Operadores

La sobrecarga de operadores es una funcionalidad de algunos lenguajes de programación que permite a lxs desarrolladorxs definir implementaciones personalizadas para los operadores estándar como `+`, `-`, `*`, `/`, entre otros. 
En Kotlin, esto se logra mediante el uso de la palabra clave `operator` seguido de `fun`, indicando que se está definiendo una función que actúa como un operador.

=== Cómo Funciona

Para sobrecargar un operador, se declara una función miembro o una función de extensión con el prefijo `operator`.
El nombre de la función debe corresponder a una de las funciones de operador predefinidas en Kotlin, como `plus`, `minus`, `times`, etc.

=== Ejemplo Práctico

Consideremos un ejemplo con un tipo de dato definido por el usuario, `Complex`, que representa un número complejo. 
Queremos permitir que estos números complejos se puedan sumar utilizando el operador `+`. 
Aquí está cómo podríamos implementar esto:

```kotlin
class Complex(val real: Double, val imaginary: Double) {
    operator fun plus(other: Complex) = 
        Complex(real + other.real, imaginary + other.imaginary)
}
```

En este ejemplo:
- `Complex` es una clase que almacena dos propiedades: `real` e `imaginary`.
- `plus` es una función miembro que sobrecarga el operador `+`. 
  Toma otro objeto `Complex` como parámetro y devuelve un nuevo objeto `Complex` cuyo valor real e imaginario es la suma de los valores correspondientes de los dos números complejos.

=== Uso

Gracias a la sobrecarga de operadores, podemos usar el operador `+` de forma natural con instancias de `Complex`:

```kotlin
val number1 = Complex(1.0, 2.0)
val number2 = Complex(3.0, 4.0)
val sum = number1 + number2
println("Sum: (${sum.real}, ${sum.imaginary})")
```

=== Consideraciones

Al diseñar clases que sobrecarguen operadores, es importante mantener el comportamiento intuitivo y esperado. 
Por ejemplo, asegurarse de que la operación sea conmutativa si eso tiene sentido para el tipo de datos, como es el caso de la suma de números complejos.
