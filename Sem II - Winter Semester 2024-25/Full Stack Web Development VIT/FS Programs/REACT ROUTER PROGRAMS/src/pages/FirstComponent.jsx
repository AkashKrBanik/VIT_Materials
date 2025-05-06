import {Link, useNavigate} from 'react-router-dom';
import { BrowserRouter, Routes,Route } from 'react-router-dom'

function ComponentA(props) {

  const navigate = useNavigate();

  const toComponentB=()=>{
navigate('/componentB',{state:{coursecode:'CSE1001',coursename:'PYTHON',credits:3}});
  }

  return (
   <>
 
 <div> <button  onClick={()=>{toComponentB()}}>Display Course Data</button></div>
 
</>
  );


}


export default ComponentA;