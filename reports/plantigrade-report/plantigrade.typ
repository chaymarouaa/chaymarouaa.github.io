#set document(
  title: "Tchebyshev Plantigrade Tiger",
  author: "Chayma Rouaa, Yasmine Guerich, Nela Regaskova",
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
    Tchebyshev Plantigrade Tiger
  ]

  #v(0.5cm)

  #text(size: 15pt)[
    Mechanical Design and Motion Simulation
  ]

  #v(1.5cm)

  Chayma Rouaa \
  Yasmine Guerich\
  Nela Regaskova

  #v(1.5cm)

  *LU2ME113 : System Design, Simulation and Robotics* \
  *Sorbonne Université*
  
  #v(3em)
  
  Project supervised by \
  Véronique MAUDRU

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

This project focuses on the mechanical design and motion simulation of a four-legged walking mechanism based on a Tchebyshev-inspired linkage architecture.

The objective was to develop a functional quadrupedal mechanical system in SolidWorks, combining articulated mechanisms, constrained leg motion and synchronized movement. The mechanical structure was subsequently integrated into an external shell inspired by the geometry of a tiger.

The walking mechanism is based on a Lambda linkage applied to each leg. The mechanism converts rotational motion into a controlled trajectory of the leg while maintaining the required geometric constraints. Four equivalent mechanisms are arranged around a central chassis to generate the quadrupedal configuration.

The project development followed a chronological approach reflecting the main engineering stages of the design process. These stages included the creation of the mechanical components, development of the Lambda mechanism, chassis design, kinematic constraint definition, trajectory analysis, synchronization of the legs, external shell modelling and final motion simulation.

The entire system was designed and assembled using SolidWorks. The Motion Analysis environment was used to evaluate the resulting kinematics and identify mechanical constraints required for controlled motion.

= Mechanical Design

== Lambda Mechanism

The Lambda mechanism constitutes the fundamental kinematic unit of the walking system. It connects each leg to the fixed chassis and converts the rotational input into the desired leg trajectory.

Each Lambda mechanism consists of three mechanical components connected through five revolute joints. The combination of these components produces the characteristic Lambda configuration and allows relative rotation between the different elements.

The geometry of the three components was developed from parametric sketches. Sheet metal features were used where appropriate, followed by material removal operations to create the required openings and joint interfaces.

Particular attention was given to the dimensions and positioning of the holes because these features define the locations of the revolute joints and therefore directly affect the resulting kinematics.

To do so, the linkage has to follow specific rules :

• The shortest bar is linked to the frame and a rotative motor to permit a full continuous pivot rotation.

• The medium bar is linked to a frame and stays fixed in translation but free on the same axis rotation of the shortest bar.

• The longest bar transmit the movement into a called “mushroom” shape.
The leg replicates the “mushroom” motion parallelly to the foot. 

• The right length of each bar is determined by Tchebychev relation $l_1:l_2:l_3:d=1:2.5:5:2$
with : 

#h(1.5em) ◦ Driving link (_shorter bar_) $l_1 = 1$

#h(1.5em) ◦ Coupler  (_medium bar_) $l_2= 2.5$

#h(1.5em) ◦ Output link (rocker) (_longest bar_) $l_3= 5$

#h(1.5em) ◦ Ground link (d) 
distance between $l_1$ and $l_2$ on frame
$d = 2$

#v(1em)
As for information $l_1, l_2, l_3$, are not exactly the length of the bars, it’s the distance between two pivots. Therefore, $l_1$ is the distance between the center of the holes of the short bar at both extremities.

The Lambda mechanism was initially developed as an independent subassembly. This approach simplified the definition of the mechanical constraints and allowed the behaviour of the linkage to be analysed before integration with the complete chassis.

The mechanism designed for one side of the robot was then reproduced using symmetry with respect to the longitudinal axis of the chassis. The same approach was applied to the rear mechanisms.

#figure(
  grid(
    columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
    gutter: 0.4em,
    image("plantigrade-figures/1.1.png", width: 100%, height: 4.5cm, fit: "contain"),
    image("plantigrade-figures/1.2.png", width: 100%, height: 4.5cm, fit: "contain"),
    image("plantigrade-figures/1.3.png", width: 100%, height: 4.5cm, fit: "contain"),
    image("plantigrade-figures/1.4.png", width: 100%, height: 4.5cm, fit: "contain"),
    image("plantigrade-figures/1.5.png", width: 100%, height: 4.5cm, fit: "contain"),
    image("plantigrade-figures/1.6.png", width: 100%, height: 4.5cm, fit: "contain"),
  ),

  caption: [Development of the mechanical components],
)

#v(1.5em)

#figure(
  image("plantigrade-figures/2.png", width: 100%, height: 4.5cm, fit: "contain"),
  caption: [Assembled Lambda mechanism],
)

