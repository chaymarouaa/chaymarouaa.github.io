#set document(
  title: "Granular Flow Simulation",
  author: "Chayma ROUAA, Mélany SOUTO",
)

#set page(
  paper: "a4",
  margin: (
    top: 2.5cm,
    bottom: 2.5cm,
    left: 2.5cm,
    right: 2.5cm,
  ),
)

#set text(
  font: "New Computer Modern",
  size: 10.5pt,
)

#set heading(numbering: "1.1")

#show figure: it => {
  v(2em)
  it
  v(2em)
}

#show heading.where(level: 1): it => {
  v(1.6em)
  it
  v(0.5em)
}

#show heading.where(level: 2): it => {
  v(1.0em)
  it
  v(1.2em)
}

#align(center)[
  #v(20em)

  #text(size: 22pt, weight: "bold")[
    Granular Flow Simulation
  ]

  #v(0.5cm)

  #text(size: 15pt)[
    2D Modelling of a Sand Pile in Fortran 90
  ]

  #v(1.5cm)

  Chayma ROUAA \
  Mélany SOUTO

  #v(1.5cm)

  *LU2ME005-F : Fortran Programming Project* \
  *Sorbonne Université*

]

#v(1fr)

#align(center)[
  #text(size: 9pt)[
    Academic year 2021–2022
  ]
]

#pagebreak()

#outline(
  title: "Contents",
  indent: auto,
)

#pagebreak()


= Introduction

This project focuses on the numerical modelling and simulation of a granular flow using #strong[Fortran 90]. The objective is to reproduce the progressive formation of a two-dimensional sand pile over a defined simulation time.

The granular material is represented as a set of vertical stacks of grains. At each time step, grains are introduced into the system and redistributed between neighbouring stacks according to a stochastic transfer rule. This produces successive avalanches and progressively builds the pile.

The project was developed in several stages. The initial implementation represented only half of the sand pile, with the maximum height and radius defined as input parameters. The model was then improved by introducing file-based parameter input, avalanche statistics, a more modular program structure, and finally a complete sand pile generated from a central deposition point.

The simulation combines numerical programming, discrete modelling, stochastic processes and graphical representation of the system evolution.


= Numerical Model

== Representation of the Granular System

The sand pile is represented using a derived Fortran type named "tas". It contains four main components:

- "rmax": maximum radius of the simulated pile,
- "hmax": maximum height of the pile,
- "pile": a one-dimensional array storing the number of grains in each vertical stack,
- "grille": a two-dimensional array used to display the pile.

Each element of "pile" therefore corresponds to a vertical column of grains. The "grille" array provides a visual representation in which each grain is represented by a character.

This discrete representation makes it possible to model the evolution of the granular system using simple local interactions between neighbouring stacks.


== Grain Transfer Mechanism

The simulation evolves through a discrete time loop. In the initial version, a grain is added to the first stack at regular time intervals.

The redistribution of grains is then calculated between neighbouring stacks. The number of transferred grains is determined by a stochastic relation involving the difference in height between two consecutive stacks and a random number $e in [0, 1[$.

The transfer mechanism can be expressed as:

$
n_g = 1 + floor(1/2 (2 + "pile"(i) - "pile"(i+1) e))
$

where $n_g$ represents the number of grains transferred from stack $i$ to stack "$i+1$".

The use of a random variable introduces variability between simulations with identical initial parameters. This reflects the stochastic nature of the implemented granular model.


== Time Integration

The evolution of the pile is controlled by a discrete time loop ranging from "0" to "temps_max", with a time increment "nt".

In the original implementation:

- "temps_max" is initialized to "10000",
- "nt" is initialized to "10",
- a grain is introduced every "10" time units,
- the maximum height "hmax" limits the accumulation of grains.

After each modification of a stack, the graphical representation is updated, allowing the formation of the pile to be observed as an animation.


= Software Architecture and Development

== Initial Implementation

The first version of the program was structured around two main components:

- the "m_sable" module containing the derived type and computational procedures,
- the "p_sable" main program controlling the simulation.

A controlled input procedure, "lecture_controlee", was initially used to obtain the values of "hmax" and "rmax". The procedure ensured that the entered values remained within the prescribed range.

The arrays required by the simulation were then dynamically allocated according to these parameters.


== Parameter and Data Management

The model was subsequently modified to read its parameters from a dedicated "param.dat" file rather than requiring direct user input.

The simulation also generates several output files containing numerical results. In particular:

- "distrib_tailles.res" stores the avalanche-size distribution,
- "tas_final.res" stores the final number of grains for each stack.

This approach separates the simulation parameters and generated data from the source code, making repeated simulations easier to perform.


== Modularisation

One of the main software improvements consisted in restructuring the program so that the main program "p_sable" contains only the elements required to launch the simulation.

The computational procedures were grouped into the "m_sable" module. This reduced the number of variables declared in the main program and made the overall structure more compact.

The module and main program were separated into two Fortran source files and compiled independently using "gfortran" before being linked into the final executable.


= Simulation Results

== Initial Half-Pile Model

The first implementation produced a two-dimensional half-pile.

The maximum height "hmax" was located at one extremity of the simulated domain, while "rmax" defined the number of vertical stacks.

The simulation successfully reproduced the progressive formation of the pile. However, because the grain transfer mechanism contains a random component, two simulations performed with identical parameters can produce slightly different final configurations.

Despite this variability, the overall behaviour of the system remains coherent.

#figure(
  image("granular-figures/1.png", width: 15%),
  caption: [
    Initial two-dimensional half-pile obtained at the final simulation time.
  ],
) <fig:half-pile>

The simulation parameters used for this configuration were defined in the "param.dat" input file.


#figure(
  image("granular-figures/2.png", width: 50%),
  caption: [
    Input parameters used for the initial sand-pile simulation.
  ],
) <fig:param-dat>

