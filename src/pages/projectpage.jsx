import { Link } from "react-router-dom"

function ProjectPage({
  title,
  category,
  description,
  video,
  children,
}) {
  return (
    <main className="project-page">

      <section className="project-page-hero">

        <Link
          to="/#projects"
          className="project-back"
        >
          Back to Projects
        </Link>

        <p className="project-page-category">
          {category}
        </p>

        <h1>{title}</h1>

        <p className="project-page-intro">
          {description}
        </p>

        {video && (
          <video
            className="project-page-video"
            src={video}
            autoPlay
            muted
            loop
            playsInline
          />
        )}

      </section>

      <div className="project-page-content">
        {children}
      </div>

    </main>
  )
}

export default ProjectPage