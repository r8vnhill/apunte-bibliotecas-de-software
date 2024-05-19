== Herencia

La herencia es un principio fundamental de la programación orientada a objetos que permite a una 
clase derivar o heredar propiedades y comportamientos (métodos) de otra clase. Esto establece una 
relación jerárquica entre la clase superior (superclase) y la clase derivada (subclase).

=== Propósito y Beneficios de la Herencia

- *Especialización*: La herencia permite crear nuevas clases a partir de clases existentes, 
  proporcionando un método eficaz para reutilizar y extender el código existente.
- *Reutilización de Código*: Aunque es un efecto secundario, la herencia facilita la reutilización 
  de código, permitiendo que las subclases utilicen métodos y propiedades de la superclase sin 
  necesidad de reescribirlos.
- *Jerarquía de Objetos*: Organiza y estructura el código en una jerarquía natural que refleja 
  relaciones reales entre entidades, facilitando el mantenimiento y la comprensión del código.

La herencia debe usarse con un propósito claro y con coherencia lógica:

- *Relación "Es un(a)"*: La herencia debe reflejar una relación lógica y natural de "es un(a)" 
  entre la superclase y la subclase. Por ejemplo, un `Perro` es un tipo de `Mamífero`, por lo tanto,
  es lógico que `Perro` herede de `Mamífero`.
- *Evitar la Herencia Improcedente*: No se debe utilizar la herencia simplemente para reutilizar
  código si no existe una relación lógica clara. Por ejemplo, decir que un `Perro` es un tipo de 
  `Lobo` solo para reutilizar métodos como `aullar()` es incorrecto, pues aunque ambos pueden 
  compartir comportamientos, son especies distintas con características propias.

