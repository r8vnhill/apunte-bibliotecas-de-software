== Manejo de Entrada de Usuario en Kotlin

La entrada de usuario es fundamental para los programas interactivos. Kotlin ofrece métodos 
convenientes y seguros para leer la entrada desde la consola, adaptándose a diversas necesidades de 
manejo de entrada.

=== Funciones de Lectura en Kotlin

- *`readlnOrNull()`*: Esta función es la recomendada para leer una línea de entrada. Devuelve un 
  `String?`, que será `null` si no hay más datos disponibles (por ejemplo, si el usuario no 
  introduce nada y presiona Enter). Es segura porque permite manejar los casos de nulos de forma 
  explícita y evita excepciones innecesarias.

- *`readln()`*: Esta función ha sido deprecada en versiones recientes de Kotlin debido a que lanza 
  una excepción si no hay más entrada disponible, lo cual puede conducir a interrupciones no 
  manejadas en el flujo del programa. Se recomienda usar `readlnOrNull()` para evitar estos 
  problemas y escribir un código más robusto y predecible.

=== Ejemplo de Uso de `readlnOrNull()`

A continuación, se muestra cómo utilizar `readlnOrNull()` para leer nombres de usuario de manera 
segura, terminando cuando el usuario no ingresa ningún dato:

```kotlin
fun main() {
    println("Introduce nombres. Presiona solo Enter para terminar.")
    while (true) {
        println("Ingresa un nombre:")
        val input = readlnOrNull()
        if (input.isNullOrEmpty()) {
            println("No se ingresó ningún nombre. Terminando el programa.")
            break  // Interrumpimos el ciclo
        } else {
            println("Nombre ingresado: $input")
        }
    }
}
```

*Explicación del Código*:
- *Loop Infinito*: Se usa un ciclo `while(true)` para pedir repetidamente al usuario que ingrese 
  datos.
- *Lectura Segura*: `readlnOrNull()` se usa para leer la entrada. Si el usuario no introduce nada y 
  presiona Enter, `input` será `null` o vacío, y el programa imprimirá un mensaje de salida y se 
  terminará.
- *Manejo de Entrada Válida*: Si el usuario proporciona una entrada, el programa la muestra y 
  continúa pidiendo más nombres.