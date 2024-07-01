#import "@preview/ctheorems:1.1.2": *

#show: thmrules

#let definition = thmbox("definition", "Definición", inset: (x: 1.2em, top: 1em))

= Unidad 1: Introducción

#include "Unit1/Intro.typ"
#include "Unit1/Kotlin.typ"
#include "Unit1/Basics.typ"
#include "Unit1/NullSafety.typ"
#include "Unit1/Input.typ"
#include "Unit1/Clean.typ"

== Respuestas

*Ejercicio: Cálculo del Área de un Círculo*

```kotlin
const val PI = 3.14159

fun circleArea(radius: Double): Double = PI * radius * radius
```

*Ejercicio: Reescribir usando una expresión `when`*

```kotlin	
fun login(username: String, password: String): Boolean = when {
    loginAttempts >= MAX_LOGIN_ATTEMPTS -> false
    isValidPassword(password) -> {
        loginAttempts = 0
        true
    }
    else -> {
        loginAttempts++
        false
    }
}
```

*Ejercicio: Suma de un Rango de Números*

```kotlin
fun sumRange(a: Int, b: Int): Int {
    var sum = 0
    if (a <= b) {
        for (i in a..b) {
            sum += i
        }
    } else {
        for (i in a downTo b) {
            sum += i
        }
    }
    return sum
}
```

*Ejercicio: Procesamiento de Temperaturas de Ciudades*

```kotlin
fun main() {
    val temperaturasPorCiudad = mapOf(
        "Madrid" to 22,
        "París" to null,
        "Berlín" to 18,
        "Roma" to null,
        "Londres" to 15
    )
    for ((ciudad, temperatura) in temperaturasPorCiudad) {
        val temperaturaFormateada = temperatura?.toString() ?: "Temperatura no disponible"
        println("La temperatura en $ciudad es: $temperaturaFormateada")
    }
}
```
