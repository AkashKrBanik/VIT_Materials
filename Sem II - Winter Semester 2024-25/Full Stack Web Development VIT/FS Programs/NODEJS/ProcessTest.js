var express = require('./node_modules/express');
var app = express();
var bodyParser=require('./node_modules/body-parser');
app.use(bodyParser.urlencoded({     // to support URL-encoded bodies
    extended: true
  })); 
//var urlencodedParser=bodyParser.urlencoded({extended:false})

app.post('/processTest', function (req, res) {
    var output = {Mr:req.body.uname, your_email:req.body.myemail};
console.log(output);
res.send(JSON.stringify(output));
 });
var server = app.listen(8000, function(){
var host = server.address().address;
var port = server.address().port;
console.log('Server at http://%s:%s',host,port);
}
);
