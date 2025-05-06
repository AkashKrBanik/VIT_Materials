var express = require('express');
const cors = require('cors');
var app = express();
var bodyParser=require('./node_modules/body-parser');
app.use(cors());
app.use(express.json());
app.use(bodyParser.urlencoded({     // to support URL-encoded bodies
    extended: true
  })); 

  const mongoose = require('mongoose')
  const Schema = mongoose.Schema 
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
    _id: String,regno:String,
    name: String,
    cgpa: Number
    });
  
  //attch the schema with the collection for query process
  const Student = mongoose.model("Student", studentSchema);
  

app.get('/message',function(req,res){
    res.json({ message: "Hello from server!" });
});
app.post('/receipt',function(req,res){
    console.log("RECEIVED"+req.body.cgpaData)
    var resultData="";
    async function DispStudents(){
		const stu = await Student.findOne({cgpa:{$eq:req.body.cgpaData}},{__v:0});
    console.log("OUTPUT"+stu);
        res.json({ message: "EXECUTION DONE!" , message2:stu._id, message3:stu.name});
		
	}//end of DispStudents function
	DispStudents()
       
});

var server = app.listen(8000, function(){
var host = server.address().address;
var port = server.address().port;
console.log('Server at http://%s:%s',host,port);
});
