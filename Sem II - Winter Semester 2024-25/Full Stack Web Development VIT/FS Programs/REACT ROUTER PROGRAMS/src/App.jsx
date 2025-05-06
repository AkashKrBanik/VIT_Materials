

import { BrowserRouter, Routes,Route } from 'react-router-dom'
import Home from './pages/Home'
import About from './pages/About'
import Product from './pages/Product'
import NoPage from './pages/NoPage'
import Categories from './pages/Categories'
import Male from './pages/Men'
import Female from './pages/Female'
import Fact from './pages/AddParam'
import Summation from './pages/Addition'
import Search from './pages/Search'
import DemoQueryParam from './pages/QueryParams'
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
          <Route path="categories" element={<Categories/>}>
                    <Route path="male" element={<Male/>}/>
                        <Route path="female" element={<Female/>}/>
                </Route>
          <Route path="/fact/:id" element={<Fact />} />
          <Route path="/firstvar/:vara/secondvar/:varb" element={<Summation />} />
          <Route path="search" element={<Search />} />
          <Route path="queryparamdemo" element={<DemoQueryParam />} />
        </Routes>        
        </BrowserRouter>
      </div>

    </>
  )
}

export default App
