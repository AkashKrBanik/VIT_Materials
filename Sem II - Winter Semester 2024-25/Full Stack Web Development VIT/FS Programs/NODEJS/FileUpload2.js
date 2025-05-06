//Include Main HTTP module
var http = require('http');
// Include Formidable libarary for Upload Processing
var formidable = require('formidable');
// Include file system module
var fs = require('fs');
// Create server for listening incoming connections
  http.createServer(function (req, res) {
  //File upload check with requested url
  //node js part to upload the selected file
  if (req.url == '/FileUpload2') {
		res.writeHead(200,{'Content-Type':'text/html'});
	  res.write("reached the req function<br>");
	  // Create form object with formidable
    var form = new formidable.IncomingForm();//A formidable module is used for parsing form data, especially file uploads. 
	                            //It is easy to use and integrate into your project for handling incoming form data and file uploads.
// Parse the form   
   form.parse(req, function (err, fields, files) {
      // Get old file path
	  var oldpath = files.filetoupload[0].filepath;
	  // Set new file path
      var newpath = 'C:/Users/Admin/Desktop/' + files.filetoupload[0].originalFilename;
	  // var newpath ="./"+files.filetoupload[0].originalFilename; // uploads in the same path
		// Move file from old path to new path
		fs.copyFile(oldpath,newpath,function(err){
// If any error then, throw it        
		if (err) throw err;
		// Successfull confirmation
        res.write('File uploaded and moved! to '+newpath);
        res.end();       });
 });
  } else { // HTML part to choose a file for uploading-// Set header to text/html
    res.writeHead(200, {'Content-Type': 'text/html'});
    // Write response with file upload form
	res.write('<form action="FileUpload2" method="post" enctype="multipart/form-data">');
    res.write('<input type="file" name="filetoupload"><br>');
    res.write('<input type="submit">');
    res.write('</form>');
    return res.end();
  }
}).listen(3000);



