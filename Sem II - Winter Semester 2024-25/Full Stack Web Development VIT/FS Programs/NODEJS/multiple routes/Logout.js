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
  app.get('/logout', (req, res) => {
    req.session.destroy((err) => {
      if (err) {
        console.log(err);
      } else {
        res.redirect('/loginpage');
      }
    });
  });