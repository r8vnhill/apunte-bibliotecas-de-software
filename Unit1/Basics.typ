#import "@preview/ctheorems:1.1.2": *

#show: thmrules

#let definition = thmbox("definition", "Definición", inset: (x: 1.2em, top: 1em))

== Lo básico

=== Expresiones vs. Declaraciones

En programación, es crucial distinguir entre *expresiones* y *declaraciones*, ya que cada una juega un papel diferente en la estructura y ejecución de los programas. 
A continuación, se explican estos conceptos en el contexto de Kotlin, aunque es importante notar que en otros lenguajes de programación, como Scala o Rust, los ciclos pueden ser expresiones o los condicionales pueden ser declaraciones.

#definition[Expresiones][
  Las expresiones son fragmentos de código que producen un valor y pueden ser compuestas con otras expresiones. 
  En Kotlin, las expresiones pueden ser tan simples como una constante o tan complejas como una función anónima. 
  Ejemplos comunes de expresiones incluyen operaciones aritméticas, operadores lógicos y llamadas a funciones.
]

#definition[Declaraciones][
  Las declaraciones son fragmentos de código que realizan una acción pero no retornan un valor. 
  En Kotlin, las declaraciones no pueden ser compuestas con otras declaraciones, lo que significa que no pueden ser anidadas. 
  Ejemplos comunes de declaraciones incluyen la asignación de variables, la ejecución de ciclos y la definición de funciones.
]

=== Declaración de funciones

Una función es un bloque de código designado para realizar una tarea específica. 
Está estructurada para ejecutar una secuencia de declaraciones y expresiones, y puede retornar un valor. 
La sintaxis básica para declarar una función en Kotlin se muestra a continuación:

```kotlin
fun functionName(parameter1: Type1, parameter2: Type2, ...): ReturnType {
    // Cuerpo de la función
    return result
}
```
Donde:
- `fun` – Palabra clave utilizada para declarar funciones.
- `functionName` – Nombre de la función que la identifica y permite su invocación.
- `parameter1: Type1, parameter2: Type2, ...` – Parámetros de la función con sus tipos correspondientes.
- `ReturnType` – Tipo de dato que la función retorna al finalizar su ejecución.

A continuación, se presenta un ejemplo de una función simple en Kotlin que suma dos números enteros y retorna el
resultado:
    
```kotlin
fun sum(a: Int, b: Int): Int {
    return a + b
}
```

Como lo que hace la función es retornar un valor, diremos que es una función de una sola expresión. En Kotlin, las
funciones de una sola expresión pueden simplificarse aún más, eliminando las llaves y la palabra clave `return`. El 
ejemplo anterior se puede reescribir de la siguiente manera:

```kotlin
fun sum(a: Int, b: Int): Int = a + b
```

Esta forma más concisa de definir funciones es útil para funciones simples que consisten en una sola expresión.
Si la función es de una expresión, se puede omitir el tipo de retorno y dejar que el compilador lo infiera. Por
ejemplo, la función anterior se puede reescribir de la siguiente manera:

```kotlin
fun sum(a: Int, b: Int) = a + b
```

En este caso, el compilador infiere que la función `sum` retorna un valor de tipo `Int` al sumar los dos parámetros de tipo `Int`. 
La inferencia de tipo es una característica que simplifica la sintaxis en funciones sencillas.
Sin embargo, esta característica no se aplica en funciones que contienen más de una expresión, para evitar ambigüedades y confusiones.

==== Función `main`

El punto de entrada de un programa Kotlin es la función `main`, que es el punto de inicio de la ejecución. 
A continuación, se muestra un ejemplo de cómo la función `main` imprime un mensaje en la consola:

```kotlin
fun main(args: Array<String>): Unit {
    println("Hello, ${args[0]}!")
}
```

