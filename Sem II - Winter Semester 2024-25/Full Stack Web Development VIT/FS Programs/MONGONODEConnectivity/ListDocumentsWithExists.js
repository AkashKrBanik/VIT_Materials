const express = require('express')
const bodyParser = require('body-parser')
const path = require('path')
const mongoose = require('mongoose')
const PORT = 3000
const app = express()
const Schema = mongoose.Schema 
app.use(bodyParser.urlencoded({ extended: false }));

/*Mongoose is an ODM (Object Data Modeling) library for MongoDB.
mongoose.Schema is used to define a structure (schema) for the data stored in MongoDB.
The statement const Schema = mongoose.Schema; is simply creating a shorthand reference to mongoose.Schema,
making it easier to use in the code.
app.use(bodyParser.urlencoded- This line is used in an Express.js application to handle form submissions.
bodyParser.urlencoded() is a middleware that parses incoming form data from HTML forms and makes it available in req.body.
extended: false → Supports only simple key-value pairs (not nested objects or arrays).
extended: true → Supports nested objects and arrays in form data.*/

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
/*creates a Mongoose model based on the schema.
"Student" is the name of the collection. However:
MongoDB automatically converts it to lowercase and plural (students).
If the students collection already exists, it will use it.
Otherwise, MongoDB will create a new students collection.
*/
const Student = mongoose.model("Student", studentSchema);


app.get("/", async function(req,res){
	res.send(` 
	  <html><body>
	  <form method=post action='/ListStudents'>
	  Enter CGPA: <input type=number name='hcgpa' step="0.01"><br>
	  <input type=submit value='List Students'> </form></body></html>
	`)
})
//This defines a POST route at /ListStudents.
/*async function(req, res)- The function is asynchronous, meaning
 it uses await for database operations.
 async function DispStudents() This is an inner asynchronous function that retrieves and processes student data.
It uses Mongoose to interact with the MongoDB database.*/
app.post("/ListStudents", async function(req,res){
	async function DispStudents(){
		var out=""
		const result = await Student.exists({cgpa:req.body.hcgpa})
		// checks if any student exists with the CGPA provided in the request
		console.log(result)
		//Returns null if no matching student is found.
		//If found, it returns an object indicating existence (e.g., { _id: "someObjectId" }).
		if (result != null){
			const stu = await Student.find({cgpa:{$eq:req.body.hcgpa}},{__v:0}).sort({cgpa:1})
/*cgpa:{$eq: req.body.hcgpa-Filters students with an exact CGPA match.
{ __v: 0 } - Excludes the __v field (Mongoose version key).
.sort{ cgpa: 1 } → Sorts students in ascending order of CGPA.*/
			out="Student having "+req.body.hcgpa+" CGPA Details<br>"
			for(onestu of stu)
				out += onestu+"<br>"
		}
		else
			out = "No students available with the cgpa "+req.body.hcgpa
		
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