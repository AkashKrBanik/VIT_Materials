import { useNavigate, useSearchParams } from "react-router-dom";
import { useState } from "react";

export default function DemoQueryParam () {
    const [searchParams, setSearchParams]=useSearchParams();
    const navigate = useNavigate();
    const [searchQuery, setSearchQuery] = useState(searchParams.get("qval") || "");

    const handleSubmit=(e)=>{
        e.preventDefault();
        //setSearchParams(prev=>({...prev,qval:term}));
        setSearchParams({qval:searchQuery});
        navigate(`/search?qval=${encodeURIComponent(searchQuery)}`);
    }
    
  return (
    <form onSubmit={handleSubmit}>
      <input
        type="text"
        placeholder="Search..."
        value={searchQuery}
        onChange={(event) => setSearchQuery(event.target.value)}
      />
      <button type="submit">Search</button>
    </form>
  );
};