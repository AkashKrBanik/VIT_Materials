const session = require('./node_modules/express-session');
var express = require('./node_modules/express');
var bodyParser=require('./node_modules/body-parser');
const router = require('express').Router();
const app = express();
var dash = require('./Dashboard');


app.use(session({
  secret: 'secret-key',
  resave: false,
  saveUninitialized: false,
}));
app.use(bodyParser.urlencoded({     // to support URL-encoded bodies
    extended: true
  })); 

  router.post('/authenticate', (req, res) => {
    console.log("Uname="+req.body.uname);
    console.log("Email"+req.body.mypass);
    var user_name = req.body.uname;
    var password = req.body.mypass;
    if (isValidUser(user_name, password)) {
    req.session.isLoggedIn = true;
    req.session.username = user_name;
    res.redirect("/dashboard");

  } else {
    res.redirect('/loginpage');
  }
});
//app.get("/dashboard_L", (req, res) => { res.status(301).redirect("http://localhost:8000/dashboard") });
//app.use("/dashboard",router);
router.use(dash);
// can be imported and tested separately from the app
const isValidUser = function(uname,pass) { 
  if (uname=="testvit" && pass=="Welcome"){
    return true;
  }
  else
    return false;
}

module.exports = router;