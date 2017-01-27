//Require modules
var express = require('express');
var app = express();
var path = require('path');

//Other variables
var port = process.env.PORT || 3000
var indexHTML = '/index.html'

//app.use(express.static(__dirname));
app.use(express.static(path.join(__dirname, 'public')));

app.get('/', function(req, res) {
    res.sendFile(__dirname + indexHTML);
})

app.listen(port, function() {
    console.log("Server listening at http:%s", port)
})