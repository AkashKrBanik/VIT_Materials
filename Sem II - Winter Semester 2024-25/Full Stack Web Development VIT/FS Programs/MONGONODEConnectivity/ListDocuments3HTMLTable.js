const express = require('express')
const bodyParser = require('body-parser')
const path = require('path')
const mongoose = require('mongoose')
const PORT = 3000
const app = express()
const Schema = mongoose.Schema 
app.use(bodyParser.urlencoded({ extended: false }));

mongoose
  .connect("mongodb://127.0.0.1:27017/mydb")
  .then((result) => {
     console.log("connected to mongodb");
	 // console.log(Student.find());
    })
  .catch((error) => {
    console.log("error in DB connection "+error);
  });
  
const studentSchema = new Schema({
  _id: String,
  name: String,
  cgpa: Number
});
const Student = mongoose.model("Student", studentSchema);


app.get("/", async function(req,res){
	async function getStudents(){
		const stu = await Student.find({},{__v:0}).sort({name:1});
		
		var out="Student Details <br>"
		out += "<table border=1><tr><th>ID</th><th>Name</th><th>CGPA</th></tr>";
		for(onestu of stu)
			out += "<tr><td> "+onestu._id+"</td>"+
				" <td>"+onestu.name+"</td>"+
				" <td>"+onestu.cgpa+" </td></tr> ";
		out += "</table>";
		res.send(out);
		
	}
	getStudents();
})
app.listen(PORT, ()=>{
	console.log(`Server is listening on ${PORT}`);
})