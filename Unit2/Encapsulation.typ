
== Encapsulamiento

Técnica de ocultamiento de los datos de un objeto de manera que solo se pueda cambiar mediante las funciones definidas para ese objeto
Restringe el acceso directo a algunos de los componentes del objeto

*Modificadores de visibilidad*

#table(
  columns: (auto, auto),
  align: horizon,
  table.header(
    "Modificador", "Visibilidad"
  ),
  `public`, [Accesible desde cualquier parte del código],
  `private`, [Accesible solo desde la clase que lo contiene],	
  `protected`, [Accesible desde la clase que lo contiene y sus subclases],
  `internal`, [Accesible solo desde el módulo que lo contiene]
)