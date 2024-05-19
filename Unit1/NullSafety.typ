
== Null-Safety
=== El Problema de los Punteros Nulos

Los punteros o referencias nulas han sido denominados "el error de mil millones de dólares" por Tony
Hoare, quien introdujo el concepto de valores nulos. Este problema ocurre cuando una variable que se 
espera que contenga una referencia a un objeto en realidad contiene un valor nulo, lo que lleva a 
errores en tiempo de ejecución cuando se intenta acceder a métodos o propiedades de dicho objeto.

=== Motivación

El manejo inadecuado de valores nulos puede causar una serie de errores en tiempo de ejecución que 
son difíciles de detectar y corregir, especialmente en grandes bases de código. Estos errores pueden 
comprometer la robustez y la seguridad de las aplicaciones. Por lo tanto, la gestión eficaz de los 
valores nulos es un aspecto crítico del diseño del software.

=== Enfoques en Diferentes Lenguajes

- *Java*: Tradicionalmente, Java ha permitido referencias nulas y lxs desarrolladores deben chequear 
  explícitamente si una variable es nula antes de usarla. Esto puede llevar a mucho código de 
  validación redundante y a veces se pasa por alto, resultando en `NullPointerException`.
  
- *C\#*: Introduce el concepto de tipos anulables y no anulables. Los tipos de referencia son no 
  anulables por defecto, pero pueden ser declarados como anulables con un signo de interrogación 
  (`?`) después del tipo.
  
- *Scala*: Utiliza el concepto de `Option` para manejar valores nulos de manera segura. Un `Option` 
  puede contener un valor (`Some`) o no contener nada (`None`), lo que obliga a los desarrolladores a 
  manejar explícitamente ambos casos.


El problema con los approach de otros lenguajes como Scala es que todos los valores pueden ser nulos, lo que no garantiza la seguridad en tiempo de ejecución. Por ejemplo, una aplicación en Scala podría
contener la siguiente línea de código:

```scala
var option: Option[String] = None
```

Esto impondrá la restricción de que para trabajar con `option`, se debe manejar explícitamente el caso en que no contenga un valor. Pero hay un malentendido común en torno a este enfoque: aunque `Option` es una forma segura de manejar valores nulos, no garantiza que los valores no sean nulos. En otras palabras, `Option` no elimina la posibilidad de `NullPointerException`, sino que la traslada a un nivel superior de abstracción.

```scala
var option: Option[String] = null
```

En este caso, `option` es nulo, lo que significa que el problema de los valores nulos no se ha resuelto, sino que se ha trasladado a la abstracción de `Option`. Por lo tanto, aunque `Option` es una mejora con respecto a los punteros nulos tradicionales, no es una solución completa al problema de los valores nulos.
Para mejorar y clarificar la sección sobre cómo Kotlin maneja la nulabilidad, es crucial enfocar la redacción para que sea precisa, concisa y directamente informativa. Aquí te ofrezco una versión revisada de tu texto que corrige algunos errores tipográficos y mejora la claridad del mensaje:

=== Solución en Kotlin: Seguridad de Tipos frente a Nulos

Kotlin introduce un sistema de tipos que distingue claramente entre referencias que pueden ser nulas
y aquellas que no pueden serlo. Esto evita los errores comunes de `NullPointerException` que son 
frecuentes en muchos otros lenguajes de programación.

==== Tipos no nullables y nullables

En Kotlin, las variables son no nulables por defecto. Esto significa que no puedes asignar `null` a 
una variable a menos que se declare explícitamente como nullable. Para declarar una variable 
nullable, añade `?` al tipo de la variable.

```kotlin
var a: String = "Definitivamente no nulo"
var b: String? = "Posiblemente nulo"
a = null // Error de compilación: tipo no nulable
b = null // Permitido: tipo nulable
```

En el ejemplo anterior:
- `a` es una variable de tipo `String`, que no puede ser nula. Intentar asignar `null` resulta en un 
  error de compilación.
- `b` es una variable de tipo `String?`, que puede ser nula. Kotlin permite asignar `null` a este    
  tipo sin problema.

==== Inferencia de tipos y nulabilidad

Kotlin también soporta la inferencia de tipos, lo que permite omitir la declaración explícita del 
tipo cuando este puede ser inferido del contexto. Sin embargo, la inferencia de tipos no cambia las 
reglas de nulabilidad:

```kotlin
var c = "Hola" // Tipo inferido como String, no nullable
c = null // Error de compilación: `c` es inferido como no nullable
```

En este caso:
- `c` es automáticamente inferido como `String` debido a la asignación inicial y, por defecto, no admite `null`.

