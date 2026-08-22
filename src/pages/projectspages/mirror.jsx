import ProjectPage from "../projectpage"

function Mirror() {
  return (
    <ProjectPage
      title="Optimized Adjustable Mirror Support"
      category="Personal Project"
      description="Modeling a 4-DOF mirror support including two translation and two rotational axis for a better user experience."
      image="/src/assets/projects/image.jpg"
      video="/src/assets/projects/video.mp4"
    >

      <section className="documentation-section">

        <h2>Project Overview</h2>

        <p>
          This project focuses on adapting a CAD modeling for fixed dimensions constraints. 
          The objective is to improve and optimize user experience with rigid, stable, and 
          still light structure to compliment the main piece of the system. 
          
        </p>

      </section>


      <section className="documentation-section">

        <h2>Engineering Approach</h2>

        <p>
         The system has been thaught to be adjustable vertically and horizontally through two separate sliding mates, 
         and also orientable through horizontal and vertical axis through pivot joints.
        </p> 

      </section>


      <section className="documentation-section">

        <h2>Development</h2>

        <p>
          The first and most important piece is the frame, "socle". 
          The stability of the system depends mostly on its geometrical form.
        </p>

      </section>


      <section className="documentation-section">

        <h2>Results</h2>

        <i>The results will be here soon.
        </i>

      </section>


      <section className="documentation-section">

        <h2>Challenges</h2>

        <i>The challenges will be here soon.
        </i>

      </section>

      <section className="documentation-section">

        <h2>Improvements</h2>

        <p>
          The first improvement possible would be to rethink the system to 
          be foldable into a compact configuration to allow easy transportation.
        </p>

        <p>A second improvement would integrate a face tracking system to permit the 
          support to automatically place parallelly to the user face and rotate accordingly 
          to the user movement without human intervention.</p>

      </section>

    </ProjectPage>
  )
}

export default Mirror
