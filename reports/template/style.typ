
// TECHNICAL REPORT TEMPLATE 
//
// -> STYLE


// Page 

#let page-setup = {
  set page(
    paper: "a4",
    margin: (
      top: 20mm,
      bottom: 20mm,
      left: 22mm,
      right: 22mm,
    ),
  )
}

// Header & Footer

#set page(
  header: context {
      grid(
        columns: (1fr, auto),

        text(
          size: 8pt,
          weight: "bold",
          fill: rgb("#28606ed0"),
        )[CHAYMA ROUAA],

        text(
          size: 8pt,
          fill: rgb("#28606ed0"),
        )[PLANTIGRADE ROBOT],
      )

      v(4pt)

      line(
        length: 100%,
        stroke: 0.5pt + luma(85%),
      )
    },

    footer: context {
      grid(
        columns: (1fr, auto),

        text(
          size: 8pt,
          fill: rgb("#28606ed0"),
        )[TECHNICAL REPORT],

        text(
          size: 8pt,
          fill: rgb("#28606ed0"),
        )[
          #counter(page).display("1")
        ],
      )
    },
)

// Typography 

#let typography = {
  set text(
    size: 10.5pt,
  )

  set par(
    justify: true,
    leading: 0.65em,
    spacing: 0.8em,

  )
}

// Colors 

#let black = rgb("#111111")
#let grey = rgb("#666666")
#let light-grey = rgb("#F3F3F3")


#let accent = rgb("#28606ed0")

// Headings 

#let headings = {
  set heading(numbering: "1.1")

  show heading.where(level: 1): it => {
    v(1.5em)
    text(
      fill: accent,
      weight: "bold",
      size: 9pt,
    )[#numbering(it.numbering, it.counter.at(it.location()))]

    v(0.3em)

    text(
      fill: black,
      weight: "bold",
      size: 20pt,
    )[ #it.body ]

    v(0.6em)
  }

  show heading.where(level: 2): it => {
    v(0.8em)

    text(
      fill: black,
      weight: "bold",
      size: 13pt,
    )[ #numbering(
      it.numbering,
      it.counter.at(it.location()),
    )
    #h(0.4em)
    #it.body ]

    v(0.3em)
  }
}