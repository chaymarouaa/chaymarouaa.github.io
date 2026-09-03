import ProjectPage from "../projectpage"

function Lilium() {
  return (
    <>

    <ProjectPage
      title="Interactive Biomimetic Lilium"
      category="Personal Project"
      description="Computational design of an interactive biomimetic lily controlled through hand tracking."
      image="/projects-assets/lilium.jpg"
      video="/projects-assets/lilium2.mp4"
    >

      <section className="documentation-section">
        
        <h3>
          This project is not yet available. More informations will be published soon. 
        </h3>

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
    </>
  )
}

export default Lilium
