import ProjectPage from "../projectpage"

function Trolley() {
  return (
    <ProjectPage
      title="Intelligent Trolley Assistant"
      category="Personal Project"
      description="Mechatronic embedded system integrated into a trolley to help load transportation for people with strength and ability limitations."
      image="/src/assets/projects/image.jpg"
      /*video="/src/assets/projects/video.mp4"*/
    >

      <section className="documentation-section">

        <h2>Project Overview</h2>

        <p>
          This project aims to improve the everyday usability of a conventional trolley by developing 
          an assistive mechanism that reduces the physical effort required from the user. 
          The objective is to achieve a dynamically stable mobile platform capable of transporting 
          its load while providing greater autonomy and minimizing user exertion.
        </p>

      </section>


      <section className="documentation-section">

        <h2>Engineering Approach</h2>

        <p>
          The system is designed around an assisted propulsion mechanism activated through mechanical input,
          inspired by the operating principle of electric scooters. It integrates obstacle detection and
          stability-enhancing features to enable semi-autonomous load transportation while minimizing
          the physical effort required from the user.
        </p>

        <p>
          To improve usability and safety, the system also incorporates several human-machine interface
          and safety functions, including an emergency stop, directional controls, and a dedicated
          obstacle-handling command. One of the main engineering challenges is the development of a
          stair-climbing mechanism capable of negotiating steps while requiring minimal assistance from
          the user.
        </p>

        <p>
          The main system requirements are:
          <br/>
          - <strong>Geared motor:</strong> provides the propulsion required for assisted motion.<br/>
          - <strong>Force sensor:</strong> detects the user's mechanical input and triggers motor assistance accordingly.<br/>
          - <strong>ESP32:</strong> serves as the main control unit, interfacing with the user controls and translating
          their inputs into motor commands.<br/>
          - <strong>Obstacle detection:</strong> identifies obstacles and contributes to the appropriate motion or safety response.<br/>
          - <strong>Safety controls:</strong> provide immediate user intervention through an emergency stop and dedicated controls.
        </p>

      </section>


      <section className="documentation-section">

        <h2>Development</h2>

        <h3>
          This part will be updated soon. 
        </h3>

      </section>

      <section className="documentation-section">

        <h2>Mechanical Aspect</h2>

        <h3>
          This part will be updated soon. 
        </h3>

      </section>

      <section className="documentation-section">

        <h2>Electronical Aspect</h2>

        <h3>
          This part will be updated soon. 
        </h3>

      </section>


      <section className="documentation-section">

        <h2>Results</h2>

        <h3>
          This project is still in development, therefore the results are not available for the moment, but will be published soon. 
        <br/>
        <br/>
        To be notified by the progress of this project, don't hesitate to take a look at my LinkedIn profile with the link right below.
        
        <br/><br/>
        <a
          href="https://linkedin.com/in/chaymarouaa"
          target="_blank"
          rel="noreferrer"
        >
          Click here to see Chayma Rouaa Linkedin profile
        </a>
        </h3>

      </section>


      <section className="documentation-section">

        <h2>Challenges</h2>

        <p>
         <strong>1. Load transfer and stability</strong>
        <br/>
        The first engineering challenge was to redesign the load-transfer 
        path so that the system could support the majority of the load itself, 
        rather than transferring a significant portion of the weight to the 
        user. This had to be achieved without compromising the stability of the 
        dynamically moving platform.
        <br/>
        One proposed solution was to introduce an elevated support wheel 
        positioned to carry the portion of the load normally supported by the 
        user. In side view, this configuration would create a characteristic 
        lamba-shaped geometry, providing an additional support point and 
        modifying the system's center of mass and load distribution. The 
        obstacle-detection sensor could also be positioned near this wheel 
        to detect stairs and other elevated obstacles before they reach the 
        front of the system.
        </p>
        <p>
          <strong>2. Stair-climbing</strong>
          <br/>
          The second major engineering challenge was to develop a stair-climbing strategy capable of negotiating steps while requiring minimal physical assistance from the user. The mechanism must coordinate propulsion, weight transfer, and stability throughout the climbing sequence while maintaining controlled and predictable motion.<br/>
        </p>

      </section>

      <section className="documentation-section">
        
        <h2>Technical Report</h2>

        <h3>The technical report of this project is not yet available. </h3>

        <h3>
          
          To be notified by the progress of this project, don't hesitate to take a look at my GitHub profile with the link right below.
          
          <br/><br/>
          <a
            href="https://github.com/chaymarouaa"
            target="_blank"
            rel="noreferrer"
          >
            Click here to see Chayma Rouaa GitHub profile
          </a>
        </h3>


      </section>


    </ProjectPage>
  )
}

export default Trolley
