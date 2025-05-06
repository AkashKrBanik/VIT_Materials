var express = require('./node_modules/express');
var app = express();
app.get('/process_Get1', function (req, res) {
    var output = "MrMrs."+req.query['uname']+" , your email is: <b>"+req.query['myemail']+"</b>";
console.log(output);
res.send(output);
 }
);
var server = app.listen(8000, function(){
var host = server.address().address;
var port = server.address().port;
console.log('Server at http://%s:%s',host,port);
}
);
