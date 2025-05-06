const session = require('./node_modules/express-session');
//const session=require("E:\\Winter2023-24\\PROGRMS\\NodeJS\\node_modules\\");
var express = require('./node_modules/express');
var bodyParser=require('./node_modules/body-parser');
const app = express();
var auth = require('./Authenticate');

app.use(session({
  secret: 'secret-key',
  resave: false,
  saveUninitialized: false,
}));
app.use(bodyParser.urlencoded({     // to support URL-encoded bodies
    extended: true
  })); 

/*app.use('/authenticate', auth);
  app.post('/authenticate', (req, res)=> {
    router.render(auth);
  });
*/

app.get('/loginpage', function (req, res) {
    res.write('<html>');
    //res.write('<body> <form method="post" action="http://localhost:8000/authenticate">');//Example to extract Request Params and Assign to JSON
    res.write('<body> <form method="post" action="/authenticate">');//Example to extract Request Params and Assign to JSON
    res.write('UserName:<input type="text" name="uname" id="uname"><br><br>');
    res.write('Password:<input type="password" name="mypass" id="mypass"><br>');
    res.write('<input type="submit" value="click here" >');
    res.write('</form><br>');
    res.write('<a href="http://localhost:8000/logout"><img src="logout.PNG" alt="logout" style="width:42px;height:42px;"></a>');
    res.write('</body></html>')
    res.send();//Do not use multiple send
});


app.use(auth);


  var server = app.listen(8000, function(){
    var host = server.address().address;
    var port = server.address().port;
    console.log('Server at http://%s:%s',host,port);
    
    });
