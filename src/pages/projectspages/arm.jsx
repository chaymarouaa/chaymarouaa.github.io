import ProjectPage from "../projectpage"

function Arm() {
  return (
    <ProjectPage
      title="Trajectory and Control of a 3R Arm Robot"
      category="Personal Project"
      description="Simulation and trajectory control of a three rotational degree of freedom robot."
      image="/projects-assets/arm.jpg"
      video="/projects-assets/arm.mp4"
    >

      <section className="documentation-section">

        <h2>Project Overview</h2>

        <p>
          This project, supervised by Pr. Sinan Haliyo at Sorbonne University, focuses on controlling the trajectories of a 
          three-degree-of-freedom robotic arm with three revolute joints, from MATLAB code to the physical actuation of the motors. 
          The objective is to enable the robot to perform specific gestures and movements, such as straight lines, curved shapes, 
          and precise trajectories, by translating programmed rotational motions into controlled end-effector movements.
        </p>

      </section>


      <section className="documentation-section">

        <h2>Engineering Approach</h2>

        <p>
          The system combines gesture recognition,
          geometric modelling and real-time animation.
        </p>

      </section>


      <section className="documentation-section">

        <h2>Development</h2>

        <p>
          Computational geometry and interaction logic
          were developed using TouchDesigner and
          hand-tracking technologies.
        </p>

      </section>


      <section className="documentation-section">

        <h2>Results</h2>

        <p>
          The system produces a real-time interactive
          representation of the flower opening mechanism.
        </p>

      </section>


      <section className="documentation-section">

        <h2>Future Work</h2>

        <p>
          Future iterations could incorporate more
          sophisticated kinematic modelling and
          additional interaction modalities.
        </p>

      </section>

     <section className="documentation-section">

        <h2>Technical Report</h2>

        <h3>
          To read the full technical report of this project, click on the
          link below.
        </h3>

        <a
          href="/arm-files/arm-report-original.pdf"
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

export default Arm
