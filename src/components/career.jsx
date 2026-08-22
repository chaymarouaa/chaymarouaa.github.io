import { useState } from "react"
import { motion } from "motion/react"
import SectionTitle from "./sectiontitle"

const careerGoals = [
  {
    id: 1,
    year: "2026 — 2027",
    title: "Engineering Apprenticeship",
    description:
      "One-year engineering apprenticeship focused on mechanical design or robotics.",
    location: "in Paris area, France",
    position: "left",
  },
  {
    id: 2,
    year: "2027 — 2029",
    title: "Master of Robotics",
    description:
      "Specialization in robotics, biomechanics or intelligent mechatronic systems.",
    location: "in France, or worldwide",
    position: "right",
  },
  {
    id: 3,
    year: "2029",
    title: "International Graduation Internship",
    description:
      "International engineering experience robotics, ideally for health assistance and rehabilitation : exoskeletons, bionic prosthetics, human assistance oriented devices.",
    location: "Asia, Switzerland or the US",
    position: "left",
  },
  {
    id: 4,
    year: "2030+",
    title: "Robotics for Healthcare",
    description:
      "Working on robotic systems for healthcare, rehabilitation, assistance and human augmentation.",
    location: "Worldwide, including France",
      position: "right",
  },
]

function Career() {
  const [activeId, setActiveId] = useState(null)

  return (
    <section id="career" className="section">
     
        <div className="section-header">
          <h2>Career Objectives</h2>

          <h3>A long-term timeline of several professional goals.</h3>
        </div>

      <div className="career-roadmap">
        {careerGoals.map((goal) => {
          const isActive = activeId === goal.id
            const isInactive =
            activeId !== null && activeId !== goal.id

          return (
            <motion.article
              key={goal.id}
              className={"career-node ${goal.position}"}
              onMouseEnter={() => setActiveId(goal.id)}
              onMouseLeave={() => setActiveId(null)}

              animate={{
                opacity: isInactive ? 0.3:1,
                scale: isActive ? 1.05 : 1,
                x: isActive
                  ? goal.position === "left"
                    ? 10
                    : -10
                  : 0,
              }}
              transition={{
                duration: 0.6,
                ease: [0.5, 1, 0.5, 1],
              }}
            >

              <motion.div
                className="career-bubble"
                animate={{
                  scale: isActive ? 1.6 : 1,
                  opacity: isActive ? 1 : 0.7,
                }}

                transition={{
                  duration: 0.45,
                  ease: [0.22, 1, 0.36, 1],
                }}

              />

              <div className="career-content">

                <span className="career-year">
                  {goal.year}
                </span>

                <h3>{goal.title}</h3>

                <p>{goal.description}</p>

                <p><br/><i>{goal.location}</i></p>

              </div>

            </motion.article>
          )
        })}

      </div>

    </section>
  )
}

export default Career