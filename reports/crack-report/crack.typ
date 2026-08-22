#set document(
  title: "Discrete Modeling of Elastic Solids",
  author: "Chayma ROUAA",
)

#set page(
  paper: "a4",
  margin: 2.5cm,
)

#set text(
  font: "New Computer Modern",
  size: 10.5pt,
)

#set heading(
  numbering: "1.1",
)

#set par(
  justify: true,
  leading: 0.65em,
)
#show heading.where(level: 1): it => {
  v(1.6em)
  it
  v(0.5em)
}

#align(center)[
  #v(20em)

  #text(size: 22pt, weight: "bold")[
    Discrete Modeling of Elastic Solids
  ]

  #v(0.5cm)

  #text(size: 15pt)[
    Numerical Foundations for Crack Propagation Modeling
  ]

  #v(1.5cm)

  Chayma ROUAA\
  Sabrina PIARALY

  #v(5em)


  *LU3ME104 : Discrete Modeling of Solids and Fluids* \
  *Sorbonne Université*

  #v(3em)
  
  Project supervised by \
  Lucas FREROT

]

#v(1fr)

#align(center)[
  #text(size: 9pt)[
    Academic year 2021–2022
  ]
]

#pagebreak()

#outline(title: "Contents", indent: auto)

#pagebreak()


= Abstract

This project investigates the discrete numerical modeling of an elastic
solid subjected to tensile loading. The structure is represented as a
rectangular lattice of interacting particles with fixed connectivity.
Elastic interactions are defined through a harmonic potential, while the
system dynamics are integrated using a Verlet predictor-corrector scheme.

The model is used to study particle interactions, mechanical energy,
wave propagation, damping, boundary conditions and macroscopic material
properties. The effective Young's modulus and Poisson's ratio are
estimated from the simulated stress-strain response.

Although the present model focuses on elastic deformation rather than
explicit fracture, its discrete connectivity framework provides the
numerical basis for extending the simulation toward damage and crack
propagation by introducing local interaction failure criteria.


= Project Overview

== Context

Continuum mechanics generally describes a solid through macroscopic
quantities such as stress, strain, displacement and material properties.
A discrete approach instead represents the material as a collection of
interacting particles.

This project uses this discrete representation to model the mechanical
response of an elastic bar subjected to tensile loading. Each particle
interacts with a predefined set of neighboring particles, producing a
lattice-based mechanical system.

The objective is to connect local particle interactions with the global
mechanical behavior of the structure.

== Engineering Objectives

The main objectives are:

- Construct a rectangular discrete representation of an elastic bar.
- Define the connectivity between neighboring particles.
- Compute pairwise distances and interaction directions.
- Derive elastic forces from a harmonic potential.
- Integrate the equations of motion using Verlet integration.
- Apply fixed and tensile boundary conditions.
- Analyze kinetic, potential and total mechanical energy.
- Introduce dissipation to reach mechanical equilibrium.
- Estimate the effective Young's modulus.
- Estimate the Poisson's ratio.
- Evaluate the numerical limitations of the discrete model.

The resulting framework also provides a basis for future discrete fracture
and crack propagation modeling.


= Numerical Model

== Particle Representation

The solid is discretized into a rectangular lattice composed of particles.
Each particle is represented by its position, velocity and mass.

The initial configuration is defined using two orthogonal unit vectors.
One vector describes the longitudinal direction of the bar, while the
second describes its transverse direction.

The lattice spacing defines the initial distance between particles along
the two principal directions.

The position of a particle can therefore be represented from its lattice
indices and the corresponding basis vectors.

The model contains:

- "nx" particles along the longitudinal direction.
- "ny" particles along the transverse direction.
- a constant lattice spacing.
- a fixed particle mass.
- a predefined connectivity between neighboring particles.


== Pairwise Geometry

For each pair of interacting particles, the relative vector is defined as

$
  vec(r)_(i j) = vec(x)_j - vec(x)_i
$

and its magnitude gives the inter-particle distance

$
  d_(i j) = ||vec(r)_(i j)||
$

The corresponding normalized direction is

$
  vec(n)_(i j) =
  frac(vec(r)_(i j), d_(i j))
$

This direction is required to convert the scalar elastic interaction into
a vector force.

When $i = j$, the distance is zero and direct normalization would produce
undefined values. The numerical implementation therefore replaces these
invalid values with zero using "numpy.nan_to_num".


= Connectivity

== Fixed Connectivity

Unlike a system of freely interacting particles, the present model uses a
fixed connectivity.

Each particle keeps the same set of mechanical neighbors throughout the
simulation. The tensile loading therefore modifies the distance between
connected particles without dynamically changing the topology of the
lattice.

This representation is analogous to a discrete truss-like structure.

The interaction network includes:

- four direct neighbors along the longitudinal and transverse directions;
- four diagonal neighbors.

Including the diagonal connections is important because they contribute to
the transverse and shear response of the lattice.

== Neighbor Detection

The initial connectivity is constructed using a neighbor-search procedure.
A cutoff distance determines whether two particles are considered connected.