#v(1.5em)

The five revolute joints provide the required relative rotations between the components. The resulting linkage allows the leg to move relative to the chassis while following the trajectory imposed by the mechanism.

The Lambda mechanism therefore represents the main kinematic subsystem responsible for converting the motorized rotational input into the walking motion.

== Chassis

The chassis constitutes the fixed reference structure of the robot. It supports the external shell and provides the reference frame relative to which the Lambda mechanisms and legs move.

The chassis geometry was designed to accommodate the four walking mechanisms while maintaining sufficient clearance between the moving components.

#v(1.5em)

#figure(
  image("plantigrade-figures/3.png", width: 100%, height: 4.5cm, fit: "contain"),
  caption: [Chassis geometry],
)

During the initial assembly, the lateral guide bars were not integrated into the chassis. The legs were correctly connected to the Lambda mechanisms and could rotate at their corresponding joints, but they were not sufficiently constrained relative to the chassis.

This configuration resulted in uncontrolled rotational motion of the legs in several directions.

The problem was addressed by introducing a sliding interface between each leg and the chassis. The purpose of this constraint was to preserve the required rotational movement at the leg-to-Lambda connection while removing an unwanted degree of freedom from the leg.

The resulting sliding constraint allows a controlled translational movement of the leg relative to the chassis.

Additional attachment components were designed to connect the legs to the guide bars. These components pass through the corresponding openings and provide the mechanical interface required for the sliding motion.

#figure(
  grid(
    columns: (1fr, 1fr),
    gutter: 0.4em,
    image("plantigrade-figures/5.1.png", width: 100%, height: 4.5cm, fit: "contain"),
    image("plantigrade-figures/5.2.png", width: 100%, height: 4.5cm, fit: "contain"),
    ),
  caption: [Left _(at the left)_ and right _(at the right)_ sliding attachments],
)

The geometry of the attachment openings was adapted to the inclination of the legs. Because the legs are not perfectly vertical, the sliding motion occurs along an inclined direction rather than along a purely vertical axis.

The dimensions of the attachment opening were therefore selected to match the leg geometry and maintain sufficient clearance throughout the motion.

#figure(
  grid(
    columns: (1fr, 1fr),
    gutter: 0.4em,
    image("plantigrade-figures/6.1.png", width: 100%, height: 4.5cm, fit: "contain"),
    image("plantigrade-figures/6.2.png", width: 100%, height: 4.5cm, fit: "contain"),),
  caption: [Sliding attachment integrated with the leg],
)

The chassis was also positioned relative to the reference planes of the assembly to establish a consistent geometric reference for the subsequent motion analysis and ground simulation.

_Due to friction, the attachments might be fragilizing over time, to prevent this, it would have been a relevant option to provide a functional clearance._

== Legs

The four legs provide the connection between the walking mechanisms and the ground.

The leg geometry was designed with a slight curvature to reproduce the appearance of a feline limb while maintaining compatibility with the mechanical architecture.

The legs were intentionally designed with greater thickness than the other structural components. This increased cross-sectional area provides greater stiffness and allows the legs to support the mass of the chassis and external shell.

The length of the legs was selected so that they extend below the external shell and can reach the ground during the walking motion.

#figure(
  image("plantigrade-figures/7.png", width: 100%, height: 4.5cm, fit: "contain"),
  caption: [Leg geometry],
)

Material was removed from the inner side of each leg, except in the Lambda attachment region. This recess provides sufficient clearance between the leg and the chassis and allows the sliding attachment to pass through the corresponding interface.

The geometry was therefore defined by both structural requirements and kinematic constraints. The leg must provide sufficient mechanical stiffness while remaining compatible with the sliding guide and the complete range of motion.

== Mechanical Skeleton Assembly

The mechanical skeleton combines the chassis, four Lambda mechanisms, four legs and the sliding guide interfaces.

#figure(
  image("plantigrade-figures/8.png", width: 100%, height: 4.5cm, fit: "contain"),
  caption: [Complete mechanical skeleton],
)

The assembly was used to verify the compatibility of the individual components and to identify potential interference between moving elements.

At this stage, the main objective was to validate the mechanical architecture before integrating the external shell.

The assembly also provided the basis for the subsequent motion analysis. The chassis was defined as the fixed component, while the Lambda mechanisms and legs were allowed to move according to the defined mechanical constraints.

= Kinematic Analysis and Motion

== Trajectory Analysis

The objective of the kinematic analysis was to evaluate the trajectory generated by the Lambda mechanism and compare it with the intended walking path.

The target trajectory combines a forward motion phase with a return phase. The characteristic trajectory includes an elevated portion corresponding to the swing phase and a lower portion corresponding to the support phase.

#figure(
  image("plantigrade-figures/9.png", width: 100%, height: 4.5cm, fit: "contain"),
  caption: [Target trajectories

  _ https://images.math.cnrs.fr/freeze/La-machine-a-marcher.html _
  ],
)

