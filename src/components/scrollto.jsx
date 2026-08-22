import { useEffect } from "react"
import { useLocation } from "react-router-dom"

function ScrollToHash() {
  const location = useLocation()

  useEffect(() => {
    if (location.hash) {
      const element = document.getElementById(
        location.hash.substring(1)
      )

      if (element) {
        setTimeout(() => {
          element.scrollIntoView({
            behavior: "smooth",
            block: "start",
          })
        }, 100)
        return
      }
    }

  window.scrollTo({
      top: 0,
      left: 0,
      behavior: "instant",
    })
  }, [location.pathname, location.hash])
}

export default ScrollToHash