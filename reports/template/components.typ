// TECHNICAL REPORT TEMPLATE
// 
// -> COMPONENTS


// Key Result

#let key-result(title, body) = {
  block(
    width: 100%,
    fill: rgb("#84c6d637"),
    stroke: (left: 2pt + rgb("#28606ed0")),
    inset: 12pt,
    radius: 4pt,
  )[
    #text(
      weight: "bold",
      size: 9pt,
    )[#title]

    #v(4pt)

    #body
  ]
}


// Design Decision 

#let design-decision(title, body) = {
  block(
    width: 100%,
    fill: luma(98%),
    stroke: 0.5pt + luma(80%),
    inset: 12pt,
    radius: 4pt,
  )[
    #text(
      weight: "bold",
      size: 9pt,
    )[#title]

    #v(4pt)

    #body
  ]
}


// Specification Table

#let spec-table(columns, ..rows) = {
  table(
    columns: columns,
    stroke: 0.5pt + luma(80%),
    inset: 7pt,
    align: left,

    ..rows.pos(),
  )
}