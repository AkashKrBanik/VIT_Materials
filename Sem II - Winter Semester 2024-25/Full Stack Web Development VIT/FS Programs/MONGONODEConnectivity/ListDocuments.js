const express = require('express')
const bodyParser = require('body-parser')
const path = require('path')
const mongooseObj = require('mongoose')
const PORT = 3000
const app = express()
const Schema = mongooseObj.Schema 
app.use(bodyParser.urlencoded({ extended: false }));

mongooseObj
  .connect("mongodb://127.0.0.1:27017/mydb")
  .then((result) => {
     console.log("connected to mongodb")  })
  .catch((error) => {
    console.log("error in DB connection "+error) })
  
const studentSchema = new Schema({
  _id: String,
  name: String,
  cgpa: Number
})

const StudentModel = mongooseObj.model("student", studentSchema);


app.get("/", function(req,res){
	async function getStudents(){
		const stuDocs = await StudentModel.find({},{__v:0})
		res.send(stuDocs);
	}
	getStudents();
})

app.listen(PORT, ()=>{
	console.log(`Server is listening on ${PORT}`);
})