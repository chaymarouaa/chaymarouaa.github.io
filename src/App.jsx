import './App.css'


import Navbar from './components/navbar';
import Hero from './components/hero';
import Projects from './components/projects';
import Career from './components/career';
import Contact from './components/contact';

import {
  BrowserRouter,
  Routes,
  Route
} from "react-router-dom"

import ScrollToHash from "./components/scrollto"

import Lilium from "./pages/projectspages/lilium"
import Trolley from "./pages/projectspages/trolley"
import Arm from "./pages/projectspages/arm"
import Mirror from "./pages/projectspages/mirror"
import Crack from "./pages/projectspages/crack"
import Plantigrade from "./pages/projectspages/plantigrade"
import Sign from "./pages/projectspages/sign"
import Stabilizer from "./pages/projectspages/stabilizer"
import Granular from "./pages/projectspages/granular"


function App() {
  return (
    <BrowserRouter>
      <ScrollToHash />
      <Routes>
        <Route
          path="/"
          element={
            <>

              <Navbar />
              <main>
                <Hero />
                <Projects />
                <Career />
                <Contact />
              </main>
            </>
          }
        />

        <Route
          path="/projectspages/lilium"
          element={<Lilium/>}
        />

        <Route
          path="/projectspages/trolley"
          element={<Trolley/>}
        />
        
        <Route
          path="/projectspages/mirror"
          element={<Mirror/>}
        />

        <Route
          path="/projectspages/crack"
          element={<Crack/>}
        />

        <Route
          path="/projectspages/arm"
          element={<Arm/>}
        />

        <Route
          path="/projectspages/granular"
          element={<Granular/>}
        />

        <Route
          path="/projectspages/plantigrade"
          element={<Plantigrade/>}
        />

        <Route
          path="/projectspages/stabilizer"
          element={<Stabilizer/>}
        />

        <Route
          path="/projectspages/sign"
          element={<Sign/>}
        />


      </Routes>
    </BrowserRouter>
  )
}

export default App