var express = require("express");
var mysql = require("mysql");
var app = express();
var bodyParser = require('body-parser');
/*
* Configure MySQL parameters.
*/

app.use(function(req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
  next();
});

var connection = mysql.createConnection({
host : "localhost",
user : "root",
password : "",
database : "test"
});

/*Connecting to Database*/

connection.connect(function(error){
if(error)
{
console.log("Problem with MySQL"+error);
}
else
{
console.log("Connected with Database");
}
});


app.get('/',function(req,res){
res.sendfile('index.html');
});
/*
* Here we will call Database.
* Fetch news from table.
* Return it in JSON.
*/
app.get('/load',function(req,res)
{
    connection.query("SELECT * from users",function(err,rows)
    {
        if(err)
        {
            console.log("Problem with MySQL"+err);
        }
        else
        {
            res.end(JSON.stringify(rows));
        }
    });
});

app.get('/chat',function(req,res)
{
    connection.query("SELECT * FROM (SELECT * FROM chat ORDER BY id DESC LIMIT 15) sub ORDER BY id ASC",function(err,rows)
    {
        if(err)
        {
            console.log("Problem with MySQL"+err);
        }
        else
        {
            res.end(JSON.stringify(rows));
        }
    });
});


// Get all the articles
app.get('/article',function(req,res)
{
    connection.query("SELECT * FROM (SELECT * FROM article ORDER BY id DESC LIMIT 5) sub ORDER BY id ASC",function(err,rows)
    {
        if(err)
        {
            console.log("Problem with MySQL"+err);
        }
        else
        {
            res.end(JSON.stringify(rows));
        }
    });
});

// Get all the comments
app.get('/comments',function(req,res)
{
    connection.query("SELECT * FROM comment ORDER BY id DESC",function(err,rows)
    {
        if(err)
        {
            console.log("Problem with MySQL"+err);
        }
        else
        {
            res.end(JSON.stringify(rows));
        }
    });
});

// Post
app.post('/add', bodyParser.json(), function (req, res)
{
    // contacts.push(req.body);
    console.log(req.body.firstname);
    console.log(req.body.lastname);
    
    var post  = {username: req.body.lastname, password:req.body.password, first_name: req.body.firstname, last_name: req.body.lastname, address: req.body.address};
    var query = connection.query('INSERT INTO users SET ?', post, function(err, result) 
    {
        // console.log("Problem with MySQL"+err);
    });
    console.log(query.sql);
    
    
    res.send('ok');
});

app.post('/addChat', bodyParser.json(), function (req, res)
{
    // contacts.push(req.body);
    console.log(req.body.message);
    
    var post  = {user: req.body.user, message:req.body.message, date: req.body.date};
    var query = connection.query('INSERT INTO chat SET ?', post, function(err, result) 
    {
        // console.log("Problem with MySQL"+err);
    });
    console.log(query.sql);
    
    connection.query("SELECT * FROM (SELECT * FROM chat ORDER BY id DESC LIMIT 15) sub ORDER BY id ASC",function(err,rows)
    {
        if(err)
        {
            console.log("Problem with MySQL"+err);
        }
        else
        {
            res.end(JSON.stringify(rows));
        }
    });
    
    // res.send('ok');
});

app.post('/addArticle', bodyParser.json(), function (req, res)
{
    // contacts.push(req.body);
    console.log(req.body.message);
    
    var post  = {title: req.body.title, author:req.body.user, date: req.body.date, content: req.body.content, summary: req.body.summary};
    var query = connection.query('INSERT INTO article SET ?', post, function(err, result) 
    {
        // console.log("Problem with MySQL"+err);
    });
    console.log(query.sql);
    
    res.send('ok');
});

app.post('/addComment', bodyParser.json(), function (req, res)
{
    // contacts.push(req.body);
    console.log(req.body.message);
    
    var post  = {author:req.body.user, date: req.body.date, content: req.body.content, article_id: req.body.article_id};
    var query = connection.query('INSERT INTO comment SET ?', post, function(err, result) 
    {
        // console.log("Problem with MySQL"+err);
    });
    console.log(query.sql);
    
    connection.query("SELECT * FROM comment ORDER BY id DESC",function(err,rows)
    {
        if(err)
        {
            console.log("Problem with MySQL"+err);
        }
        else
        {
            res.end(JSON.stringify(rows));
        }
    });
    
    // res.send('ok');
});


app.post('/checkuser', bodyParser.json(), function (req, res)
{
    // contacts.push(req.body);
    console.log(req.body.username);
    console.log(req.body.password);
    
    var searchUsername = {username:req.body.username};
    connection.query("SELECT * from users WHERE ?", searchUsername, function(err,rows)
    {
        if(err)
        {
            console.log("Problem with MySQL"+err);
        }
        else
        {
            console.log(JSON.stringify(rows));
            res.end(JSON.stringify(rows));
        }
    });
    
    // res.send("Sent");
});


/*Start the Server*/

app.listen(3000,function(){
console.log("It's Started on PORT 3000");
});