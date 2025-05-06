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