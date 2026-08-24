import ProjectPage from "../projectpage"

function Mirror() {
  return (
    <ProjectPage
      title="Optimized Adjustable Mirror Support"
      category="Personal Project"
      /*description="Modeling an optimized mirror support for a better user experience"*/
      image="/src/assets/projects/image.jpg"
      /*video="/src/assets/projects/video.mp4"*/
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
         The system aims to be adjustable vertically and horizontally through two separate sliding mates, 
         and also orientable through horizontal and vertical axis through pivot joints.
        </p> 

      </section>


      <section className="documentation-section">

        <h2>Development</h2>

        <h3>
          This part will be updated soon. 
        </h3>

      </section>


      <section className="documentation-section">

        <h2>Results</h2>

        <h3>
          This part will be updated soon. 
        </h3>

      </section>


      <section className="documentation-section">

        <h2>Challenges</h2>

        <h3>
          This part will be updated soon. 
        </h3>

      </section>

      <section className="documentation-section">

        <h2>Improvements</h2>

        <p>
          The first improvement possible would be to rethink the system to 
          be foldable into a compact configuration to allow easy transportation.
        </p>

        <p>A second improvement more sophisticated would integrate a face tracking system to permit the 
          support to automatically be placed parallelly to the user face and rotate accordingly 
          to the user movement without human intervention.</p>

      </section>

      <section className="documentation-section">
        
        <h2>Technical Report</h2>

        <h3>The technical report of this project will be published soon. </h3>

        <h3>
          
          To be notified by the progress of this project, don't hesitate to take a look at my LinkedIn and GitHub profile with the link right below.
          
          <br/><br/>
          

          <a
          href="https://linkedin.com/in/chaymarouaa"
          target="_blank"
          rel="noreferrer"
        >
          Linkedin <br/> Chayma Rouaa
        </a>
        <a
          href="https://github.com/chaymarouaa"
          target="_blank"
          rel="noreferrer"
        >
          GitHub <br/> Chayma Rouaa 
        </a>
        </h3>


      </section>


    </ProjectPage>
  )
}

export default Mirror
