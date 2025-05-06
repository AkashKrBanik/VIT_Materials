import React from 'react'
import ReactDOM from 'react-dom/client'
import App from './App'
import { MyFunction } from './App'
import './index.css'
import MyFunction_DT, { getCurrentTime, Greeting,ListProc,NumberListMethod,welcomeMessage,CourseIteration } from './MyFunction';
import MyComponentApp from './component/MyComponentApp';
import ExpenseItem from './component/ExpenseItem';
import MultiGrocery from './component/MultiGrocery'
import FunctionalCounter from './component/Counter';
import CounterClass from './component/CounterClass';
import ControlledFormComp from './component/ControlledForm'
import UnControlledFormComp from './component/UncontrolledForm'
import StudentComp from './component/StudentCGPA'
const connect = ReactDOM.createRoot(document.getElementById('MyConnectivity'));
import Connectivity from './NodeConnectivity'
connect.render(
  <React.StrictMode>
     <StudentComp />
  </React.StrictMode>
);

ReactDOM.createRoot(document.getElementById('root')).render(
  <React.StrictMode>
    <App />
  </React.StrictMode>,
);
const myElement = <h1>JSX, or JavaScript Syntax eXtension, is a syntax extension for JavaScript that lets you write HTML-like code in JavaScript</h1>;
const rootelt = ReactDOM.createRoot(document.getElementById('eltroot'));
rootelt.render(myElement);

const rootelttwo = ReactDOM.createRoot(document.getElementById('root2'));
const myelttwo=React.createElement("h3",null,"React JS App");
rootelttwo.render(myelttwo);

const rct = ReactDOM.createRoot(document.getElementById('react-app'));
rct.render(
  <React.StrictMode>
    <MyFunction />
  </React.StrictMode>
);

const rct_my = ReactDOM.createRoot(document.getElementById('react-app_my'));
rct_my.render(
  <React.StrictMode>
    <MyFunction_DT />
  </React.StrictMode>
);
const greet = ReactDOM.createRoot( document.getElementById('greet'));
const element = Greeting();
greet.render(element);

//Applying Inline Styling
//React finds the HTML element with id="curTime".
//It creates a root and mounts the React component inside that element.
//It renders:A <div> with brown text and font size 24px.
//A <p> tag displaying "The current time is ".
//A <span> element where:The current time (from getCurrentTime()) is inserted dynamically.
//The time text is magenta.
   const curTime = ReactDOM.createRoot( document.getElementById('curTime'));
curTime.render(
  <div style={
    {
       color: 'brown',
       fontSize: '24px'
    }         
 }>
     <p>The current time is <span style={{color:'magenta'}}>{getCurrentTime()}</span></p>
  </div>
);

const prp = ReactDOM.createRoot( document.getElementById('useProps'));
//const prpelt = welcomeMessage('VIT');
//prp.render(prpelt);
prp.render(welcomeMessage('VIT'));

const prpList = ReactDOM.createRoot( document.getElementById('myList'));
const listElement = ListProc();
prpList.render(listElement);

//Example for Parent-Child Component below
const names = ['bob', 'sam', 'mith', 'hyn', 'lima'];//include one more element 'bob' and see the warning
const keyProp = ReactDOM.createRoot(document.getElementById('keyDriver'));
keyProp.render(
  <React.StrictMode>
    <NumberListMethod nameList={names}/>
  </React.StrictMode>
);
//Class Component
const clsComponentApp1 = ReactDOM.createRoot(document.getElementById('clsComponent'));
clsComponentApp1.render(
  <React.StrictMode>
    <MyComponentApp />
  </React.StrictMode>
);

const expComponentApp1 = ReactDOM.createRoot(document.getElementById('expComponent'));
expComponentApp1.render(
  <React.StrictMode>
    <ExpenseItem />
  </React.StrictMode>
);

const itName = "HARD DISK"
const itPrice = 303.00
const itDate = new Date("2022-10-10")
const itGST = "YES"
const multiGroc = ReactDOM.createRoot(document.getElementById('multiGroceryCom'));
multiGroc.render(
  <React.StrictMode>
    <MultiGrocery itemName={itName} itemPrice= {itPrice} itemDate={itDate} itemGST={itGST} />
  </React.StrictMode>
);

//Key Value Array Iteration
const courses = [
  {
    course_id: 'MCA101',
    course_name: 'JAVA PROGRAMMING',
    credits: 3
  },
  {
    course_id: 'MCA102',
    course_name: 'Python PROGRAMMING',
    credits: 2
  },
  {
    course_id: 'MCA103',
    course_name: 'Information Security and Audit',
    credits: 4
  },
  {
    course_id: 'MCA104',
    course_name: 'Software Engineering',
    credits: 3
  }
];
const courseArray = ReactDOM.createRoot(document.getElementById('courseDriver'));
courseArray.render(
  <React.StrictMode>
    <CourseIteration courseList={courses} creditfilter={false}/>
  </React.StrictMode>
);

const counter_f = ReactDOM.createRoot(document.getElementById('counter'));
  counter_f.render(
  <React.StrictMode>
    <FunctionalCounter />
  </React.StrictMode>
);

const counter_class = ReactDOM.createRoot(document.getElementById('counter_class'));
counter_class.render(
  <React.StrictMode>
    <CounterClass />
  </React.StrictMode>
);

const ctrform = ReactDOM.createRoot(document.getElementById('CtrlFormComponent'));
ctrform.render(
  <React.StrictMode>
     <ControlledFormComp />
  </React.StrictMode>
);

const myform = ReactDOM.createRoot(document.getElementById('UnctrlFormComponent'));
myform.render(
  <React.StrictMode>
     <UnControlledFormComp />
  </React.StrictMode>
);

const connect1 = ReactDOM.createRoot(document.getElementById('TestConnectivity'));
connect1.render(
  <React.StrictMode>
     <Connectivity />
  </React.StrictMode>
);
