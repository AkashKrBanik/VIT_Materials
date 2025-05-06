var express = require('./node_modules/express');
var cookie_parse = require('./node_modules/cookie-parser');
var app = express();
app.use(cookie_parse());
app.get('/setCookies',function(req,res){
        let table = {
        color: "brown",
        material: "wood",
        size: "small",
        price: 100,
     };
     let course = {
        code: "MCA152",
        pgm: "mca",
        year: "2024-25",
        classsize: 200,
     };
    res.cookie('UserClient', 'netscape', { maxAge: 900000, httpOnly: true });
//The res.cookie() function is used to set the cookie name to value. The value parameter may be a string or object converted to JSON.
//The options parameter contains various properties like encode, expires, domain, etc
//Using the HttpOnly flag when generating a cookie helps mitigate the risk of client side script accessing the protected cookie   
   res.cookie("table", table, { maxAge: 900000, httpOnly: true });
    res.cookie("course", course, { maxAge: 900000, httpOnly: true });
    return res.send('cookie has been set!');
});
app.get('/getAllCookies',function(req,res){
    //console.log(req.cookies);
    res.send(req.cookies);  //The res.send() function sends the HTTP response.
	                        //The body parameter can be a String or a Buffer object or an object or an Array.    
});
app.get("/getCookies/:name", (req, res) => {
    res.send(req.cookies[req.params.name]);//The req. params property is an object containing properties mapped to the named route “parameters”.
	//For example, if you have the route /student/:id, then the “id” property is available as req.params.id.
 });
 app.get("/deleteCookies/:name", (req, res) => {
    res.clearCookie(req.params.name);
    res.send("Cookies with name " + req.params.name + " is deleted");
 });
var server = app.listen(8000, function(){
var host = server.address().address;
var port = server.address().port;
console.log('Server at http://%s:%s',host,port);

});