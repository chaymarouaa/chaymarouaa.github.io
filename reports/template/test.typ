#set page(
  paper: "a4",

  header: context [
    #text(size: 8pt)[CHAYMA ROUAA]
    #h(1fr)
    #text(size: 8pt)[PLANTIGRADE ROBOT]

    #v(4pt)

    #line(
      length: 100%,
      stroke: 0.5pt,
    )
  ],

  footer: context [
    #line(
      length: 100%,
      stroke: 0.5pt,
    )

    #v(4pt)

    #text(size: 8pt)[TECHNICAL REPORT]
    #h(1fr)
    #text(size: 8pt)[#counter(page).display()]
  ],
)

= Test

This is a test.

#pagebreak()

= Second page

This is the second page.