==== Llamadas Seguras en Kotlin

En Kotlin, el manejo de variables que pueden ser nulas es fundamental debido al sistema de tipos 
diseñado para prevenir `NullPointerExceptions`. El compilador de Kotlin obliga a lxs desarrolladores 
a tratar las nulidades de manera explícita, asegurando que los accesos a variables nullables se 
manejen adecuadamente antes de su uso.

*Comprobación de Nulos Obligatoria:*

Para acceder a una propiedad o método de un objeto que podría ser nulo, Kotlin *no permite* 
simplemente hacerlo sin verificar si el objeto no es nulo. Si se intenta, el código no compilará, 
lo que obliga a manejar estas situaciones para garantizar la seguridad del programa:

```kotlin
val a: String? = TODO()
if (a != null) {
    println(a.length) // Acceso seguro porque se ha comprobado que 'a' no es nulo.
} else {
    println("a es nulo")
}
```

En este código:
- `a` es una variable que puede ser nula (`String?`).
- `TODO()` es una instrucción que significa "voy a implementar esto más tarde", es útil para 
  ejemplos, pero no debe usarse en producción ya que siempre arrojará un error.
- Se utiliza una instrucción `if` para comprobar explícitamente que `a` no es nulo antes de acceder
  a su propiedad `length`.
- Este enfoque asegura que no se lanzará un `NullPointerException`.

*Sintaxis de Llamadas Seguras*

Para simplificar el manejo de nulos, Kotlin ofrece el operador de llamada segura (`?.`). Este 
operador permite realizar una operación sobre un objeto solo si no es nulo, de lo contrario devuelve
`null`, evitando así el error en tiempo de ejecución:

```kotlin
println(a?.length) // Evalúa a 'null' y no hace nada si 'a' es nulo.
```

Este fragmento de código:
- Evalúa `a?.length`: si `a` no es nulo, devuelve la longitud; si `a` es nulo, devuelve `null`.
- `println` imprimirá el resultado, que será `null` si `a` es nulo.

*Operador Elvis en Kotlin*

El operador Elvis (`?:`) en Kotlin es una herramienta eficiente para manejar valores nulos en 
expresiones. Funciona evaluando la primera parte de la expresión (a la izquierda del operador) y, si
el resultado no es nulo, lo retorna directamente. Si es nulo, evalúa y retorna la segunda parte de
la expresión (a la derecha del operador).

El operador Elvis permite proporcionar un valor por defecto para expresiones que puedan resultar en
nulo, reduciendo así la necesidad de bloques condicionales explícitos en el código. La expresión a
la derecha del operador solo se evalúa si la expresión de la izquierda es nula, lo que lo hace 
eficiente en términos de rendimiento.

```kotlin
val a: String? = TODO()
val l = a?.length ?: -1
```

En este ejemplo:
- `a?.length` intenta obtener la longitud de `a`. Si que `a` es nulo, esta parte de la expresión 
  también evaluaría a nulo.
- `?: -1` se activaría debido a que el resultado de la primera parte es nulo, y por lo tanto, el
  operador Elvis retorna `-1`.

Este patrón es especialmente útil cuando se necesita un valor por defecto para evitar valores nulos
 en el flujo de un programa.

_Detalles Importantes:_

- *Evaluación de Cortocircuito*: El operador Elvis realiza una evaluación de cortocircuito similar
  a los operadores lógicos en muchos lenguajes de programación. Esto significa que si la parte 
  izquierda de la expresión es no nula, la parte derecha no se evalúa en absoluto.
- *Uso en Cadenas de Llamadas Seguras*: El operador Elvis es particularmente útil en combinación
  con llamadas seguras (`?.`), permitiendo manejar cadenas de métodos o propiedades que podrían ser
  nulas de una manera muy concisa y legible.

#line(length: 100%)
*Ejercicio: Procesamiento de Temperaturas de Ciudades*

Desarrolla un programa que maneje y procese información sobre temperaturas de diferentes ciudades,
que pueden o no estar disponibles (null).

1. *Datos de Entrada*:
   - Define un diccionario (`Map<String, Int?>`) donde cada clave es el nombre de una ciudad y cada 
     valor asociado es la temperatura registrada en esa ciudad, que puede ser nula si no se ha 
     registrado correctamente.

2. *Procesamiento de Datos*:
   - Itera sobre el diccionario usando un bucle. Durante la iteración, utiliza llamadas seguras 
     para verificar si las temperaturas son nulas.

3. *Salida del Programa*:
   - Imprime el nombre de cada ciudad junto con su temperatura. Si la temperatura es nula, imprime 
     el mensaje: `Temperatura no disponible.`
#line(length: 100%)