import ProjectPage from "../projectpage"

function Plantigrade() {
  
  return (
    <ProjectPage
      title="Plantigrade Robot"
      category="Personal Project"
      description="CAD design and motion simulation of a four-legged 
      walking mechanism based on the Tchebyshev linkage."
      image="/projects-assets/plantigrade.jpg"
      video="/projects-assets/plantigrade.mp4"
    >

      <section className="documentation-section">

        <h2>Project Overview</h2>

        <p>
          This project focuses on the mechanical design and motion simulation
          of a four-legged walking system inspired by the Tchebyshev linkage.
          The objective was to develop a functional quadrupedal mechanism in
          SolidWorks, combining articulated linkages, constrained leg motion
          and synchronized movement.        
        </p>

        <h3>The mechanism behind this project was developed by 
          the Russian mathematician Pafnuty Lvovich Tchebyshev in the XIX century. 
          By a four-bar linkage, a plantigrade movement is transmitted to permit a 
          step by step motion. By definition, a plantigrade is an animal walking on the entire 
          sole of the foot with the heel touching the ground, like bears for example.
        </h3>

        <p>
          The project was developed as part of the LU2ME113 
          <em>  System Design, Simulation and Robotics  </em> course at
          Sorbonne University in Paris, France.
        </p>

      </section>


      <section className="documentation-section">

        <h2>Engineering Approach</h2>
        
       <p>
          The robot was designed in SolidWorks, from individual mechanical
          components to the complete assembly. The main mechanism connects
          each leg to the chassis through a combination of pivot and sliding
          joints, constraining the motion of the legs and generating the
          desired walking trajectory.
        </p>

      </section>


      <section className="documentation-section">

        <h2>Development</h2>

        <p>
          The mechanical components were modelled parametrically in SolidWorks.
        </p>
          
        <p>The Lambda components were developed from sketches using sheet metal
          features and material removal operations, with particular attention
          given to the dimensions and positioning of the joint holes.
        </p>

        <p>
          The chassis was designed as the fixed reference component of the
          assembly. 
        </p>

        <p>
          The external shell was developed separately from the mechanical
          skeleton. The head was constructed using a combination of several
          features and SolidWorks operations to achieve a detailed
          tiger-inspired geometry.
        </p>

        <p>
          Motion Analysis was then used to study the mechanism. A rotational
          motor was applied at the input point of the Lambda mechanism and
          reference points were tracked to evaluate the resulting trajectories.
          The front and rear mechanisms were subsequently synchronized to
          generate coordinated diagonal leg movement.
        </p>

      </section>


      <section className="documentation-section">

        <h2>Results</h2>

        <p>
          The final assembly successfully combines the four-legged mechanical
          structure with the right motion trajectories. Some difficulties have 
          been though encountered during this project with the visual aesthetic integration to the 
          moving mechanism. 
          
        </p> 
        <p>The resulting system reproduces the intended articulated walking 
          behaviour while maintaining the required mechanical constraints.
        </p>

        <p>
          The final model was positioned on a ground reference and evaluated
          using the SolidWorks motion environment with gravity and ground
          interaction considered in the simulation.
        </p>

        <h3>
          The project provided practical experience in parametric CAD,
          mechanical assembly, kinematic constraint definition, degrees-of-
          freedom analysis, linkage mechanisms and motion simulation.
        </h3>

      </section>


      <section className="documentation-section">

        <h2>Future Work</h2>

        <p>
          Several improvements could extend the project from a kinematic CAD
          demonstrator toward a more complete robotic prototype.
        </p>

        <p>
          First, the tiger head could be optimized to minimize its current solid 
          geometry that increases the mass located at the front
          of the robot and could shift the center of gravity forward.        
          A complete mass-property analysis could also be performed to
          determine the total mass, centre of gravity and inertia of the
          complete assembly. These parameters could then be used to optimize
          the shell thickness and mechanical components.
        </p>

        <h3>🠖 Reducing the head mass would improve the overall mass distribution.</h3>

        <p>
          The kinematic study could further be extended into a dynamic analysis
          incorporating joint loads, friction, ground reaction forces, actuator
          torque and rotational speed. This would provide a more realistic
          assessment of the walking mechanism and its mechanical requirements.
        </p>

        <h3>🠖 In-depth kinematic study would permit a more accurate evaluation of 
          the Tchebyshev linkage's trajectory profile alongside its specific structural constraints.</h3>


        <p>
          Finally, the simulated mechanism could be translated into a physical
          prototype by selecting appropriate actuators, transmission systems,
          structural materials and control electronics.
        </p>

      <h3> 🠖 Prototyping this project to correlate virtual models with physical 
        testing.</h3>


      </section>

      <section className="documentation-section">
        
        <h2>Technical Report</h2>

        <h3>To read the full technical report of this project, click on the link right below.</h3>

        <a href="\plantigrade-files\plantigrade-report.pdf"
          target="_blank"
          rel="noreferrer">
         Full Technical Documentation <br/>  
        </a>

      </section>

    </ProjectPage>
  )
}

export default Plantigrade
