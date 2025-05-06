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
  .connect("mongodb://127.0.0.1:27017/Practice")
  .then((result) => {
     console.log("connected to mongodb");
   })
  .catch((error) => {
    console.log("error in DB connection "+error);
  });

//define schema as the structure of collection in MongoDB  
const studentSchema = new Schema({
	_id: String,
	name: String,
	cgpa: Number
	});
const updateSchema = new Schema({
_id:String,
 cgpa:Number})
//attch the schema with the collection for query process
const Student = mongoose.model("Student", studentSchema);
const stuUpdModel = mongoose.model("student",updateSchema);


app.get("/", async function(req,res){
	res.send(` 
	  <html><body>
	  <form method=post action='/updateStudent'>
	  <h3>Update Document</h3>
	  Enter ID: <input type=text name='hid' required><br>
	  CGPA to be Updated: <input type=number name='hcgpa' min='0' max='10' step='0.1' required>
	  <br>
	  <input type=submit value='Update Student'> </form>
	  <form method =post action ="/ListStudents">
	  <h3>List Students</h3>
	  <input type=submit value="LIST STUDENTS">
	  </form></body></html>
	`)
})
app.post("/updateStudent", async function(req,res){
	async function UpdateStudent(){
		var out=" ";
		try{
			var lid = req.body.hid;
			var lcgpa = req.body.hcgpa;
			console.log("Cgpa: "+lcgpa+" lid :"+lid);
			stuUpdModel.findById(lid).then((stu)=>{
				stu.cgpa=lcgpa;
				stu.save().then(()=>{
					out=lid+" is updated with the new CGPA: "+lcgpa;
					console.log(out);
				});
			})
		}catch(error){
			out="ERROR IN updating";
			console.log("Error in updating doc "+error)
		}
		out += `<br><form method=get action="http://localhost:${PORT}">
		<input type=submit value="CLICK HERE TO GO BACK">
		</form>`
		res.send(out);
	}
	UpdateStudent();
})


app.post("/ListStudents", async function(req,res){
	async function DispStudents(){
		const stu = await Student.find({},{__v:0}).sort({cgpa:1})
		var out="Student having more than "+req.body.hcgpa+" CGPA Details<br>"
		out += "<table border=1><tr><th>ID</th><th>Name</th><th>CGPA</th></tr>";
		for(onestu of stu)
			out += "<tr><td>"+onestu._id+"</td><td>"+onestu.name+"</td><td>"+
			onestu.cgpa+"</td></tr>"
		out += "</table>"
		out += `<br><form method=get action="http://localhost:${PORT}">
		<input type=submit value="CLICK HERE TO GO BACK">
		</form>`
		res.send(out);
	}//end of DispStudents function
	DispStudents()
})

//starting the node server
app.listen(PORT, ()=>{
	console.log(`Server is listening on ${PORT}`);
})