const session = require('./node_modules/express-session');
var express = require('./node_modules/express');
var bodyParser=require('./node_modules/body-parser');
const app = express();

app.use(session({
  secret: 'secret-key',
  resave: false,
  saveUninitialized: false,
}));
app.use(bodyParser.urlencoded({     // to support URL-encoded bodies
    extended: true
  })); 


app.get('/loginpage', function (req, res) {
    res.write('<html>');
    res.write('<body> <form method="post" action="http://localhost:8000/authenticate">');//Example to extract Request Params and Assign to JSON
    res.write('UserName:<input type="text" name="uname" id="uname"><br><br>');
    res.write('Password:<input type="password" name="mypass" id="mypass"><br>');
    res.write('<input type="submit" value="click here" >');
    res.write('</form><br>');
    res.write('<a href="http://localhost:8000/logout"><img src="logout.png" alt="logout" style="width:42px;height:42px;"></a>');
    res.write('</body></html>')
    res.send();//Do not use multiple send
});


app.post('/authenticate', (req, res) => {
    console.log("Uname="+req.body.uname);
    console.log("Email"+req.body.mypass);
    var user_name = req.body.uname;
    var password = req.body.mypass;
    if (isValidUser(user_name, password)) {
    req.session.isLoggedIn = true;
    req.session.username = user_name;
    res.redirect('/dashboard');
  } else {
    res.redirect('/loginpage');
  }
});
app.get('/dashboard', (req, res) => {
    const isLoggedIn = req.session.isLoggedIn;
    const username = req.session.username;
    console.log('req.session.isLoggedIn=',isLoggedIn);
  
    if (isLoggedIn) {
            res.send("<html><body><h2>Welcome"+username+"</h2></body></html>");
    } else {
      res.redirect('/loginpage');
    }
  });
  app.get('/logout', (req, res) => {
    req.session.destroy((err) => {
      if (err) {
        console.log(err);
      } else {
        res.redirect('/loginpage');
      }
    });
  });
  var server = app.listen(8000, function(){
    var host = server.address().address;
    var port = server.address().port;
    console.log('Server at http://%s:%s',host,port);
    
    });
// can be imported and tested separately from the app
const isValidUser = function(uname,pass) { 
  if (uname=="testvit" && pass=="Welcome"){
    return true;
  }
  else
    return false;
}
