import {motion} from "motion/react"
import { Link } from "react-router-dom"

function ProjectCard({
    slug,
    image,
    title,
    category,
    year,
    stage,
    description,
    tags = [],
    tools = []
}) {
    return (
      <Link
        to={`/projectspages/${slug}`}
        className="project-card-link">
      <motion.article className="project-card"
        initial={{ opacity: 0, y: 40 }}
        whileInView={{ opacity: 1, y: 0 }}
        viewport={{ once: true, amount: 0.2 }}
        transition={{
          duration: 0.7,
          ease: [0.22, 1, 0.36, 1],
        }}
        whileHover={{ y: -6 }}
        >
        <div className="project-image">
          <motion.img
            src={image} 
            alt={title} 
            initial= {{
              filter: "blur(15px)",
              scale: 2
            }}
            whileHover={{
              filter: "blur(0px)",
            scale: 1.05,
            }}

            transition={{
              duration: 0.7,
              ease: [0.22, 1, 0.36, 1],

            }}
          
          />
            
          <div className="project-image-overlay" />
        </div>

        <div className="project-info">

        <p className="project-category">
          {category}
        </p>

        <h3>{title}</h3>

        <p className="project-year">
          {year}
        </p>

        <p className="project-stage">

          {stage}
        </p>

        <p className="project-description">
          {description}
        </p>

        <div className="project-tags">
          {tags.map((tag) => (
            <span key={tag}>{tag}</span>
          ))}
        </div>

        <div className="project-tools">
          {tools.map((tools) => (
            <span key={tools}>{tools}</span>
          ))}
        </div>

        <a href="#" className="project-link">
          Explore project →
        </a>

      </div>

    </motion.article>
    </Link>
  )
}

export default ProjectCard 
