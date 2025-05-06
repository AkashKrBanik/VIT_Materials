

import { BrowserRouter, Routes,Route } from 'react-router-dom'
import Home from './pages/Home'
import About from './pages/About'
import Product from './pages/Product'
import NoPage from './pages/NoPage'
import './App.css'
import Index from './pages/Index'

function App() {


  return (
    <>
      <div>
        <BrowserRouter>
        <Routes>
          
          <Route path="/" element = {<Home/>}/>
          <Route path="about" element={<About />} />
          <Route path="product" element={<Product />} />
          <Route path="*" element={<NoPage />} />
        </Routes>
        
        </BrowserRouter>
        


      </div>

    </>
  )
}

export default App
