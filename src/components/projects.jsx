import ProjectCard from "./projectcard"


const personalProjects = [
  { 
  title: 'Interactive Biomimetic Lilium',
  slug: "Lilium",
  category : "Personal Project",
  year: "2026",
  stage : "Final Stage",
  description: "Interactive computational model of a biomimetic lily controlled through hand tracking.",
  image: "/projects-assets/lilium.jpg",
  tags: ["Hand-tracking", "Kinematics", "Biomimetics", "Nonlinear Dynamics", "Logistic Growth", "Bezier Curves"],
  tools: ["Touch-Designer", "MediaPipe"]
  },

  { 
  title: 'Intelligent Trolley Assistant',
  slug: "Trolley",
  category : "Personal Project",
  year: "2026",
  stage : "Ongoing",
  description: "Development of a mechatronic embedded system integrated into an existing trolley for load transport assistance.",
  image: "/projects-assets/trolley.jpg",
  tags: ["Mechatronics", "Robotics", "Simulation", "Reverse Engineering"],
  tools: ["CATIA", "Matlab", "Simscape Electrical"]
  },

  {
  title: 'Optimized Adjustable Mirror Support',
  slug: "Mirror",
  category: "Personal Project",
  year: "2026",
  stage: "Test and Validation Stage",
  description: "Modeling an adjustable mechanical structure for optimized use.",
  image: "/projects-assets/mirror.jpg",
  tags: ["CAD Modeling", "Assembly", "3D printing", "Mechanism", "3-DOF", "Mechanical Engineering", "Reverse Engineering"],
  tools: ["CATIA"]
  }
  
]

const academicProjects = [
  {
  title: 'Plantigrade Robot',
  slug: "Plantigrade",
  category: "Academic Project",
  year: "2022",
  stage: "Finished",
  description: "Mechanical design of a plantigrade walking mechanism based on a Chebyshev linkage.",
  image: "/projects-assets/plantigrade.jpg",
  tags: ["Robotics", "CAD Modeling", "Chebychev Mechanism"],
  tools: ["SolidWorks"]
  },

  {
  title: '3R Arm Robot Trajectory Control',
  slug: "Arm",
  category: "Academic Project",
  year: "2024",
  stage : "Finished",
  description:"Trajectory modelling and control of a three-degree-of-freedom robotic arm.",
  image: "/projects-assets/arm.jpg",
  tags: ["Robotics", "Control", "Trajectory", "Interpolation"],
  tools: ["Matlab"]
  },

  {
  title: 'Crack Propagation Simulation',
  slug: "Crack",
  category: "Academic Project",
  year: "2024",
  stage : "Finished",
  description:"Numerical modelling of crack propagation using Python.",
  image: "/projects-assets/crack.jpg",
  tags: ["Simulation", "Discrete Mechanics", "Energy Analysis", "Solid Mechanics", "Elastic Structures", "Verlet"],
  tools: ["Python", "Ovito" ]
  },

  {
  title: 'Time-Iterative Granular Flow Simulation',
  slug: "Granular",
  category: "Academic Project",
  year: "2023",
  stage : "Finished",
  description: "Numerical study of granular material flow over time.",
  image: "/projects-assets/granular.jpg",
  tags: ["Simulation", "Numerical Methods", "Programming"],
  tools: ["Fortran"]
  },
 
]

const futureProjects = [
  {
  title: 'Drone-based Smartphone Stabilizer',
  slug: "Stabilizer",
  category: "Upcoming Project",
  year: "2026",
  stage: "Study Stage",
  description: "Development of a hand-free intelligent tool for video oriented use based on face-tracking.",
  image: "/projects-assets/stabilizer.jpg",
  tags: ["Robotics", "Embedded System", "Stability", "Vibrations", "Mechatronics", "IMU","AHRS", "GNSS", "INS"],
  tools: ["Siemens NX", "Matlab", "Simulink", "ANSYS"]
  },

  {
  title: 'Sign Language and Gesture-Driven Commands Implementation on Humanoid Robot',
  slug: "Sign",
  category: "Upcoming Project",
  year: "2022",
  stage: "Study Stage",
  description: "Implementation of Gesture-Based control using Hand-tracking for Humanoids Specific Actions",
  image: "/projects-assets/sign.jpg",
  tags: ["Medical Robotics", "Hand-tracking", "Robot Control", "HMI", "Gesture Interpretation", "Human Motion",],
  tools: ["TouchDesigner", "Matlab"]
  }]

function Projects() {
  return (
    <section id="projects" className="section">
      <div className="section-header">
        <p className="section-label">SELECTED WORK</p>
        <h2>Projects</h2>
      </div>

      <div className="project-category">
        <h3>Personal Projects</h3>

        <div className='project-grid'> 
          {personalProjects.map((project) => (
            <ProjectCard
              key={project.title}
              {...project}
            />

          ))}
        </div>        
      </div>

      <div className="project-category">
        <h3>Academic Projects</h3>

        <div className='project-grid'> 
          {academicProjects.map((project) => (
            <ProjectCard
              key={project.title}
              {...project}
            />

          ))}
        </div> 
      </div>

      <div className="project-category">
        <h3>Future Projects</h3>

        <div className='project-grid'> 
          {futureProjects.map((project) => (
            <ProjectCard
              key={project.title}
              {...project}
            />

          ))}
        </div> 


      </div>
    </section>
  )
}

export default Projects