import React, { useState } from "react"; 
function FunctionalCounter() {
    const [count, setCount] = useState(0); 

    function increase(){
        setCount(count + 1); 
    }
    function decrease(){
        setCount(count - 1); 
    }
	return ( 
		<div style={{ margin: '50px' }}> 
        
			<h3>Click Like /Dislike Button</h3> 
			<h2>{count} likes</h2> 
			<button onClick={increase}>Likes</button> 
            <button disabled={count === 0 } onClick={decrease}>DisLike</button> 
        </div> 
	) 
  }
/*const FunctionalComponent = () => { 
	const [count, setCount] = useState(0); 

	const increase = () => { 
		setCount(count + 1); 
	} 

	return ( 
		<div style={{ margin: '50px' }}> 
			<h1>Welcome to Geeks for Geeks </h1> 
			<h3>Counter App using Functional Component : </h3> 
			<h2>{count}</h2> 
			<button onClick={increase}>Add</button> 
		</div> 
	) 
} */

export default FunctionalCounter; 
