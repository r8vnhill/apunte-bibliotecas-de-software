#import "template.typ": *
#import "@preview/ctheorems:1.1.2": *
#show: thmrules


// Take a look at the file `template.typ` in the file panel
// to customize this template and discover how it works.
#show: project.with(
  title: "Diseño e implementación de bibliotecas de software",
  authors: (
    (name: "Ignacio Slater Muñoz", email: "reachme@ravenhill.cl"),
  ),
)

#let definition = thmbox("definition", "Definición", inset: (x: 1.2em, top: 1em))

#set quote(block: true)
#set raw(lang: "kotlin")
#show raw.where(block: true): block.with(
  fill: luma(240),
  inset: 10pt,
  radius: 4pt,
)

#outline(depth: 3, indent: true)

#include "opening.typ"
#include "unit1.typ"
#include "unit2.typ"

#bibliography("memes2.bib", full: true, title: "Bibliografías")