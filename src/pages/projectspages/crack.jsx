import { motion } from "framer-motion";
import ProjectPage from "../projectpage"

function Crack() {
  return (
    <ProjectPage
      title="Discrete Crack Propagation Simulation"
      category="Academic Project"
      description="Discrete numerical modeling of an elastic solid using particles interactions, Verlet integration and mechanical characterization."
      image="/projects-assets/crack.jpg"
      video="/project-assets/crack.mp4"
    >

      <section className="documentation-section">

        <h2>Project Overview</h2>

        <p>
          This project focused on the discrete numerical modeling of an
          elastic solid subjected to tensile loading. The material was
          represented as a rectangular lattice of interconnected particles,
          providing a simplified particle-based representation of a solid.
        </p>

        <p>
          The model was developed in Python as part of the LU3ME104 course at
          Sorbonne Université, with the objective of studying particle
          interactions, elastic deformation, energy transfer and the
          mechanical response of the structure.
        </p>

      </section>


      <section className="documentation-section">

        <h2>Engineering Approach</h2>

        <p>
          Each particle is connected to a fixed set of neighboring particles,
          including both direct and diagonal neighbors. The distance between
          particles is used to compute elastic interactions through a
          harmonic potential.
        </p>

        <p>
          The system is integrated in time using a Verlet
          predictor-corrector scheme. A fixed boundary condition is applied
          on one side of the bar, while a tensile force is applied on the
          opposite side.
        </p>

        <p>
          Because the purely elastic system naturally produces persistent
          mechanical oscillations, a velocity-dependent dissipative force
          was introduced to attenuate the kinetic energy and allow the
          structure to approach equilibrium.
        </p>

      </section>


      <section className="documentation-section">

        <h2>Development</h2>

        <p>
          The numerical model was built around the computation of particle
          positions, inter-particle distances, normalized interaction
          directions and resulting forces.
        </p>

        <p>
          The particle connectivity was generated using a cutoff distance,
          allowing the model to include both the four nearest neighbors and
          the four diagonal neighbors of the lattice.
        </p>

        <p>
          The simulation was then used to analyze mechanical energy,
          deformation and the influence of the interaction stiffness and
          damping parameters on the global response of the structure.
        </p>

      </section>


      <section className="documentation-section">

        <h2>Results</h2>

        <p>
          The simulation reproduced the expected tensile deformation of the
          discrete bar and highlighted the propagation of mechanical waves
          through the lattice. Introducing dissipation progressively
          attenuated these oscillations and brought the system closer to
          static equilibrium.
        </p>

        <p>The model was also used to evaluate the overall mechanical 
        behaviour of the material. By varying the stiffness of the 
        interactions between particles, it was possible to observe how 
        microscopic interactions influence the material’s macroscopic 
        response. Higher interaction stiffness resulted in a stiffer 
        overall material, demonstrating the link between particle-level 
        behaviour and bulk mechanical properties.
        </p>


        <p>
          These results also highlighted the numerical limitations of the
          model, particularly the stability constraints associated with
          increasing the particle interaction stiffness.
        </p>

      </section>


      

      <section className="documentation-section">

        <h2>Technical Report</h2>

        <h3>
          To read the full technical report of this project, click on the
          link below.
        </h3>

        <a
          href="/crack-files/Rapport_Me104_Chayma_Sabrina.pdf"
          target="_blank"
          rel="noreferrer"
        >
          Full Technical Documentation (original french version)<br/>
        </a>

        <h3>
          The English version is not yet available.
        </h3>

      </section>


    </ProjectPage>
  )
}

export default Crack