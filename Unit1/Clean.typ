== Código limpio y mantenible

- Código fácil de leer y entender:
  - Escribe código que sea claro y comprensible para otros desarrolladores.
  - Usa nombres de variables y funciones descriptivos y significativos.

- Facilita el trabajo en equipo:
  - Un código limpio y bien estructurado mejora la colaboración entre los miembros del equipo.
  - Facilita la revisión de código y la incorporación de nuevos desarrolladores al proyecto.

- Evolución del software a lo largo del tiempo:
  - Un código mantenible permite realizar cambios y agregar nuevas funcionalidades de manera eficiente.
  - Reduce la deuda técnica y el riesgo de introducir errores en el sistema.

=== Impacto en la mantenibilidad

- Otrxs desarrolladorxs pueden entender rápidamente el propósito y funcionamiento del código:
  - Facilita la colaboración y el trabajo en equipo.
  - Permite a nuevxs desarrolladorxs integrarse más rápidamente al proyecto.

- Código más legible reduce la probabilidad de introducir errores:
  - Ayuda a identificar problemas potenciales antes de que se conviertan en errores.
  - Mejora la calidad general del software.

- Código bien estructurado y documentado es más fácil de modificar y mejorar:
  - Facilita la implementación de nuevas funcionalidades.
  - Permite realizar refactorizaciones y mejoras con menor riesgo.
  - Asegura que el conocimiento se mantenga accesible para todo el equipo.

=== Impacto en la escalabilidad

- Código limpio puede adaptarse más fácilmente a nuevos requisitos y cambios:
  - Permite una respuesta ágil a las necesidades del negocio.
  - Facilita la implementación de nuevas características sin comprometer la calidad del código existente.

- Componentes bien definidos y modulares pueden ser reutilizados en diferentes partes del proyecto o en otros proyectos:
  - Fomenta la reutilización del código.
  - Reduce el tiempo de desarrollo al evitar la duplicación de esfuerzos.

- Equipos pueden trabajar de manera más eficiente y productiva, acelerando el desarrollo de nuevas funcionalidades y mejoras:
  - Mejora la colaboración y la distribución de tareas.
  - Minimiza los conflictos y la necesidad de refactorizaciones extensivas.

=== Principios de código limpio

==== Nombres descriptivos

Utilizar nombres que revelen la intención.

Si un nombre requiere un comentario, entonces el nombre no revela la intención adecuadamente.

*Ejemplo con nombres poco descriptivos*:
```kotlin	
fun getThem(theList: List<IntArray>): List<IntArray> {
    val list1 = mutableListOf<IntArray>()
    for (x in theList) {
        if (x[0] == 4) {
            list1.add(x)
        }
    }
    return list1
}
```

*Ejemplo mejorado con nombres descriptivos*:

```kotlin	
fun getFlaggedCells(gameBoard: List<IntArray>): List<IntArray> {
    val flaggedCells = mutableListOf<IntArray>()
    for (cell in gameBoard) {
        if (cell[STATUS_VALUE] == FLAGGED) {
            flaggedCells.add(cell)
        }
    }
    return flaggedCells
}
```

En este último ejemplo:
- `gameBoard` es un nombre que sugiere claramente el contexto.
- `flaggedCells` indica explícitamente lo que se está almacenando en la lista.
- `cell` describe cada elemento de la lista original.

Aquí tienes una versión mejorada y más clara, con la corrección indicada:

Evitar desinformación.

Evitar usar nombres que varíen ligeramente:

*Incorrecto*: `XYZControllerForEfficientHandlingOfStrings` vs `XYZControllerForEfficientStorageOfStrings`

Usar nombres de series como `a1`, `a2`, …, `aN` no es informativo.

*Ejemplo con nombres poco informativos*:
```kotlin
fun copyChars(a1: CharArray, a2: CharArray) {
    for (i in a1.indices) {
        a2[i] = a1[i]
    }
}
```

*Ejemplo mejorado con nombres descriptivos*:
```kotlin
fun copyChars(source: CharArray, destination: CharArray) {
    for (i in source.indices) {
        destination[i] = source[i]
    }
}
```

Las palabras "ruido" son redundantes y deben evitarse:
- *Incorrecto*: `ProductInfo` vs `ProductData`
- *Incorrecto*: `name` vs `theName` vs `aName`
- *Incorrecto*: `nameString`

*Ejemplo de nombres claros y concisos*:
```kotlin
val currentAccount
val activeUserAccounts
val accountDetails
```

Utilizar nombres pronunciables:

#quote(attribution: [Martin, 2009])[
  If you can't pronounce it, you can't discuss it without sounding like an idiot. (…) This matters because programming is a social activity.
]

*Ejemplo con nombre poco pronunciable*:
```kotlin	
// "generation date, year, month, day, hour, minute, and second"
val genymdhms: String = TODO()
```

==== Funciones

- Las funciones deben ser pequeñas.

#quote(attribution: [Martin, 2009])[
  The first rule of functions is that they should be small. The second rule of functions is that they should be smaller than that.
]

- Idealmente, una función no debería tener más de 20 líneas.
- Cada función debe hacer una sola cosa.
  - Una función que hace una sola cosa “no puede” dividirse en secciones.

- El número ideal de argumentos de una función es 0, seguido por 1 y luego 2.
  - Tener 3 o más argumentos debe estar justificado fuertemente.
  - Evitar el uso de argumentos “flag”.

- Las funciones deben hacer algo o responder una pregunta, pero no ambas.

==== Comentarios

#quote(attribution: [Martin, 2009])[
  The proper use of comments is to compensate for our failure to express ourselves in code.
]

- Los comentarios son propensos a errores.
- Es importante mantener los comentarios actualizados.
- Los comentarios deben usarse cuando el código por sí solo no sea suficiente para expresar la intención.

==== Formato de código

- *Archivos pequeños*: Son más fáciles de entender y manejar que archivos gigantes.
- *Orden lógico*: El código generalmente se lee de arriba hacia abajo, por lo que las funciones deben estar organizadas de manera lógica para facilitar la lectura.
- *Estándares de formato*: Es crucial definir y seguir estándares de formato para cada proyecto. Estos estándares aseguran consistencia y legibilidad.
- *Herramientas de análisis estático*: Utilizar herramientas de análisis estático puede ayudar a mantener el formato del código consistente y detectar desviaciones de los estándares establecidos.

Mantener un formato de código coherente y organizado no solo mejora la legibilidad, sino que también facilita la colaboración y el mantenimiento del proyecto a largo plazo.
