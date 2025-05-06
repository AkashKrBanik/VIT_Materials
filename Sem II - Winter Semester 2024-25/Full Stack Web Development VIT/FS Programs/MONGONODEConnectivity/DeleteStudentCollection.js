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
const deleteSchema = new Schema({
_id:String})
//attch the schema with the collection for query process
const Student = mongoose.model("Student", studentSchema);
const studelModel = mongoose.model("student",deleteSchema);


app.get("/", async function(req,res){
	res.send(` 
	  <html><body>
	  <form method=post action='/deleteStudent'>
	  <h3>Delete Document</h3>
	  Enter ID: <input type=text name='hid'><br>
	  <input type=submit value='Delete Student'> </form>
	  <form method =post action ="/ListStudents">
	  <input type=submit value="LIST STUDENTS">
	  </form></body></html>
	`)
})
//delete student based on _id
app.post("/deleteStudent", async function(req,res){
	async function DeleteStudent(){
		var out=" ";
		try{
			var lid = req.body.hid;
		await studelModel.deleteOne({_id:lid}).then(result=>{
				out = "Document Deleted";
				console.log("Document deleted");
			})
		}catch(error){
			out="ERROR IN Deleting";
			console.log("Error in delete doc "+error)
		}
		out += `<br><form method=get action="http://localhost:${PORT}">
		<input type=submit value="CLICK HERE TO GO BACK">
		</form>`
		res.send(out);
	}
	DeleteStudent();
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