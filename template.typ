// The project function defines how your document looks.
// It takes your content and some metadata and formats it.
// Go ahead and customize it to your liking!
#let project(title: "", authors: (), logo: none, body) = {
  // Set the document's basic properties.
  set document(author: authors.map(a => a.name), title: title)
  set page(numbering: "1", number-align: center)
  set text(font: "Linux Libertine", lang: "en")
  set heading(numbering: "1.1.")

  // Title page.
  // The page can contain a logo if you pass one with `logo: "logo.png"`.
  v(0.6fr)
  align(center, text(4em, weight: 700, title))
  v(16em)

  if logo != none {
    align(center, image(logo, width: 100%))
  }
  // Author information.16
  pad(
    top: 2em,
    right: 20%,
    grid(
      columns: (1fr,) * calc.min(3, authors.len()),
      gutter: 1em,
      ..authors.map(author => align(start)[
        *#author.name* \
        #author.email
      ]),
    ),
  )
  v(2.4fr)
  pagebreak()


  // Main body.
  set par(justify: true)

  body
}