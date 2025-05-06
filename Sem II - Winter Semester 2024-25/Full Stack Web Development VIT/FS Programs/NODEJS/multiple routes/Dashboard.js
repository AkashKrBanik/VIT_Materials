const session = require('./node_modules/express-session');
var express = require('./node_modules/express');
var bodyParser=require('./node_modules/body-parser');
const app = express();
const router = require('express').Router();

app.use(session({
  secret: 'secret-key',
  resave: false,
  saveUninitialized: false,
}));
app.use(bodyParser.urlencoded({     // to support URL-encoded bodies
    extended: true
  })); 
  
  router.get('/dashboard', (req, res) => {
    const isLoggedIn = req.session.isLoggedIn;
    const username = req.session.username;
    console.log('req.session.isLoggedIn=',isLoggedIn);
  
    if (isLoggedIn) {
      
      res.send("<html><body><h2>Welcome"+username+"</h2></body></html>");
    } else {
      res.redirect('/loginpage');
    }
  });
  module.exports = router;