#v(1em)

To study the motion of the Lambda mechanism, the Motion Analysis environment in SolidWorks was used.

A rotational motor was applied to the mechanism at the input location corresponding to point B in the reference geometry.

The motor provides the rotational input required to generate the movement of the linkage. Reference points were then used to track the resulting trajectories.

The trajectory associated with the Lambda mechanism was obtained from the centre of the relevant hole on the long Lambda component.

A second trajectory was obtained from the centre of the corresponding hole in the chassis.

#v(1em)

#figure(
  image("plantigrade-figures/11.png", width: 100%, height: 4.5cm, fit: "contain"),
  caption: [Simulated trajectories],
)

#v(1em)

The resulting trajectories were compared with the expected paths to evaluate the behaviour of the mechanism.

This analysis also provided a means of identifying inconsistencies in the initial mechanical constraints. The simulation showed that the correct trajectory could only be obtained once the unwanted degrees of freedom of the legs had been removed.

== Front and Rear Leg Synchronization

The walking motion requires coordinated movement between the front and rear mechanisms.

The front and rear leg configurations are arranged symmetrically with respect to the transverse centre plane of the chassis. Their motion is therefore arranged with an opposite phase relationship.

A mechanical connecting component was introduced to synchronize the front and rear Lambda mechanisms.

#figure(
  image("plantigrade-figures/12.13.png", width: 100%, height: 4.5cm, fit: "contain"),
  caption: [Synchronization component],
)

The connecting component is attached to a portion of the front Lambda mechanism and to the corresponding rear mechanism.

During operation, the geometry of the connecting component changes continuously as the mechanisms rotate. Its motion provides the required mechanical relationship between the front and rear legs.

This configuration allows synchronization of diagonally opposed legs.

The resulting movement provides the basis for a coordinated quadrupedal walking cycle in which diagonal pairs of legs move together.

== Ground Motion and Gravity

After validating the individual mechanism and synchronization system, the complete robot was positioned relative to a ground reference.

The purpose of this stage was to evaluate the behaviour of the complete assembly during contact with the ground.

Gravity was introduced into the motion simulation to account for the weight of the mechanical structure and external shell.

The ground configuration makes it possible to observe the relationship between the leg trajectory and the ground surface.

The simulation provides a preliminary validation of the walking behaviour. It also makes it possible to identify potential problems related to ground contact, mechanical interference or insufficient clearance.

A more advanced dynamic analysis would be required to quantify the ground reaction forces, friction, actuator torque and stability of the physical system.

= External Shell Design

The external shell was designed to transform the mechanical skeleton into a tiger-inspired quadrupedal system.

The shell had to satisfy both aesthetic and mechanical requirements. In particular, the geometry had to remain compatible with the movement of the legs and Lambda mechanisms.

The main design constraints were:

- sufficient clearance around moving components;
- compatibility with the chassis;
- preservation of the required leg motion;
- appropriate tiger-like proportions;
- reasonable mass distribution.

== Tiger Head

The head was designed with particular attention to geometric detail in order to reproduce the characteristic appearance of a tiger.

The modelling process made extensive use of SolidWorks features.

The main operations included:

- 2D sketches;
- 3D sketches;
- extruded bosses;
- material removal operations;
- revolved bosses;
- revolved cuts;
- dedicated geometric features for the cheeks and muzzle;
- dedicated features for the ears and rear head geometry.

#figure(
  caption: [Head modelling process],
)[
  // INSERT FIGURE
]

The base geometry of the head was first defined through sketches. Additional 3D sketches were then used to construct the cheeks and muzzle.

Extruded and revolved features were progressively combined to obtain the final volume.

#figure(
  caption: [Final tiger head],
)[
  // INSERT FIGURE
]

Once the head geometry was completed, a proportional mismatch was identified between the head and the body.

The head was initially too small compared with the rest of the shell. Its overall scale was therefore increased to obtain a more coherent relationship between the head, body and overall tiger proportions.

The head modelling stage also provided an opportunity to explore several SolidWorks modelling features and evaluate their influence on the final geometry.

== Body and Tail

The body was initially created from a rectangular solid.
The front region was progressively modified using extruded geometry to produce the rounded volume of the torso. The tail was created using a swept boss feature. This operation allowed the tail to follow a controlled three-dimensional path.

A revolved feature was subsequently used to create the rounded rear region of the body. The lower part of the body was hollowed using the Shell feature.
The integration of the tail initially created compatibility issues when the tail and body were modelled as separate components. The modelling sequence was therefore modified. The tail was integrated directly into the main shell before the rear extruded feature was created.

This change in feature order allowed the tail and body to form a continuous geometry and eliminated the previous integration problem.

#v(1.5em)

