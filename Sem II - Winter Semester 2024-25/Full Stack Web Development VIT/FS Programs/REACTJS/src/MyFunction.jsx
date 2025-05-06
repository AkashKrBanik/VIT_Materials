import './MyFunction.css';
function MyFunction_DT() {
    var cTime = new Date().toTimeString();
    return (
      <div><p>The current time is {cTime}</p></div>
    );
  }
  function Greeting() { 
    return <h3>Hello React!!!!</h3> 
 } 
 
 function getCurrentTime() {
    return new Date().toTimeString();
 }

 //Applying Styling through External style sheet
 function welcomeMessage(param) {
  return <h1 className="dataStyle">Welcome to {param}</h1>;
}
function ListProc() {
  const myArray = ['ONE', 'TWO', 'THREE', 'Four', 'FIVE'];   
  const listItems = myArray.map((numeral)=>{   
    return <li>{numeral+" ***"}</li>;   
});
//Note the Warning at Line 28-Each child in a list should have a unique "key" prop.
return (  
  <div>  
      <h2>Rendering Lists inside component</h2>  
            <ul>{listItems}</ul>  
  </div>  
); 

}

function NumberList(props) {
  const numbers = props.numbers;
  const listItems = numbers.map((number) =>
    <li>{number*5}</li>
  );
  return (
    <ul>{listItems}</ul>
  );
}

function NumberListEven(props) {
  const numbers = props.numbers;
  const listItems = numbers.map((number) =>
       {if (number %2 === 0){return <li>{number}</li>}}
  );
     

  return (
    <ul>{listItems}</ul>
  );
}
//Example for Parent Child Component
function ListItemMethod(props) {
  // Correct! There is no need to specify the key here:
  console.log("KEY="+props.item);
  return (<li><u>{props.children}</u><i>{props.item}</i>:<i>{props.value}</i></li>);
}

function NumberListMethod(props) {
  const names = props.nameList;
  var i=0;
  const listItems = names.map((name) =>{
    i++;
    // Correct! Key should be specified inside the array.
    return (<ListItemMethod key ={name.toString()} item={i} value={name}>
      <p style={{backgroundColor:'red',padding:'12px'}}>This child will be shown from parent!!!</p>
    </ListItemMethod>);
});
  return (
    <ol>
      {listItems}
    </ol>
  );
}

function CourseIteration(props) {

  /* Mapping the courses into a new array of JSX nodes as arrayDataItems */
  const courses=props.courseList;
  const filter = props.creditfilter;
  if(filter){ 
    const arrayDataItems = courses.map(course => 
      <li key={course.course_id}>
        <p>{course.course_name}</p>
        <span>{course.credits}</span>
      </li>
    )

    return (
      <div>
        <div>
          <h1>Render List/Array of Items with Key</h1>
        </div>

        {/* returning arrayDataItems wrapped in <ul> */}
        <ul>{arrayDataItems}</ul>
      </div>
    );
  }
  else{
    return (<div style={
      {
         color: 'brown',
         fontSize: '25px'
      }         
   }>SET FILTER</div>);
  }
}

  export default MyFunction_DT;
  export {Greeting};
  export {getCurrentTime};
  export {welcomeMessage};
  export {ListProc};
  export {NumberList};
  export {ListItemMethod};
  export {NumberListMethod};
  export {NumberListEven};
  export {CourseIteration}