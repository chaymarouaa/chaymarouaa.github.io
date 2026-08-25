import { motion } from "motion/react"

function About() {
  return (
    <section id="about" className="section about-section">

      <div className="about-header">
        <h2>About Me</h2>
        <h3>In active research of a one-year contract apprenticeship for 2026-2027</h3>
      </div>

      <div className="about-content">

        <motion.div
          className="about-text"
          initial={{ opacity: 0, y: 30 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true, amount: 0.2 }}
          transition={{
            duration: 0.7,
            ease: [0.22, 1, 0.36, 1],
          }}
        >

          <p>
            I am a Mechanical Engineering student with a strong interest in
            robotics, mechatronics and biomechanics.
          </p>

          <p>
            My engineering background combines mechanical design, numerical
            modelling and programming, with hands-on experience through
            academic and personal projects. I particularly enjoy designing
            and analysing mechanical systems, developing robotic mechanisms
            and using computational tools to investigate engineering problems.
          </p>

          <p>
            My long-term goal is to work at the intersection of robotics and
            human assistance, with a particular interest in exoskeletons,
            bionic prosthetics and rehabilitation technologies.
          </p>

          <p>
            I am currently looking for an engineering apprenticeship for the
            2026–2027 academic year, ideally in mechanical design, robotics
            or mechatronics.
          </p>

          <i><br/>More details about my academic journey are available on my resume right below. </i>

          <div className="about-cv">

            <span>Download my Resume</span>

            <div className="about-cv-buttons">

              

              <a
                href="/resume/eng-cv-ats-Chayma-ROUAA.pdf"
                target="_blank"
                rel="noopener noreferrer"
                className="about-cv-button"
              >
                English Resume
              </a>
              
              <a
                href="/resume/cv-ats-Chayma-ROUAA.pdf"
                target="_blank"
                rel="noopener noreferrer"
                className="about-cv-button"
              >
                CV Français
              </a>

            </div>

          </div>

        </motion.div>

      </div>

    </section>
  )
}

export default About
