import ProjectPage from "./projectpage"

function ProjectName() {
  return (
    <ProjectPage
      title="Project Title"
      category="Personal Project"
      description="Little description of the project."
      image="/src/assets/projects/image.jpg"
      video="/src/assets/projects/video.mp4"
    >

      <section className="documentation-section">

        <h2>Project Overview</h2>

        <p>
          nanana.<br/><br/><br/><br/><br/><br/><br/>
        </p>

      </section>


      <section className="documentation-section">

        <h2>Engineering Approach</h2>

        <p>
          nanana.
        </p>

      </section>


      <section className="documentation-section">

        <h2>Development</h2>

        <p>
          nanana.
        </p>

      </section>


      <section className="documentation-section">

        <h2>Results</h2>

        <p>
          nanana.
        </p>

      </section>


      <section className="documentation-section">

        <h2>Future Work</h2>

        <p>
          nanana.
        </p>

      </section>

    </ProjectPage>
  )
}

export default ProjectName