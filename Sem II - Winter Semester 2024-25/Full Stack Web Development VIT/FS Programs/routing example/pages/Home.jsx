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
        </ul>
      </nav>
      <Outlet />

    </div>

    
}