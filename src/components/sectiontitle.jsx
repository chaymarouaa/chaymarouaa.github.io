import { motion, AnimatePresence } from "motion/react"
import { useState } from "react"

function SectionTitle({ children }) {
  const [hovered, setHovered] = useState(false)

  const particles = [
    { x: -35, y: -18, duration: 2.4, delay: 0 },
    { x: 42, y: -25, duration: 2.8, delay: 0.15 },
    { x: -50, y: 12, duration: 2.6, delay: 0.3 },
    { x: 52, y: 18, duration: 2.2, delay: 0.1 },
    { x: -18, y: 28, duration: 2.9, delay: 0.4 },
    { x: 25, y: -35, duration: 2.5, delay: 0.25 },
  ]

  return (
    <motion.div
      className="section-title"
      initial={{ opacity: 0, x: -40 }}
      whileInView={{ opacity: 1, x: 0 }}
      viewport={{ once: true, amount: 0.5 }}
      transition={{
        duration: 0.8,
        ease: [0.22, 1, 0.36, 1],
      }}
      onMouseEnter={() => setHovered(true)}
      onMouseLeave={() => setHovered(false)}
    >
      <AnimatePresence>
        {hovered &&
          particles.map((particle, index) => (
            <motion.span
              key={index}
              className="section-particle"
              initial={{
                opacity: 0,
                scale: 0,
                x: 0,
                y: 0,
              }}
              animate={{
                opacity: [0, 0.7, 0],
                scale: [0, 1, 0.5],
                x: particle.x,
                y: particle.y,
              }}
              exit={{
                opacity: 0,
                scale: 0,
              }}
              transition={{
                duration: particle.duration,
                delay: particle.delay,
                ease: "easeInOut",
              }}
            />
          ))}
      </AnimatePresence>

      <h2>{children}</h2>
    </motion.div>
  )
}

export default SectionTitle