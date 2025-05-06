import React from 'react';  
//import React, {useState, useEffect} from 'react'
import axios from 'axios'
import queryString from "query-string";
//const querystring = require('querystring');

class StudentComp extends React.Component {
    constructor(props) {  
        super(props);  
        this.state={
            regno : '',
            studentname:'',
            cgpa:0,
            message:""
        };
        this.handleRegNoChange = this.handleRegNoChange.bind(this);
        this.handleStudentnameChange = this.handleStudentnameChange.bind(this);
        this.handleCGPAChange = this.handleCGPAChange.bind(this);
        this.handleSubmit = this.handleSubmit.bind(this); 
    }  
    
    handleSubmit(e) {
        e.preventDefault();
        var self = this;
        const data = {
            cgpaData:this.state.cgpa,
        };
          
          axios.post('http://localhost:8000/receipt', queryString.stringify(data), {
            headers: {
              'Content-Type': 'application/x-www-form-urlencoded'
            }
          })
            .then(function (response) {
              console.log("RESULT"+response.data);
              var myMessage=response.data.message;              
              var myReg = response.data.message2;
              var myName=response.data.message3;
              console.log("RESULT==>{"+myMessage+":"+myReg+":"+myName+"}");
              self.setState({regno: myReg});
              self.setState({studentname: myName});
              })
            .catch(function (error) {
              console.log("ERROR"+error);
            });
        /*const cred = { this.state.username, "test123" };
        const response = await fetch("/members", {
                        method: "POST",
                        headers: {
                            "Content-Type": "application/json"
                        },
                    body: JSON.stringify(cred)
                });*/
        //alert(this.state.username);
        //alert(cred);
        console.log("Regno: " + this.state.regno);
         console.log("Studentname: " + this.state.studentname);
         console.log("CGPA: " + this.state.cgpa);
        //TableRow()
         
     }
     handleRegNoChange(e) {
        this.setState({
            regno : e.target.value
        });
     } 
     handleStudentnameChange(e) {
        this.setState({
           studentname : e.target.value
        });
     } 
     handleCGPAChange (e) {
        this.setState({
           cgpa : e.target.value
        });
     } 
    render() {  
        return (  
            <div>
            <form onSubmit={this.handleSubmit}>
                <h2 align='center'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;STUDENT DATA ENTRY</h2>               
                <label htmlFor='RegisterNumber'>Register Number</label>
                <input type="text" name="registernumber" onChange={this.handleRegNoChange} value={this.state.bookname} />
                <label htmlFor='StudentName'>Student Name</label>                
                <input type="text" name="studentname" onChange={this.handleStudentnameChange} value={this.state.authorname} />
                <label htmlFor='CGPA'>CGPA</label>   
                <input type="text" name="CGPA" onChange={this.handleCGPAChange} value={this.state.price} />
                <input type='submit' value="SEARCH"/>
                
            </form> 
            <ol>
                <li>{this.state.regno} </li>
                <li>{this.state.studentname} </li>
                <li>{this.state.cgpa} </li>
            </ol>
            
                        
            </div>
          );  
     }  
}
/*<table border="1" align='center'>
        <thead>
          <tr>
            <th>Register Number</th>
            <th>Student Name</th>
            <th>CGPA</th>
          </tr>
        </thead>
        <tbody>
            <TableRow attr1={this.state.regno} attr2={this.state.studentname} attr3={this.state.cgpa}/>
        </tbody>
        </table>
*/
class First extends React.Component {  
   render() {  
    const data1 = this.props.attr1;
    const data2 = this.props.attr2;
    const data3 = this.props.attr3;
      return (  
         <div>  
            <table border="1">
        <thead>
          <tr>
            <th>Register Number</th>
            <th>Student name</th>
            <th>CGPA</th>
          </tr>
        </thead>
        <tbody>
            <tr>
                <td>{data1}</td>
                <td>{data2}</td>
                <td>{data3}</td>
            </tr>    
        </tbody>
        </table>
         </div>  
      );  
   }  
} 
class Table extends React.Component {
  render() {
    const { data } = this.props;

    return (
      <table>
        <thead>
          <tr>
            <th>BookName</th>
            <th>Authorname</th>
            <th>Price</th>
          </tr>
        </thead>
        <tbody>
          {data.map((row, index) => (
            <tr key={index}>
              <td>{row.bname}</td>
              <td>{row.aname}</td>
              <td>{row.pprice}</td>
            </tr>
          ))}
        </tbody>
      </table>
    );
  }
}

function TableRow(props) {
    // Correct! There is no need to specify the key here:
//console.log("KEY="+props.item);
    return (<tr><td>{props.attr1}</td><td>{props.attr2}</td><td>{props.attr3}</td></tr>);
  }


export default StudentComp;
export {Table};
export {TableRow};
