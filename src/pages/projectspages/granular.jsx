import ProjectPage from "../projectpage"

function Granular() {
  return (
    <ProjectPage
      title="Granular Flow Modeling"
      category="Personal Project"
      description="A discrete numerical model of granular flow developed 
      in Fortran 90, simulating the formation and evolution of a sandpile 
      under gravity."
      image="/src/assets/projects/granular.jpg"
    >

      <section className="documentation-section">

        <h2>Project Overview</h2>

        <p>This project focuses on the 2D numerical modelling of a granular flow, 
          simulating the formation of a sand pile over time.<br/>
          The model represents the sand as a set of vertical particle stacks and 
          reproduces the progressive redistribution of grains from one stack to the 
          next. The simulation accounts for the stochastic nature of grain 
          transfers and allows the evolution of the pile and its avalanche activity 
          to be observed over time.
        </p>

        <p>
          Developed in Fortran 90, the project combines numerical modelling, algorithmic implementation and data analysis to reproduce the collective behaviour of a granular system.
        </p>



      </section>


      <section className="documentation-section">

        <h2>Engineering Approach</h2>

        <p>The granular system is represented using a discrete 2D model, where each 
          vertical stack stores the number of grains at a given position. <br/>
          At each time step, a grain is added to the central stack and redistributed 
          according to a stochastic transfer rule based on the difference in height 
          between neighbouring stacks. This process generates successive avalanches 
          and progressively builds the sand pile.
        </p>

        <p>The model uses: <br/>

          • discrete particle stacks to represent the granular material, <br/>
          • stochastic grain transfer to reproduce irregular avalanches, <br/>
          • time-stepping to simulate the pile evolution,<br/>
          • dynamic arrays and structured data types,<br/>
          • avalanche-size statistics for quantitative analysis.
        </p>

        <p>
          The model was subsequently extended from a half-pile representation to 
          a complete sand pile, with grain redistribution occurring alternately to 
          the left and right of the central stack.
        </p>
          
      </section>


      <section className="documentation-section">

        <h2>Development</h2>

        <p>
          The simulation was developed in Fortran 90, using a modular structure 
          separating the main program from the computational procedures.<br/>
          The implementation includes controlled parameter input, dynamic memory 
          allocation, time-loop management, grain redistribution, graphical output 
          and result file generation.
        </p>

        <p>
          The code was progressively improved by:<br/>
          • reorganising the computational logic into a dedicated module,<br/>
          • separating the main program from the simulation procedures,<br/>
          • replacing manual parameter input with file-based configuration,<br/>
          • generating simulation data for post-processing,<br/>
          • extending the model from a half-pile to a full pile.
        </p>

        <p>
          This progression transformed the initial prototype into a more 
          structured and reusable numerical simulation.
        </p>

      </section>


      <section className="documentation-section">

        <h2>Results</h2>

        <p>
          The simulation successfully reproduces the progressive formation of a 2D 
          sand pile through successive grain transfers.<br/>

          The animation provides a direct visualization of the granular flow, while 
          the generated data allows the behaviour of the system to be analysed 
          quantitatively.
        </p>

        <p>
          The model produces:<br/>

          • the final grain distribution across the pile,<br/>
          • the evolution of the pile during the simulation,<br/>
          • the distribution of avalanche sizes,<br/>
          • a pile profile consistent with the simulated geometry.
        </p>

        <p>
          The avalanche-size distribution also reproduces the expected qualitative 
          behaviour of the BTW (Bak-Tang-Wiesenfeld) sandpile model, providing a useful link between the 
          numerical implementation and a known discrete model of self-organized 
          criticality.
        </p>

      </section>


      <section className="documentation-section">

        <h2>Future Improvements</h2>

        <p>
          The model remains a simplified representation of real granular mechanics.<br/>
          The main limitation is the discrete and highly idealised description of 
          the material. Real sand is influenced by factors such as gravity, 
          friction, grain shape and contact interactions, which are not explicitly 
          modelled.<br/>
          The resulting pile can therefore exhibit sides that are steeper and 
          smoother than those observed experimentally. The stochastic transfer 
          mechanism also means that identical input parameters can produce slightly 
          different configurations.
        </p>

      </section>

      <section className="documentation-section">
        
        <h2>Technical Report</h2>

        <h3>To read the full technical report of this project, click on the link right below in the original version.</h3>

        <a href="/reports/granular/Projet_modelisation_ecoulement_granulaire_ROUAA_SOUTO.pdf"
          target="_blank"
          rel="noreferrer">
         Full Technical Documentation (original french version) 
        </a>
        

        <h3>The english version is not yet available.</h3>

        <a href="/reports/granular-report/granular.pdf"
          target="_blank"
          rel="noreferrer">
         Full Technical Documentation (remastered english version) 
        </a>


      </section>

    </ProjectPage>
  )
}

export default Granular
