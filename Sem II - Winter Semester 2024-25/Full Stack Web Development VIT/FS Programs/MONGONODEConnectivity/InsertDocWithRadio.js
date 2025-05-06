const express = require('express')
const bodyParser = require('body-parser')
const path = require('path')
const mongoose = require('mongoose')
const PORT = 3000
const app = express()
const Schema = mongoose.Schema 
app.use(bodyParser.urlencoded({ extended: false }));

//Establish the connection with MongoDB
mongoose
  .connect("mongodb://127.0.0.1:27017/mydb")
  .then((result) => {
     console.log("connected to mongodb");
   })
  .catch((error) => {
    console.log("error in DB connection "+error);
  });

//define schema as the structure of collection in MongoDB  
const employeeSchema = new Schema({
	eno: Number,
	ename: String,
	egender: String,
	esalary: Number,
	edept: String,
	einterests:Array
	});

//attch the schema with the collection for query process
const EmployeeModel = mongoose.model("employee", employeeSchema);


app.get("/", async function(req,res){
	res.send(` 
		<html><body>
	  <form method=post action='/saveEmployee'>
	  Employee Number: <input type=number name='hno'><br><br>
	  Employee Name: <input type=text name='hname'><br><br>
	  Employee Gender: <input type=radio name='hgender' value='Male'>Male &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  <input type=radio name='hgender' value='Female'> Female<br><br>
	  Employee Salary: <input type=number name='hsalary' step=0.1><br><br>
	  Employee Department: <select name='hdept'>
	  <option value='IT' checked>IT</option>
	  <option value='Marketing'>Marketing</option>
	  <option value='HR'>Human Resource</option>
	  <option value='Plant'>Plant</option> </select>
	  <br><br>
	  Area of Interest: <input type=Checkbox name='haoi' value='sports'>Sports &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type=Checkbox name='haoi' value='music'>Music &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type=Checkbox name='haoi' value='travel'>Travel &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  <br><br><input type=submit value='SAVE'>
	  </form><body></html>
	`)
})

app.post("/saveEmployee", async function(req,res){
	async function insertEmployee(){
		try{
			const lno = req.body.hno
			const lname = req.body.hname
			const lgender = req.body.hgender
			const lsalary = req.body.hsalary
			const ldept = req.body.hdept
			var linterests= req.body.haoi
			var out=""
			const employeeDocument = new EmployeeModel({
				eno:lno,ename:lname,egender:lgender,esalary:lsalary,edept:ldept,einterests:linterests})
			console.log(employeeDocument);
			const res = employeeDocument.save()
			if (res)
				out ="Document Saved"
		}catch(error){
			out="Error in saving document, Contact Admin"
			console.log("Error in saving"+error)
		}
		out += `<br><form method=get action="http://localhost:${PORT}">
		<input type=submit value="CLICK HERE TO GO BACK">
		</form>`
		res.send(out);
	}//end of DispStudents function
	insertEmployee()
})

//starting the node server
app.listen(PORT, ()=>{
	console.log(`Server is listening on ${PORT}`);
})