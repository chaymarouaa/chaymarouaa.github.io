#import "style.typ": *
#import "components.typ": *

#page-setup
//#header-footer
#typography
#headings


// -> COVER


#align(center)[

  #v(25mm)

  #text(
    size: 10pt,
    weight: "bold",
    fill: accent,
  )[TECHNICAL b REPORT]

  #v(8mm)

  #text(
    size: 30pt,
    weight: "bold",
  )[Plantigrade Robot]

  #v(4mm)

  #text(
    size: 16pt,
    fill: grey,
  )[Chebyshev Linkage]

  #v(15mm)

  // #image("assets/hero.png", width: 90%)

  #v(20mm)

  #text(
    size: 10pt,
    fill: grey,
  )[

    Mechanical Engineering | Robotics | CAD

    #v(3mm)

    Chayma Rouaa

    #v(2mm)

    August 2026
  ]
]


#pagebreak()


= Project Overview

== Context

This project investigates the design and implementation
of a small plantigrade walking mechanism based on a
Chebyshev linkage.

== Objectives

The main objectives are:

- Design the mechanism using CAD.
- Analyze its kinematic behavior.
- Select an appropriate actuator.
- Manufacture the mechanism using additive manufacturing.
- Validate the theoretical trajectory experimentally.

//#key-result(
//  "KEY RESULT",
//  [
//    The final mechanism was designed around a
//    target motor speed of *10–20 rpm*.
//  ],
//)
//

= Engineering Requirements 

The main technical requirements are summarized below.

#spec-table(
  4,
  [*Parameter*],
  [*Target*],
  [*Value*],
  [*Unit*],

  [Motor speed],
  [10–20],
  [15],
  [rpm],

  [Supply voltage],
  [6],
  [6],
  [V],

  [Mechanism mass],
  [< 500],
  [420],
  [g],
)


= Engineering Analysis

== Motor Torque

The required torque can be approximated by:

$ tau = I alpha $

where $I$ is the moment of inertia and
$alpha$ is the angular acceleration.

#design-decision(
  "DESIGN DECISION",
  [
    A low-speed geared motor was selected to prioritize
    torque output over rotational speed.
  ],
)


= Conclusion

The developed mechanism provides a first proof of concept
for a compact plantigrade walking system.

Further development should focus on experimental validation,
joint friction and optimization of the linkage geometry.