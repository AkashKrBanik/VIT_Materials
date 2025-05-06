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
const studentSchema = new Schema({
	_id: String,
	name: String,
	cgpa: Number
	});

//attch the schema with the collection for query process
const Student = mongoose.model("Student", studentSchema);


app.get("/", async function(req,res){
	res.send(` 
	  <html><body>
	  <form method=post action='/ListStudents'>
	  Enter CGPA: <input type=number name='hcgpa' step="0.01"><br>
	  <input type=submit value='List Students'> </form></body></html>
	`)
})

app.post("/ListStudents", async function(req,res){
	async function DispStudents(){
		const stu = await Student.find({cgpa:{$gt:req.body.hcgpa}},{__v:0}).sort({cgpa:1})
		var out="Student having more than "+req.body.hcgpa+" CGPA Details<br>"
		for(onestu of stu)
			out += onestu+"<br>"
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