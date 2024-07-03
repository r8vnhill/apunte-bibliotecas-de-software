== Publicación de bibliotecas

La publicación de bibliotecas es el proceso de distribuir un conjunto de funcionalidades empaquetadas en un archivo para que otrxs desarrolladorxs puedan utilizarlas en sus proyectos. 
Este proceso facilita la reutilización de código, promueve la colaboración y fomenta el desarrollo de software modular.

=== Beneficios

- *No reinventar la rueda*:
  - Permite a los desarrolladores reutilizar funcionalidades ya implementadas, reduciendo el tiempo y esfuerzo necesarios para desarrollar nuevas aplicaciones.
- *Mejora de la calidad del software*:
  - Utilizar bibliotecas probadas y mantenidas ayuda a mejorar la calidad del software, ya que se basan en soluciones robustas y bien documentadas.
- *Facilitación de actualizaciones y mejoras centralizadas*:
  - Facilita la implementación de actualizaciones y mejoras de manera centralizada, asegurando que todos los proyectos que utilizan la biblioteca se beneficien de las mejoras y correcciones.

=== Proceso de Publicación

1. *Compilación de la biblioteca*:
   - Asegurarse de que el código fuente de la biblioteca se compila correctamente sin errores.
2. *Generación de artefactos*:
   - *JAR* en el caso de Java/Kotlin/Scala.
   - *Wheels* para Python.
   - *Static Library (lib)*, *Shared Library (dll/so/dylib)* en C++.
   - *RubyGems* con Ruby.
3. *Subida a un repositorio o plataforma de distribución*:
   - Por ejemplo, GitHub Releases, GitHub Packages, Maven Central.

=== Documentación

Una biblioteca sin una documentación clara es “desechable”. Una buena documentación facilita el entendimiento y uso de la biblioteca por otrxs desarrolladorxs, ahorra tiempo y recursos al reducir la necesidad de soporte y consultas frecuentes, y mejora la adopción de la biblioteca, ya que los desarrolladores prefieren usar herramientas bien documentadas.

==== Documentación inadecuada

- Lxs usuarixs pueden encontrar difícil entender cómo utilizar la biblioteca correctamente.
- Incrementa los errores y malentendidos, lo que lleva a una percepción negativa de la biblioteca.
- Reducción en la tasa de adopción, ya que lxs desarrolladorxs buscarán alternativas mejor documentadas.

==== Buena documentación

- Proporciona una visión general de cómo instalar y comenzar a usar la biblioteca.
- Incluye ejemplos de código que muestran cómo utilizar las funciones y características principales.
- Documenta todas las funciones, clases y métodos disponibles en la biblioteca con descripciones detalladas.
- Explica cómo la biblioteca puede resolver problemas específicos con ejemplos concretos.
- Aborda preguntas comunes y problemas que los usuarios pueden encontrar.

==== Buenas prácticas

- Mantén un estilo y formato consistente en toda la documentación.
- Asegúrate de que la documentación se mantenga actualizada con las nuevas versiones de la biblioteca.
- Evita el uso de jerga técnica innecesaria y sé claro y directo en las explicaciones.
- Recoge y actúa sobre el feedback de los usuarios para mejorar la documentación.

==== Herramientas

Herramientas como Javadoc (Java), KDoc y Dokka (Kotlin), Sphinx (Python), entre otros, pueden ayudar a generar documentación a partir del código fuente. Publica la documentación en plataformas accesibles como GitHub Pages, Read the Docs, o sitios web dedicados.

==== Documentación eficaz

- Cómo instalar la biblioteca y un ejemplo simple de uso.
- Ejemplos prácticos de diferentes funcionalidades de la biblioteca.
- Detalles de todas las funciones, métodos y clases disponibles, con ejemplos de uso.
- Respuestas a preguntas comunes y soluciones a problemas típicos.

=== Configuración del proyecto

Utilizaremos la librería Echo de la sección anterior.
Publicaremos la biblioteca como un _release_ en GitHub y como una dependencia en GitHub Packages.

Lo primero que necesitamos es convertir nuestra librería en un proyecto de git.
Luego, debemos crear un repositorio en GitHub para nuestro proyecto.
NO haremos _push_ todavía, ya que necesitamos configurar algunas cosas antes de hacerlo.

1. *Inicializar un Repositorio Git*:
   - Abre tu terminal y navega hasta el directorio de tu proyecto.
   - Ejecuta `git init` para inicializar un nuevo repositorio git.

2. *Crear un Repositorio en GitHub*:
   - Ve a #link("https://github.com")[GitHub] y crea un nuevo repositorio.
   - Sigue las instrucciones para crear un nuevo repositorio. 
   - Asegúrate de no inicializarlo con un README, ya que ya tienes archivos en tu proyecto local.

Aquí tienes la versión mejorada y desarrollada usando la sintaxis de Typst:

==== Dokka

Dokka es una herramienta de generación de documentación para proyectos Kotlin. Similar a Javadoc para Java, Dokka convierte comentarios de documentación en código Kotlin en HTML, Markdown y otros formatos de salida.

```properties
# gradle.properties
# ...
dokka.version=1.9.20
```

```kotlin
// settings.gradle.kts
/* ... */
pluginManagement {
    /* ... */
    plugins {
        /* ... */
        id("org.jetbrains.dokka") version extra["dokka.version"] as String
    }
}
```

```kotlin
// echoLib/build.gradle.kts
import org.jetbrains.dokka.gradle.DokkaTask

plugins {
    /* ... */
    id("org.jetbrains.dokka")
}

val dokkaVersion = extra["dokka.version"] as String

dependencies {
    dokkaHtmlPlugin("org.jetbrains.dokka:kotlin-as-java-plugin:$dokkaVersion")
}

val dokkaHtml by tasks.getting(DokkaTask::class)
/* ... */
```

````kotlin
/**
 * Returns the input string as it is.
 *
 * This function takes a string as input and returns the same string without any 
 * modifications.
 *
 * ## Usage:
 * ```
 * val text = "Hello, world!"
 * val result = id(text)
 * // result == "Hello, world!"
 * ```
 * 
 * @param text The input string to be returned.
 * @return The same input string.
 */
fun id(text: String) = text

````

Para generar la documentación, ejecuta el siguiente comando:

```powershell
# Windows
.\gradlew.bat :echoLib:dokkaHtml
```

```bash
# Unix
./gradlew :echoLib:dokkaHtml
```

#figure(
  image("../img/dokka_1.png", width: 25%),
  caption: [Documentación compilada por Dokka, con `index.html` como punto de entrada.]
)

#figure(
  image("../img/dokka_2.png", width: 60%),
  caption: [Documentación de la función `id` generada por Dokka.]
)

=== Publicación en GitHub

Puedes encontrar información sobre cómo publicar tu biblioteca usando GitHub en el siguiente enlace:
  https://ravenhill.pages.dev/ccxxxx/lessons/build-systems-iv
