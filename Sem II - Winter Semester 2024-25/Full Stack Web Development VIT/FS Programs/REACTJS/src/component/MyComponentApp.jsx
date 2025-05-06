import React from 'react';  
class MyComponentApp extends React.Component {  
   render() {  
      return (  
         <div>  
            <First/>  
            <Second/>  
         </div>  
      );  
   }  
}  
class First extends React.Component {  
   render() {  
      return (  
         <div>  
            <h1>VIT</h1>  
         </div>  
      );  
   }  
}  
class Second extends React.Component {  
   render() {
      const mystyle = {
         color: "white",
         backgroundColor: "blue",
         padding: "10px",
         fontFamily: "Arial"
       };  
      return (  
         <div>  
            <h2 style={mystyle}>VIT -VELLORE 632014</h2>  
            <p>A PLACE TO LEARN:A CHANCE TO GROW</p>  
         </div>  
      );  
   }  
}  
export default MyComponentApp;  