En este ejemplo, la función `main` recibe un argumento de tipo `Array<String>` y
utiliza la función `println` para imprimir un mensaje en la consola. 
La interpolación de cadenas en Kotlin se realiza utilizando el signo de dólar `$` seguido por la variable o expresión entre llaves `{}`, permitiendo la inserción directa de valores dentro de las cadenas de texto.
La función `println`, parte de la biblioteca estándar de Kotlin, imprime mensajes en la consola y
automáticamente añade un salto de línea al final de cada mensaje. Las funciones estándar como `println`
están disponibles globalmente sin necesidad de importaciones explícitas.
Cuando una función como `main` no retorna un valor significativo, su tipo de retorno es
`Unit`,
indicando que no hay retorno relevante. Este tipo es similar al `void` en otros lenguajes de
programación.
En Kotlin, el tipo de retorno `Unit` se puede omitir en la declaración de la función, lo que simplifica
la sintaxis, especialmente en funciones que no están destinadas a devolver ningún resultado. Por ejemplo, la
declaración de la función `main` puede omitir `Unit` y quedar de la siguiente manera:

```kotlin
fun main(args: Array<String>) {
    println("Hello, ${args[0]}!")
}
```

Si quisieramos simplificar aún más la función `main`, podemos notar que la función `main` es
de una sola expresión, por lo que podemos eliminar las llaves y la palabra clave `return`</code>:

```kotlin
fun main(args: Array<String>) = println("Hello, ${args[0]}!")
```

=== Declaración de variables

En Kotlin, las variables se declaran con las palabras clave `var` y `val`.
La diferencia entre ambas es que `var` define una variable mutable, es decir, su valor puede cambiar 
en cualquier momento, mientras que `val` define una variable inmutable, cuyo valor no puede ser 
modificado una vez asignado.

La sintaxis básica para declarar una variable en Kotlin es la siguiente:

```kotlin	
val/var variableName: Type = value
```

Donde:
- `val/var` – Palabra clave utilizada para declarar variables inmutables y mutables, respectivamente.
- `variableName` – Nombre de la variable que la identifica y permite su manipulación.
- `Type` – Tipo de dato de la variable.
- `value` – Valor inicial de la variable.

Por ejemplo:

```kotlin
val a: Int = 1 // asignación inmediata
var b = 2      // el tipo `Int` es inferido
b = 3          // Reasignar a `var` es OK
val c: Int     // Tipo requerido cuando no se provee un inicializador
c = 3          // asignación diferida
a = 4          // Error: Val no puede ser reasignado
```

En el ejemplo anterior, la variable `a` es inmutable, por lo que no se puede reasignar después
de su inicialización. Por otro lado, la variable `b` es mutable, lo que permite cambiar su
valor en cualquier momento. Finalmente, la variable `c` es inmutable y se inicializa posteriormente.

Noten que si bien `val` denota una variable inmutable, no significa que el objeto al que hace referencia
sea inmutable. Por ejemplo, si la variable hace referencia a una lista mutable (representada por
`MutableList`), los elementos de la lista pueden ser modificados, aunque la variable en sí no puede ser
reasignada. Por otro lado, si la variable hace referencia a una lista inmutable (representada por
`List`), los elementos de la lista no pueden ser modificados.

==== Declaración de constantes

Además de las variables, Kotlin también facilita la declaración de constantes utilizando la palabra clave `const`.
Las constantes son variables inmutables cuyo valor se define en tiempo de compilación y
permanece constante, sin cambios durante la ejecución del programa. Por ejemplo:

```kotlin
const val NAME = "Kotlin"
const val VERSION = "1.5.21"
```

La declaración de constantes solo es permitida en el ámbito global de un archivo o dentro de un objeto de nivel
superior. No es posible declarar constantes locales dentro de funciones o bloques de código. Además, las constantes
solo pueden ser de tipos primitivos como `Int`, `Double`, `Boolean`, o `String`, y no pueden ser inicializadas con
funciones o expresiones que requieran cálculo en tiempo de ejecución.

En Kotlin, los tipos primitivos son un conjunto de tipos básicos que el sistema maneja de manera más eficiente
debido a su representación directa en la máquina subyacente. A diferencia de muchos otros lenguajes de programación,
Kotlin no tiene tipos primitivos tradicionales como en Java; en cambio, tiene clases envoltorio que corresponden a
los tipos primitivos de Java, pero con una mejor integración en el sistema de tipos de Kotlin. Estos incluyen:

