import { motion } from "motion/react"

function Hero() {
  return (
    <section id="home" className="hero">
      <motion.div
        initial={{ opacity: 0, y: 140 }}
        animate={{ opacity: 1, y: 80 }}
        transition={{ duration: 0.9, delay: 0.1 }}>


      
        <p
        className="hero-eyebrow"
        transition={{ duration: 0.6 }}
        >
        ENGINEERING PORTFOLIO
        </p>

        <h1>Chayma Rouaa</h1>

        <p
        className="hero-subtitle"
        transition={{ delay: 0.3 }}
        >
        Mechanical Engineering · Robotics · Mechatronics · Biomechanics
        </p>

        <p>
        Engineering student based in Paris interested in the design, modelling and
        development of intelligent mechanical systems.
        </p>

        <h3>
          Third-year Engineering Sciences student 
          at Université Évry Paris-Saclay, seeking 
          an apprenticeship for the 2026-2027 
          academic year.
        </h3>

        <a href="#projects" className="hero-button">
        VIEW PROJECTS
        </a>

      </motion.div>

      
    </section>
  )
}

export default Hero