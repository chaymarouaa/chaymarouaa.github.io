import ProjectPage from "../projectpage"

function Lilium() {
  return (
    <ProjectPage
      title="Interactive Biomimetic Lilium"
      category="Personal Project"
      description="Computational design of an interactive biomimetic lily controlled through hand tracking."
      image="/src/assets/projects/lilium.jpg"
      video="/src/assets/projects/lilium.mp4"
    >

      <section className="documentation-section">

        {/*<span className="section-number">
          01
        </span>*/}

        <h2>Project Overview</h2>

        <p>
          This project explores the interaction between
          computational biomimicry, hand tracking and
          real-time visual systems.<br/><br/><br/><br/><br/><br/><br/>
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

    </ProjectPage>
  )
}

export default Lilium