- `Int`: Representa un entero de 32 bits.
- `Double`: Representa un número de punto flotante de doble precisión.
- `Boolean`: Representa un valor verdadero o falso.
- `Long`: Representa un entero de 64 bits.
- `Short`: Representa un entero de 16 bits.
- `Byte`: Representa un byte de 8 bits.
- `Float`: Representa un número de punto flotante de precisión simple.
- `Char`: Representa un carácter Unicode.

Aunque internamente Kotlin maneja estos tipos como objetos para garantizar la compatibilidad con Java y permitir una
programación más segura y versátil, en tiempo de ejecución, Kotlin optimiza el código usando representaciones
primitivas donde es posible, similar a los tipos primitivos en Java. Esta optimización asegura que las operaciones
que involucran tipos numéricos sean rápidas y eficientes.

#line(length: 100%)

*Ejercicio: Cálculo del Área de un Círculo*

1. *Definir la Constante PI*:
   Declara una constante `PI` y asígnale el valor `3.14159`.


2. *Programar la Función `circleArea`*:
   Implementa una función llamada `circleArea` que reciba un parámetro de tipo `Double` 
   representando el radio del círculo y devuelva otro `Double` que sea el área del círculo calculada 
   según la fórmula proporcionada.

   La fórmula para calcular el área de un círculo es la siguiente:

   $
    A(r) = pi times r^2
   $

   Donde:
   - $A(r)$ es el área del círculo.
   - $pi$ es la constante PI.
   - $r$ es el radio del círculo.

3. *Uso de la Función*:
   Una vez definida la función, puedes utilizarla para calcular el área de círculos con diferentes 
   radios. No necesitas manejar radios negativos en esta implementación.

   ```kotlin
   fun main() {
       println("El área de un círculo de radio 5.0 es ${circleArea(5.0)}")
   }
   ```
#line(length: 100%)

=== Expresión `if`

En Kotlin, `if` puede ser utilizado no solo como una declaración de control, sino también como una 
expresión que devuelve un valor. Esto permite que `if` se incorpore directamente en el retorno de 
una función. A continuación, se muestran tres formas de utilizar `if` para definir una función que 
devuelve el mayor de dos números.

==== Forma Tradicional
En esta forma, `if` se utiliza en un estilo similar al de otros lenguajes de programación, donde se 
maneja como una declaración condicional dentro de una función:

```kotlin
fun maxOf(a: Int, b: Int): Int {
    if (a > b) {
        return a
    } else {
        return b
    }
}
```

==== Forma de Expresión con Bloques

Aquí, `if` es usado como una expresión directamente en la declaración de retorno. Esto reduce la 
redundancia y simplifica la función:

```kotlin
fun maxOf(a: Int, b: Int): Int {
    return if (a > b) {
        a
    } else {
        b
    }
}
```

==== Forma de Expresión Simplificada
Esta versión es la más concisa. `If` se utiliza aquí como una expresión inline dentro de la 
declaración de la función. Esta forma es particularmente útil para funciones simples que se pueden 
expresar en una sola línea, mejorando la claridad y concisión:

```kotlin
fun maxOf(a: Int, b: Int) = if (a > b) a else b
```

Cada una de estas formas tiene sus ventajas en diferentes contextos. La elección entre ellas depende
de la complejidad de la función y de la preferencia por la claridad o la concisión en el código.

=== Expresión `when`

La expresión `when` en Kotlin es una forma más flexible y clara de manejar múltiples condiciones 
condicionales, comparada a las cadenas de `if-else`. Funciona de manera similar a `switch` en otros 
lenguajes de programación pero con capacidades superiores.

==== Ejemplo sin Usar `when`

Aquí utilizamos múltiples `if-else` para evaluar y retornar un valor basado en el tipo o valor de 
`obj`:

```kotlin
fun describe(obj: Any) = 
    if (obj == 1) "One"
    else if (obj == "Hello") "Greeting"
    else if (obj is Long) "Long"
    else if (obj !is String) "Not a string"
    else "Unknown"
```	

==== Utilizando `when` con Condiciones sin Argumento

Este enfoque es similar al anterior pero usando `when` sin un argumento específico, permitiendo que 
las condiciones sean expresiones booleanas arbitrarias:

