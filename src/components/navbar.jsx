import { motion } from "motion/react"

function Navbar() {
  return (
    <motion.nav className="navbar"
            initial={{ opacity: 0, y: 40 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.8, delay: 0.1 }}>

      <a href="#home" className="navbar-logo">
        CHAYMA ROUAA
      </a>

      <div className="navbar-links">
        <a href="#projects">
          <span className="nav-indicator">•</span>
          <span>WORK</span>
        </a>

        <a href="#about">
          <span className="nav-indicator">•</span>
          <span>ABOUT</span>
        </a>

        <a href="#career">
          <span className="nav-indicator">•</span>
          <span>CAREER</span>
        </a>

        <a href="#contact">
          <span className="nav-indicator">•</span>
          <span>CONTACT</span>
        </a>
      </div>
    </motion.nav>

  )
}

export default Navbar