The cutoff must satisfy

$
  1 < "cutoff" < 2
$

when the lattice spacing is normalized to one.

A value of

$
  "cutoff" = 1.5 times "lattice_spacing"
$

allows the four direct neighbors and the four diagonal neighbors to be
included while excluding particles located farther away.


= Elastic Forces and Energy

== Harmonic Potential

The interaction between two connected particles is derived from a harmonic
potential:

$
  U_(i j)(d_(i j)) =
  1/2 k_(i j) (d_(i j) - L_(i j))^2
$

where:

- $k_(i j)$ is the interaction stiffness;
- $d_(i j)$ is the current distance;
- $L_(i j)$ is the initial equilibrium distance.

The reference distance $L_(i j)$ is determined from the undeformed lattice and
remains constant throughout the simulation.

The potential therefore increases when the current distance differs from
the initial distance.


== Elastic Interaction Force

The force is obtained from the gradient of the potential with respect to
the particle positions.

The resulting interaction is directed along the line connecting the two
particles. Its magnitude depends on the difference between the current
distance and the reference distance.

The total internal force acting on a particle is obtained by summing the
contributions of all connected neighbors:

$
  vec(F)_i =
  sum_j vec(F)_(i j)
$

This formulation converts the local pairwise interactions into the global
mechanical response of the bar.


= Numerical Integration

== Verlet Predictor-Corrector

The temporal evolution of the system is computed using a Verlet
predictor-corrector scheme.

The method updates particle positions and velocities from the current
forces while maintaining a good compromise between computational
efficiency and numerical stability.

A preliminary stability analysis identified a critical time step of
approximately

$
  "dt"_"critical" = 3 times 10^(-4)
$

The simulation therefore uses

$
  "dt" = 10^(-5)
$

which remains below the identified stability threshold.


== Mechanical Energy

For a conservative elastic system, the total mechanical energy should
remain approximately constant.

The total energy is expressed as

$
  E_"total" = E_"kinetic" + E_"potential"
$

where the kinetic energy is associated with particle motion and the
potential energy with deformation of the elastic connections.

In the absence of dissipation, the tensile loading generates mechanical
waves that propagate through the lattice. The energy is transferred between
kinetic and potential forms, producing persistent oscillations.


= Dissipation and Equilibrium

== Dissipative Force

The persistent oscillations are physically consistent with a conservative
system but prevent the structure from rapidly reaching a static equilibrium.

A velocity-dependent dissipative force is therefore introduced:

$
  vec(F)_d =
  - frac(m vec(v), tau)
$

where $m$ is the particle mass, $vec(v)$ is the particle velocity and
$tau$ is a characteristic damping time.

The negative sign ensures that the force opposes the particle velocity.

Unlike the elastic force, this force is non-conservative and progressively
removes kinetic energy from the system.


== Critical Damping

The characteristic damping time is related to the natural pulsation of
the system:

$
  tau =
  frac(1, 2 m omega_0)
$

with

$
  omega_0 = sqrt(frac(k,m))
$

where $k$ is the interaction stiffness and $m$ is the particle mass.

The damping mechanism allows the transient oscillations to progressively
decay until the structure approaches a mechanical equilibrium.


== Numerical Equilibrium

The simulation is performed over a sufficiently large number of iterations,
with 2000 iterations used in the original study.

A stopping criterion can also be introduced based on the kinetic energy.
When the kinetic contribution becomes sufficiently small compared with
the potential energy, the system can be considered close to equilibrium.

The resulting energy curves show the expected transfer from kinetic to
potential energy as the bar progressively reaches its deformed equilibrium
configuration.


= Boundary Conditions

== Fixed Boundary

The left boundary of the bar is fully constrained.

The particles belonging to the first column are identified as "node_left".
Their positions remain constant throughout the simulation.

At every time step:

- their positions remain fixed;
- their velocities are set to zero;
- their forces are constrained to zero.

This reproduces an encastrement condition.


== Tensile Boundary

The particles located on the opposite boundary are identified as
"node_right".

A tensile force is applied horizontally to this boundary, producing a
longitudinal extension of the bar.

The combination of a fixed left boundary and a tensile right boundary
creates the mechanical loading configuration required for the study.


= Discrete Deformation

Under tensile loading, the distance between connected particles increases
along the longitudinal direction.

At the macroscopic scale, this produces an increase in the length of the
bar.

At the same time, the transverse dimension decreases, producing a
contraction in the direction perpendicular to the applied load.

The discrete particle model therefore reproduces the qualitative behavior
expected from an elastic material under uniaxial tension.


= Material Characterization

== Young's Modulus

The effective Young's modulus is determined from the stress-strain
relationship

$
  sigma = E epsilon
$

where $sigma$ is the longitudinal stress, $epsilon$ is the longitudinal
strain and $E$ is the effective Young's modulus.

A series of simulations is performed for different dissipative force
parameters. The resulting stress is plotted as a function of longitudinal
strain.

The slope of the resulting linear relationship provides an estimate of the
effective Young's modulus.


== Reference Stiffness