```kotlin
fun describe(obj: Any): String = when {
    obj == 1 -> "One"
    obj == "Hello" -> "Greeting"
    obj is Long -> "Long"
    obj !is String -> "Not a string"
    else -> "Unknown"
}
```

==== Utilizando `when` con Argumento

Aquí, `when` se utiliza de manera más idiomática, con el objeto de la evaluación (`obj`) como 
argumento de `when`, simplificando aún más las condiciones:

```kotlin
fun describe(obj: Any): String = when (obj) {
    1 -> "One"
    "Hello" -> "Greeting"
    is Long -> "Long"
    !is String -> "Not a string"
    else -> "Unknown"
}
```

==== Ventajas de Usar `when`

- *Claridad*: `when` reduce la complejidad visual y mejora la legibilidad, especialmente con 
  múltiples condiciones.
- *Flexibilidad*: `when` permite la evaluación de tipos, valores y condiciones complejas en una
  única estructura controlada.
- *Mantenibilidad*: Código escrito con `when` es generalmente más fácil de modificar que las largas 
  cadenas de `if-else`.

#line(length: 100%)
*Ejercicio: Reescribir usando una expresión `when`*

Reescribe el siguiente código como una función de una expresión que utilice una expresión `when`:

```kotlin
fun login(username: String, passowrd: String): Boolean {
    if (loginAttempts >= MAX_LOGIN_ATTEMPTS) {
        return false
    }
    if (isValidPassword(password)) {
        loginAttempts = 0
        return true
    }
    loginAttempts++
    return false
}
```
#line(length: 100%)

=== Declaración `for`

La declaración `for` en Kotlin es una herramienta poderosa para iterar sobre colecciones y rangos. A
continuación, se presenta cómo se puede utilizar para recorrer diferentes estructuras de datos y 
realizar operaciones sobre sus elementos.

==== Ejemplo Básico: Iteración sobre una Lista

El siguiente ejemplo muestra cómo usar el ciclo `for` para iterar sobre una lista de strings e
imprimir cada elemento:

```kotlin
fun forExample() {
    val items = listOf("apple", "banana", "kiwi")
    for (item in items) {
        println(item)
    }
}
```

*Explicación*:
- `items` es una lista de strings.
- `for (item in items)` inicia un bucle que recorre cada elemento de la lista `items`.
- `println(item)` imprime cada elemento de la lista.

==== Uso Avanzado: Iteración sobre un Rango de Números

Kotlin permite iterar no solo sobre colecciones, sino también sobre rangos de números. Esto es 
especialmente útil para realizar operaciones repetitivas un número específico de veces o para generar 
secuencias numéricas.

```kotlin
fun rangeExample() {
    for (i in 1..5) {
        println(i)
    }
}
```

*Explicación*:
- `for (i in 1..5)` inicia un bucle que recorre los números del 1 al 5, inclusive.
- `println(i)` imprime cada número del 1 al 5.

==== Iteración con Índices

En ocasiones, puede ser útil tener acceso al índice de cada elemento durante la iteración. Kotlin 
facilita esto con la función `withIndex()`.

```kotlin
fun indexExample() {
    val items = listOf("apple", "banana", "kiwi")
    for ((index, value) in items.withIndex()) {
        println("Item at $index is $value")
    }
}
```

*Explicación*:
- `items.withIndex()` devuelve una colección de pares, cada uno compuesto por un índice y el valor correspondiente.
- `for ((index, value) in items.withIndex())` itera sobre estos pares.
- `println("Item at $index is $value")` imprime el índice y el valor de cada elemento en la lista.

=== Declaración `while`

La declaración `while` es fundamental para realizar bucles basados en una condición que necesita ser
evaluada antes de cada iteración del ciclo. Es especialmente útil cuando el número de iteraciones no
se conoce de antemano.

==== Ejemplo Básico: Conteo Regresivo

Aquí, `while` se utiliza para realizar un conteo regresivo desde 5 hasta 1:

```kotlin
fun whileExample() {
    var x = 5
    while (x > 0) {
        println(x)
        x--  // Decrementa x en 1 en cada iteración
    }
}
```

