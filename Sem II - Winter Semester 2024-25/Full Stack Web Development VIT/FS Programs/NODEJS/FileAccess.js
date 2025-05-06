var http=require('http');
var url = require('url');
var fs= require('fs');


http.createServer(function (req, res) {
    var requestURL = url.parse(req.url,true);
    var resource =  "."+requestURL.pathname;
    console.log("Resource "+resource);
    fs.readFile(resource,function(err,data){
        if(err){
            res.writeHead(404, {'Content-Type': 'text/html'});
            return res.end("File Not Found");
        }
        res.writeHead(200, {'Content-Type': 'text/html'});
        res.write(data);
        return res.end();
    });
}).listen(3000);
console.log('Server running at http://127.0.0.1:3000/');
fs.open('SampleTextFile.txt','w',function(err,file){
    if(err){
        console.log('File Open Error');
    }
    console.log('File Opened');
});
fs.writeFile('SampleTextFile.txt','NODE JS FEATURES',function(err){
    if(err){
        console.log('File Write Error');
    }
    console.log('File Write Success');
});
fs.appendFile('SampleTextFile.txt',' and advantages',function(err){
    if(err){
        console.log('File Appending Error');
    }
    console.log('File Appending Success');
});
fs.unlink('sampleTextFile.txt',function(err){
    if(err){
        console.log('File Deletion Error');
    }
    console.log('File Deleted');
});