== Avalanche Statistics

The simulation records avalanche events by monitoring changes in the number of grains within the stacks.

The resulting data are used to construct the avalanche-size distribution in both linear and log-log representations.

#figure(
  grid(
    columns: (1fr, 1fr),
    gutter: 0.4em,
    image("granular-figures/3.png", width: 100%, height: 6cm, fit: "contain"),
    image("granular-figures/4.png", width: 100%, height: 6cm, fit: "contain"),
    ),
  
  caption: [
    Avalanche-size distribution represented on linear and log-log scales.
  ],
) <fig:avalanche-distribution>

The obtained distribution is consistent with the qualitative behaviour expected from the Bak–Tang–Wiesenfeld (BTW) sandpile model. Increasing the maximum pile height also leads to an increase in the number of observed avalanches.


== Final Pile Profile

The final distribution of grains is also stored as a function of the stack number.

The resulting profile is consistent with the pile displayed by the simulation. Although the curve is not perfectly linear, its overall shape reflects the geometry of the simulated sand pile.

#figure(
  image("granular-figures/5.png", width: 50%),
  caption: [
    Final number of grains as a function of stack number for the initial half-pile model.
  ],
) <fig:half-pile-profile>

This provides a simple quantitative validation of the graphical representation produced by the model.


= Model Improvements

== Complete Sand Pile

The first major modelling improvement consisted in extending the half-pile representation to a complete sand pile.

A simple mirroring approach was initially considered. However, this would have doubled the effective radius and would have implied the simultaneous deposition of two grains.

A second approach was therefore implemented.

Each new grain is deposited on the central stack, corresponding approximately to "rmax / 2 + 1". A counter "k" determines the direction of the subsequent redistribution:

- for one parity of "k", grains are transferred towards the right,
- for the other parity, grains are transferred towards the left.

This produces a complete pile while preserving a single grain deposition at each time step.

#figure(
  image("granular-figures/6.png", width: 25%),
  caption: [
    Complete sand pile obtained after implementing the central deposition and bidirectional grain transfer.
  ],
) <fig:complete-pile>

== Symmetry and Stochastic Behaviour

The resulting pile is not perfectly symmetric for all values of "rmax".

For example, when "rmax = 12" and "hmax = 9", the final pile exhibits a slight asymmetry. This results from both the stochastic grain-transfer mechanism and the use of an even radius.

Nevertheless, the overall geometry remains consistent with the expected formation of a granular pile.

#figure(
  image("granular-figures/7.png", width: 65%),
  caption: [
    Final grain distribution as a function of stack number for the complete sand-pile model.
  ],
) <fig:complete-pile-profile>

= Limitations

The model provides a simplified representation of real granular mechanics.

In particular, the geometry of the simulated pile is more rigid and steep than would be expected from a real sand pile. In a physical system, gravity, friction and grain interactions would lead to a more realistic angle of repose and a less idealised surface.

The stochastic transfer mechanism also introduces variability between simulations. Identical input parameters therefore do not necessarily produce exactly the same microscopic configuration.

A more realistic representation could be obtained by modifying the relationship between "rmax" and "hmax" and by refining the condition controlling grain deposition once the maximum height is reached.


= Future Improvements

Several extensions could further improve the physical realism and scope of the model.

First, the pile geometry could be refined to reproduce a more realistic and flatter angle of repose. This would require modifying the deposition and stopping conditions rather than simply imposing a maximum height.

The avalanche model could also be investigated further by analysing the influence of "hmax", "rmax" and the stochastic transfer mechanism on avalanche-size distributions.

A more ambitious extension would consist in modelling a complete #strong[sandglass system]. The upper reservoir could be represented by a triangular arrangement of grains, with grains progressively leaving the upper region and being introduced into a second dynamic grid below.

Such a model would conserve the total number of grains throughout the simulation while reproducing the coupled flow between the two reservoirs.


= Conclusion

The project successfully produced a two-dimensional numerical model of sand-pile formation using Fortran 90.

The simulation reproduces the progressive evolution of a granular system through discrete grain transfers and stochastic avalanches. The implementation was progressively improved from an initial half-pile model to a complete pile, while also introducing modular code organisation, file-based parameter management and quantitative avalanche analysis.

The resulting model remains a simplified representation of real granular behaviour, but provides a useful computational framework for studying collective phenomena emerging from local interactions.

The project therefore combines #strong[numerical modelling], #strong[algorithmic development], #strong[stochastic simulation] and #strong[data analysis] within a single mechanical modelling problem.

#v(40em)
#align(center)[


_The raw files of this project can be found on _


_ #link("https://github.com/chaymarouaa")[Chayma Rouaa GitHub profile] at this path :
/chayma-rouaa-portfolio/public/granular-files _

_If the hypertext link does not work, copy this link : https://github.com/chaymarouaa _

]