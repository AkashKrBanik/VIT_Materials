// Requiring express to handle routing
const express = require("express");

// The fileUpload npm package for handling
// file upload functionality
const fileUpload = require("express-fileupload");

// Creating app
const app = express();

// Passing fileUpload as a middleware
app.use(fileUpload());

// For handling the upload request
app.post("/upload", function (req, res) {

  // When a file has been uploaded
  console.log(req.files);
  if (req.files && Object.keys(req.files).length !== 0) {
  
    // Uploaded path
    const uploadedFile = req.files.uploadFile;

    // Logging uploading file
    //console.log(uploadedFile);

    // Upload path
    const uploadPath = __dirname+"\\"
        + uploadedFile.name;
	console.log(uploadPath+ " uploaded here");
    // To save the file using mv() function
    req.files.uploadFile.mv(uploadPath, function (err) {
      if (err) {
        console.log(err);
        res.send("Failed !!");
      } else res.send("Successfully Uploaded !!");
    });
  } else res.send("No file uploaded !!");
});


// GET request to the root of the app
app.get("/", function (req, res) {
  res.write(`
 	<html>
        <form action="/upload" method="post"
              enctype="multipart/form-data">
            File to be uploaded: <input type="file" 
                                        name="uploadFile" 
                                        id=""> 
            <br><br>
            <button type="submit">Upload</button>
        </form>
		</html>
 
  `)
});

// Makes app listen to port 3000
app.listen(3000, function (req, res) {
  console.log("Started listening to port 3000");
});
