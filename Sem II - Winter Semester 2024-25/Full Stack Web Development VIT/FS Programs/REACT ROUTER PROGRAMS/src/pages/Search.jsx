import { useParams, useSearchParams } from "react-router-dom";
import { useState } from "react";

export default function Search () {
    const [searchParams, setSearchParams]=useSearchParams();
    const query = searchParams.get("qval");
  const [term, setValue ] = useState(query || "");
  //var varc= Number(vara)+ Number(varb);
    const handleSearch=(e)=>{
        e.preventDefault();
        //setSearchParams(prev=>({...prev,qval:term}));
        //console.log("TARGET"+e.target.id);
        setSearchParams({qval:term,tval:23});
    }
    
  return (
    <div>
        
      <h1>SEARCH</h1>
      <form onSubmit={handleSearch}>
      <input type="text" value={term} onChange={(e)=>setValue(e.target.value)}/>
      <input type="submit" value="Search" id="search" name="Search"></input>
      </form>
      Extracted Param =<h2>{query}</h2>
    </div>
  );
};