== Análisis Estático

El análisis estático de código es un método crítico utilizado en el desarrollo de software para 
examinar el código fuente sin ejecutarlo. Esta técnica contrasta con el análisis dinámico, que
analiza el programa en ejecución. El análisis estático se realiza generalmente con herramientas
especializadas diseñadas para inspeccionar automáticamente el código en busca de errores y problemas
de calidad.

=== Objetivos del Análisis Estático

1. *Detección Temprana de Errores*: Identificar y corregir errores de programación tempranamente
  en el ciclo de desarrollo, como uso incorrecto de tipos, referencias nulas y violaciones de
  sintaxis. Esto ayuda a prevenir fallos en etapas posteriores del desarrollo o después de la
  implementación del software.

2. *Cumplimiento de Estándares*: Asegurar que el código fuente cumpla con estándares de programación 
  y mejores prácticas establecidas. Esto incluye convenciones de codificación, estructuras de datos 
  adecuadas y uso eficiente de patrones de diseño, lo cual mejora la legibilidad y mantenibilidad 
  del código.

3. *Seguridad*: Descubrir y mitigar vulnerabilidades de seguridad potenciales. Al analizar el
  código en busca de patrones conocidos de riesgos de seguridad, las herramientas de análisis
  estático ayudan a proteger la aplicación contra ataques y fallos de seguridad.

=== Detekt

_Detekt_ es una herramienta de análisis estático robusta y configurable diseñada específicamente 
para el lenguaje de programación Kotlin. Es ampliamente utilizada para mejorar la calidad del código
identificando problemas relacionados con la complejidad del código, estilo de codificación, posibles 
bugs y patrones de código no recomendados.

*Características Principales*

1. *Configuración Flexible*: Detekt ofrece opciones de configuración extensas que permiten 
  personalizar el análisis según las necesidades específicas de cada proyecto. Esto incluye 
  habilitar o deshabilitar ciertas reglas y modificar los umbrales de complejidad del código.

2. *Reglas Predefinidas y Personalizables*:
   - Viene con un amplio conjunto de reglas predefinidas que cubren varios aspectos del desarrollo 
    de software, desde el estilo de codificación hasta la complejidad del código y los riesgos de 
    seguridad.
   - Lxs desarrolladorxs pueden crear y añadir sus propias reglas personalizadas, lo que permite 
    adaptar Detekt a las políticas de codificación específicas de un equipo o empresa.

3. *Identificación de Problemas de Calidad de Código*: Analiza el código para detectar
  antipatrones, uso ineficiente de la sintaxis de Kotlin, redundancias, complejidad innecesaria y 
  otros problemas que pueden degradar la calidad del código.

Detekt se puede ejecutar como una tarea independiente desde la línea de comandos o integrarse en el 
ciclo de vida del build de Gradle. Esto facilita su incorporación en procesos de integración 
continua y revisión de código automatizada.

- En sistemas Unix:
  ```bash
  ./gradlew detekt
  ```

- En sistemas Windows:
  ```powershell
  .\gradlew.bat detekt
  ```
