== Introducción al desarrollo de bibliotecas de software

=== APIs

Una API (Application Programming Interface) define bloques de construcción reutilizables que permiten incorporar funcionalidades a una aplicación de manera eficiente y estandarizada.
Las APIs son fundamentales para el desarrollo de software moderno y se proporcionan generalmente mediante bibliotecas.

==== Características de una buena API

===== Modela el Problema

Una API se escribe para solucionar un problema específico y debe proporcionar una buena abstracción de dicho problema.
A continuación, se detallan los principios clave para modelar el problema de manera efectiva:

- *Propósito Claro*: Cada función, clase y variable debe tener un propósito central y claramente definido. Este propósito debe reflejarse en su nombre para que sea intuitivo y fácil de entender por otrxs desarrolladorxs.
- *Consistencia*: Mantén una nomenclatura y estructura consistentes en toda la API. Esto facilita su comprensión y uso, y reduce la posibilidad de errores.

===== Esconde Detalles

La razón principal para escribir una API es ocultar los detalles de la implementación, permitiendo que estos puedan ser modificados sin afectar a lxs clientes que utilizan la API. A continuación, se presentan los principios clave para ocultar los detalles de implementación de manera efectiva:

- *Encapsulación*: Utiliza la encapsulación para restringir el acceso a los detalles internos de la implementación. Mantén las variables y métodos internos privados y expón solo lo necesario a través de métodos públicos.
- *Interfaz Clara*: Proporciona una interfaz clara y bien definida que permita a lxs usuarixs interactuar con la API sin conocer los detalles internos. Esto facilita la comprensión y uso de la API.
- *Separación de Preocupaciones*: Divide la API en módulos o componentes, cada uno con responsabilidades claramente definidas. Esto facilita el mantenimiento y evolución de la API, ya que los cambios en un componente no afectan a otros.

===== Mínimamente completa

Una API debe ser tan pequeña como sea posible para mantener su simplicidad y facilidad de mantenimiento.
A continuación, se presentan los principios clave para lograr una API mínimamente completa:

- *Simplicidad*: Diseña la API con la menor cantidad de elementos públicos necesarios. Cada elemento público aumenta la superficie de mantenimiento y promesas que debes cumplir a largo plazo.
- *No te repitas (DRY)*: Evita la duplicación de funcionalidades. Cada funcionalidad debe implementarse una sola vez y ser reutilizada en lugar de replicarse en diferentes partes de la API.
- *Enfoque en la Esencia*: Identifica y proporciona solo las funcionalidades esenciales que resuelven el problema central de la API.
- *Abstracciones Claras*: Mantén las abstracciones claras y concisas. No añadas métodos o clases innecesarios que no aporten valor significativo a la API.
- *Principio de Responsabilidad Única*: Asegúrate de que cada componente de la API tenga una única responsabilidad claramente definida. Esto ayuda a mantener la API enfocada y reduce la complejidad.

#quote(attribution: [Reddy, 2011])[
  Every public element in your API is a promise—a promise that you'll support that functionality for the lifetime of the API.
]

===== Fácil de Usar

Una API debe ser intuitiva y difícil de usar incorrectamente. Aquí hay algunos principios clave para lograr una API fácil de usar:

#quote(attribution: [Reddy, 2011])[
  It should be possible for a client to look at the method signatures of your API and be able to glean how to use it without any additional documentation.
]

- *Intuitiva*: Los usuarios deben poder entender cómo usar la API simplemente observando las firmas de los métodos, sin necesidad de documentación adicional.
- *Difícil de Usar Mal*: La API debe diseñarse de manera que sea difícil cometer errores al utilizarla. Esto puede lograrse proporcionando valores predeterminados razonables, validando los parámetros y utilizando tipos de datos adecuados.
- *Consistente*: Mantén la consistencia en los nombres, el orden de los parámetros y los patrones utilizados en la API. Esto facilita el aprendizaje y la utilización de la API por parte de los usuarios.
- *Evita Abreviaciones*: Usa nombres completos y claros en lugar de abreviaciones. Las abreviaciones pueden ser confusas y menos descriptivas.
- *Ortogonalidad*: Asegúrate de que los cambios en una parte de la API no afecten otras partes. Las variables públicas y los métodos deben ser independientes entre sí en la medida de lo posible. Los cambios en una variable pública no deberían afectar a otras variables públicas.


===== Alta Cohesión y Bajo Acoplamiento

Para diseñar una API efectiva, es crucial lograr una alta cohesión y un bajo acoplamiento entre sus componentes:

- *Acoplamiento*: Mide el grado de dependencia entre componentes. 
  - *Bajo Acoplamiento*: Es deseable porque implica que los componentes pueden modificarse independientemente sin afectar a otros componentes. Esto facilita la mantenibilidad y la flexibilidad del código.
  