For an interaction stiffness of

$
  k = 10 "MN"/m
$

the simulation provides an effective Young's modulus of approximately

$
  E = 148.7 "MPa"
$

The numerical stress-strain curve was obtained with a negative slope due
to the chosen sign convention. The absolute value of the slope is used to
extract the magnitude of the effective modulus.


== Stiffness Calibration

The model was then calibrated toward a target Young's modulus of

$
  E = 200 "GPa"
$

The theoretical stiffness required to reach this value is of the order of

$
  k approx 10^10 "N"/m
$

However, such high stiffness values exceed the numerically stable range of
the implementation.

For stiffness values significantly above the order of $10^8 "N"/m$, the
simulation produced undefined numerical values.

A compromise value of

$
  k = 9 times 10^8 "N"/m
$

was therefore tested.

The resulting effective Young's modulus was approximately

$
  E = 13.28 "GPa"
$

Although this value remains below the target value, the result demonstrates
the influence of the microscopic interaction stiffness on the macroscopic
elastic response.


== Poisson's Ratio

The transverse and longitudinal strains are related through

$
  epsilon_"transverse" =
  - nu epsilon_"longitudinal"
$

where $nu$ is Poisson's ratio.

The transverse strain is therefore plotted against the longitudinal strain.
The slope of the resulting linear relationship provides an estimate of the
Poisson's ratio.

The simulations produced approximately

$
  nu = 0.149
$

for both tested stiffness values.

The similarity between the two results is not fully consistent with the
expected sensitivity of the macroscopic response to a significant change
in interaction stiffness. This discrepancy indicates a limitation of the
current calibration and suggests that the discrete model requires further
validation before quantitative material identification can be considered
reliable.


= Numerical Limitations

Several limitations were identified during the study.

== Stability

The interaction stiffness cannot be increased arbitrarily. Large values
reduce the characteristic time scale of the system and make the explicit
time integration increasingly sensitive to the selected time step.

The appearance of "NaN" values for large stiffness values demonstrates the
importance of coupling material parameters with an appropriate numerical
time step.

== Material Calibration

The relationship between microscopic stiffness and macroscopic material
properties is not directly equivalent to the material constants of a
continuum model.

Consequently, achieving a target Young's modulus requires calibration of
the complete discrete model rather than simply imposing the desired
macroscopic value on the particle stiffness.

== Poisson's Ratio

The nearly identical Poisson's ratio obtained for different stiffness
values indicates that the current parameter identification procedure is
not sufficient to fully characterize the discrete material.

Further studies should investigate lattice geometry, connectivity,
boundary effects, loading conditions and the relationship between the
microscopic interaction law and the macroscopic constitutive response.


= Extension Toward Crack Propagation

The discrete formulation developed in this project provides a natural
framework for extending the model toward fracture mechanics.

A crack can be represented by progressively removing connections between
particles when a local failure criterion is reached.

Possible criteria include:

- critical inter-particle distance;
- critical strain;
- critical interaction force;
- critical elastic energy;
- local damage accumulation.

A connection satisfying the selected failure criterion could be removed
from the connectivity matrix. The resulting loss of local interactions
would generate a discontinuity in the lattice.

Repeated failure of neighboring connections would then allow a crack to
propagate through the discrete material.

This approach would establish a direct numerical link between local
particle-scale damage and macroscopic crack propagation.

The current project therefore represents the elastic and numerical
foundation required before introducing an explicit fracture mechanism.


= Engineering Skills

The project developed several engineering competencies:

- Discrete numerical modeling of mechanical systems.
- Particle-based representation of elastic solids.
- Vectorized force and distance calculations.
- Verlet numerical integration.
- Numerical stability analysis.
- Mechanical energy analysis.
- Implementation of damping mechanisms.
- Definition of mechanical boundary conditions.
- Elastic deformation analysis.
- Stress-strain characterization.
- Young's modulus estimation.
- Poisson's ratio estimation.
- Interpretation of numerical simulation results.
- Visualization of particle-based simulations with OVITO.
- Critical analysis of numerical limitations.

The project also strengthened the connection between computational
implementation and mechanical theory, particularly the transition from
local interaction laws to macroscopic material behavior.


= Conclusion

The project successfully established a discrete numerical representation
of an elastic bar subjected to tensile loading.

The lattice model accounts for direct and diagonal particle interactions,
while the harmonic potential provides the elastic restoring force. Verlet
integration enables the temporal evolution of the system, and the
introduction of velocity-dependent dissipation allows the transient
mechanical waves to decay toward equilibrium.

The simulation was also used to estimate effective macroscopic properties,
including Young's modulus and Poisson's ratio. The results demonstrate
that the discrete interaction stiffness strongly influences the global
mechanical response, while also revealing numerical stability and
calibration limitations.

Beyond the initial elastic problem, the fixed-connectivity particle
framework provides a suitable foundation for discrete fracture modeling.
Introducing local connection failure would allow the model to evolve from
elastic deformation toward damage accumulation and crack propagation,
connecting particle-scale mechanics with macroscopic fracture behavior.