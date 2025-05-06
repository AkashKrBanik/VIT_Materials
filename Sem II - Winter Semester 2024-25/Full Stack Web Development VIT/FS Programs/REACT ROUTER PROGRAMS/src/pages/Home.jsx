import { Outlet, Link } from "react-router-dom";
export default function Home(){
    return <div>MY HOME!!!
    <nav>
        <ul>
          <li>
            <Link to="/">Home</Link>
          </li>
          <li>
            <Link to="/about">About</Link>
          </li>
          <li>
            <Link to="/product">Product</Link>
          </li>
          <li>
            <Link to="/categories">Categories</Link>
          </li>
          <li>
            <Link to="/fact/5">Factorial</Link>
          </li>
          <li>
            <Link to="/firstvar/5/secondvar/6">Summation</Link>
          </li>
          <li>
            <Link to="/search">Search</Link>
          </li>
          <li>
            <Link to="/queryparamdemo">QueryParams Demo</Link>
          </li>
        </ul>
      </nav>
      <Outlet />

    </div>

    
}