#figure(
  image("plantigrade-figures/final-assembly.png", width: 100%, height: 4.5cm, fit: "contain"),
  caption: [Final body and tail],
)

#v(2em)

== Shell and Skeleton Assembly

The external shell was integrated with the mechanical skeleton after the individual components had been validated. The assembly process required particular attention to the clearances between the shell and the moving mechanical components. The legs must remain free to move throughout their complete trajectory without contacting the body.

Similarly, the Lambda mechanisms require sufficient space to operate without interference from the shell.
The head, body and tail were positioned relative to the chassis to maintain the intended tiger proportions while preserving the mechanical functionality of the walking system.

== Final Walking Configuration

The final configuration combines the complete mechanical skeleton with the tiger-inspired shell.

The robot was positioned on a ground reference to evaluate the complete walking configuration.

The final motion simulation combines the Lambda mechanism, leg constraints, synchronization system, chassis and external shell.

#figure(
  image("plantigrade-figures/15.png", width: 100%, height: 4.5cm, fit: "contain"),
  caption: [Robot standing on the ground],
)

#figure(
  image("plantigrade-figures/16.png", width: 100%, height: 4.5cm, fit: "contain"),
  caption: [Walking motion simulation],
)


#v(1em)

The simulation provides an integrated view of the complete system and confirms the compatibility between the mechanical architecture and the external geometry.

#v(2em)

_The animated simulations of this project can be found on _


_ #link("https://github.com/chaymarouaa")[Chayma Rouaa GitHub profile] at this path :
/chayma-rouaa-portfolio/public/plantigrade-files _

_If the hypertext link does not work, copy this link : https://github.com/chaymarouaa _

= Design Improvements

Several improvements could be implemented to move the system closer to a physically functional robotic prototype.

== Head Mass Reduction

The body was hollowed using the Shell feature, whereas the head remained largely solid.

For a physical implementation, this mass distribution could shift the centre of gravity toward the front of the robot. 

The head could therefore be redesigned as a hollow structure using the Shell feature while preserving its external geometry. Reducing the mass of the head would improve the overall mass distribution and potentially reduce the load applied to the front legs.

== Kinematic Constraint Optimization

The final guide system was introduced after unwanted degrees of freedom were identified during the initial assembly. A complete degree-of-freedom analysis performed earlier in the design process could have reduced the number of iterations required during assembly.

A systematic kinematic study would allow each joint and constraint to be defined according to the required mobility of the mechanism before the complete CAD assembly is created.

== Mass Properties and Centre of Gravity

A complete mass-property analysis could be performed on the final assembly.

The main parameters of interest would include:

- total mass;
- centre of gravity;
- mass distribution;
- moments of inertia.

These parameters could then be used to optimize the shell thickness and mechanical components.

== Dynamic Simulation

The current analysis primarily focuses on the kinematic behaviour of the mechanism.

A more advanced simulation should incorporate:

- joint loads
- actuator torque
- rotational speed
- friction
- ground reaction forces
- contact forces
- component mass properties
- potential leg slippage

This would allow the design to be evaluated not only in terms of geometric motion but also in terms of mechanical performance.

== Physical Prototype

The final step would consist of translating the CAD and simulation model into a physical prototype.

This would require the selection of:

- actuators
- transmission components
- structural materials
- power supply
- control electronics
- mechanical fasteners
- sensors if required

Actuator sizing would need to be based on the required torque, angular velocity and dynamic loads generated during walking.

#v(5em)
= Conclusion

The project resulted in the CAD design and kinematic simulation of a four-legged walking system based on a Tchebyshev-inspired mechanism.

The mechanical architecture combines a central chassis, four Lambda linkages, guided legs and a synchronization system. The main design challenge consisted of controlling the degrees of freedom of the legs while preserving the rotational movement generated by the Lambda mechanisms.

The use of sliding interfaces between the legs and chassis provided the required additional constraint and allowed the legs to follow the intended motion.

SolidWorks Motion Analysis was used to study the resulting trajectories and validate the behaviour of the mechanism. The synchronization system subsequently allowed coordinated movement of diagonally opposed legs.

The mechanical skeleton was then integrated with a detailed tiger-inspired external shell. The design required consideration of mechanical clearances, geometry, proportions and mass distribution.

The final system demonstrates the integration of parametric CAD modelling, mechanical assembly, kinematic analysis and motion simulation within a single robotic design project.

Further development could extend the model toward a physically actuated prototype through mass-property analysis, dynamic simulation, actuator sizing, ground-contact modelling and optimization of the centre of gravity.


#v(30em)

_The raw files of this project can be found on _


_ #link("https://github.com/chaymarouaa")[Chayma Rouaa GitHub profile] at this path :
/chayma-rouaa-portfolio/public/plantigrade-files _

_If the hypertext link does not work, copy this link : https://github.com/chaymarouaa _
