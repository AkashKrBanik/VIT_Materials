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
		const stu = await Student.find({},{__v:0});
		//res.send(stu)
		var out="Student Details <br>"
		for(onestu in stu)
			out += "id: "+stu[onestu]._id+
				" Name: "+stu[onestu].name+
				" CGPA: "+stu[onestu].cgpa+" <br> ";
		res.send(out);
		
	}
	getStudents();
})
app.listen(PORT, ()=>{
	console.log(`Server is listening on ${PORT}`);
})