*Explicación*:
- `var x = 5` inicializa una variable `x` con el valor 5.
- `while (x > 0)` continúa el bucle mientras `x` sea mayor que 0.
- `println(x)` imprime el valor actual de `x`.
- `x--` reduce el valor de `x` en 1 después de cada iteración, asegurando que el bucle eventualmente
  terminará cuando `x` sea 0.

==== Ejemplo Avanzado: Búsqueda en Lista

`while` también puede ser útil para buscar un elemento en una lista hasta que se encuentre un elemento específico o se agote la lista:

```kotlin
fun searchExample() {
    val items = listOf("apple", "banana", "kiwi")
    var index = 0
    while (index < items.size && items[index] != "banana") {
        index++
    }
    if (index < items.size) {
        println("Found banana at index $index")
    } else {
        println("Banana not found")
    }
}
```

*Explicación*:
- `while (index < items.size && items[index] != "banana")` sigue iterando mientras el índice sea 
  menor que el tamaño de la lista y el elemento actual no sea "banana".
- `index++` incrementa el índice en cada iteración para revisar el siguiente elemento en la lista.
- La condición de salida del ciclo asegura que no se exceda el límite de la lista y se detenga la búsqueda una vez que se encuentre "banana".

==== Comparación con `do-while`

Es útil comparar `while` con `do-while` para resaltar que `while` evalúa su condición antes de la 
primera iteración del bucle, mientras que `do-while` garantiza que el cuerpo del ciclo se ejecutará 
al menos una vez porque la condición se evalúa después de la ejecución del cuerpo.

```kotlin
fun doWhileExample() {
    var y = 5
    do {
        println(y)
        y--
    } while (y > 0)
}
```

Este ejemplo garantiza que el contenido dentro de `do` se ejecuta al menos una vez, 
independientemente de la condición inicial, lo cual es una distinción crucial en ciertos escenarios 
de programación.

Estas expansiones y discusiones proporcionarán a los estudiantes una comprensión más completa de 
cuándo y cómo usar `while` de manera efectiva en Kotlin.

=== Rangos

En Kotlin, los rangos permiten iterar de manera eficiente y elegante sobre secuencias numéricas. 
Recientemente, se ha introducido el estándar `..<` para crear rangos exclusivos, reemplazando el uso 
más antiguo de `until` en nuevos desarrollos.

==== Ejemplos de Rangos

1. *Rango Inclusivo (`..`)*:
   Este tipo de rango incluye ambos extremos, ideal para situaciones donde se necesita incluir el 
   valor final en las operaciones.

   ```kotlin
   for (i in 1..5) print(i) // Imprime: 12345
   ```

   `1..5` crea un rango que incluye del 1 al 5.

2. *Rango Exclusivo (`..<`)*:
   `..<` se usa para generar rangos que excluyen el valor final, proporcionando una forma directa y 
   legible de definir límites en iteraciones.

   ```kotlin
   for (i in 1..<5) print(i) // Imprime: 1234
   ```
   
   `1..<5` produce un rango desde 1 hasta 4, excluyendo el 5. Esta sintaxis es más intuitiva para 
   quienes están familiarizados con lenguajes como Swift.

3. *Rango Decreciente con Paso (`downTo` con `step`)*:
   Kotlin también permite definir rangos decrecientes con un intervalo específico entre valores, lo que es útil para decrementos no estándar.

   ```kotlin
   for (i in 5 downTo 1 step 2) print(i) // Imprime: 531
   ```

   `5 downTo 1 step 2` crea un rango que empieza en 5 y termina en 1, incluyendo solo cada segundo número (decrementando de dos en dos).

#line(length: 100%)
*Ejercicio: Suma de un Rango de Números*

Desarrolla una función en llamada `sumRange(a: Int, b: Int): Int` que calcule y retorne la suma de 
todos los números entre dos enteros `a` y `b`, incluyendo ambos extremos. 

Instrucciones
1. *Implementación de la Función*: La función debe usar una declaración `for` para iterar a través
  de un rango de números desde `a` hasta `b`.
2. *Manejo de Rangos*: 
   - Si `a` es menor o igual que `b`, el rango debe ir de `a` a `b`.
   - Si `a` es mayor que `b`, el rango debe ir de `a` a `b` en orden inverso (es decir, decreciendo).
#line(length: 100%)
