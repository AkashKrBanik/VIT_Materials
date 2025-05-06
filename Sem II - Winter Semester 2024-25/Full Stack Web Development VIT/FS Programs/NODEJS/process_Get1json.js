var express = require('./node_modules/express');
var app = express();
app.get('/process_Get1json', function (req, res) {
    var output = {MrMrs:req.query['uname']
                  , your_email:req.query['myemail']};
console.log(output);
res.send(JSON.stringify(output));
 }
);
var server = app.listen(8000, function(){
var host = server.address().address;
var port = server.address().port;
console.log('Server at http://%s:%s',host,port);
}
);
