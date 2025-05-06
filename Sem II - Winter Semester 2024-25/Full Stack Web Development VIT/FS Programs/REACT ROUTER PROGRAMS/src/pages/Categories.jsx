import { NavLink, Link,Outlet } from "react-router-dom";
//import Men from "./Men";
//import Female from "./Female";
export default function Categories() {
  return (
 <>
          <NavLink to="male">
            Men
          </NavLink><br></br>
          <NavLink to="female">
          Female
          </NavLink>
      <Outlet />
</>
  );
}