- *Cohesión*: Mide el grado en que las funciones de un componente están relacionadas entre sí.
  - *Alta Cohesión*: Es deseable porque significa que el componente realiza una única tarea o un conjunto de tareas relacionadas de manera eficiente y clara. Los componentes cohesivos son más fáciles de entender, probar y mantener.

Implementar alta cohesión y bajo acoplamiento en el diseño de una API ayuda a crear un sistema más modular, donde los cambios en una parte del sistema tienen un impacto mínimo en otras partes. Esto resulta en un código más robusto, flexible y fácil de mantener.

==== Estable, Documentada y Testeada

Para garantizar la calidad y usabilidad de una API, es fundamental que cumpla con los siguientes criterios:

- *Estabilidad*: 
  - La interfaz de la API debe ser versionada.
  - Los cambios entre versiones no deben ser incompatibles, asegurando así que los clientes de la API puedan actualizar sin problemas.

- *Documentación Completa*: 
  - La API debe estar bien documentada.
  - La documentación debe proporcionar información clara y detallada sobre las capacidades de la API, su comportamiento esperado, mejores prácticas y posibles condiciones de error.
  - La documentación ayuda a los desarrolladores a entender y usar la API de manera efectiva y correcta.

- *Pruebas Automatizadas*: 
  - La implementación de la API debe estar respaldada por un conjunto exhaustivo de pruebas automatizadas.
  - Estas pruebas aseguran que los cambios nuevos no rompan casos de uso existentes, proporcionando confianza en la estabilidad y confiabilidad de la API.

=== Bibliotecas de Software

Claro, aquí tienes una versión mejor

- *Definición*: 
  - También conocidas como librerías.
  - Son colecciones de código precompilado que proporcionan funciones, clases y procedimientos reutilizables.

- *Funcionalidad*: 
  - Facilitan la realización de tareas específicas o comunes en el desarrollo de software.
  - Permiten a lxs desarrolladorxs reutilizar código existente, ahorrando tiempo y esfuerzo.

- *API*:
  - Las bibliotecas exponen una API que define cómo los clientes pueden interactuar con ellas.
  - La API proporciona los bloques de construcción necesarios para integrar la funcionalidad de la biblioteca en aplicaciones más grandes.

Las bibliotecas de software son esenciales para la eficiencia y efectividad en el desarrollo de aplicaciones, proporcionando soluciones probadas y optimizadas para problemas comunes.

==== Bibliotecas vs Aplicaciones

*Bibliotecas:*
- *Funcionalidad*:
  - Proveen funcionalidades específicas y reutilizables.
  - No son ejecutables por sí mismas; requieren ser incluidas en una aplicación.
  - Ofrecen una API para que lxs desarrolladorxs interactúen con sus funcionalidades.

*Aplicaciones:*
- *Propósito*:
  - Resuelven un problema o realizan tareas específicas de principio a fin.
  - Son ejecutables autónomos; pueden funcionar independientemente.
  - Generalmente proporcionan una interfaz de usuario (UI) o una interfaz de línea de comandos (CLI) para que lxs usuarios finales interactúen.

Las bibliotecas y las aplicaciones juegan roles complementarios en el desarrollo de software, con las bibliotecas proporcionando herramientas y funcionalidades reutilizables que las aplicaciones integran y utilizan para cumplir con tareas completas y específicas.

==== Principios de Diseño de Bibliotecas

- *Interfaces Simples y Fáciles de Entender*:
  - Mantén las interfaces de la biblioteca lo más simples posible.
  - Facilita a lxs usuarios la comprensión y el uso de las funcionalidades proporcionadas.

- *Coherencia en Patrones de Diseño*:
  - Sigue patrones de diseño coherentes en toda la biblioteca.
  - Asegura que lxs usuarios puedan predecir el comportamiento y uso de diferentes componentes.

- *Componentes Independientes y Reutilizables*:
  - Diseña componentes que sean independientes entre sí.
  - Facilita la reutilización de componentes en diferentes contextos sin dependencias innecesarias.

- *Extensibilidad*:
  - Permite a los usuarios ampliar la funcionalidad de la biblioteca sin necesidad de modificar el código fuente.
  - Utiliza patrones de diseño como herencia, composición y polimorfismo para ofrecer extensibilidad.

- *Buena Documentación y Ejemplos de Uso*:
  - Proporciona documentación clara y completa.
  - Incluye ejemplos de uso prácticos que muestren cómo utilizar las diferentes funcionalidades de la biblioteca.
  - Asegura que la documentación esté actualizada con cada nueva versión de la biblioteca.
