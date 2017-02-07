//Require modules
var d3 = require('d3');
var express = require('express');
var app = express();
var path = require('path');

app.use(express.static(path.join(__dirname, 'public')));

app.get('/', function(req, res) {
    res.sendFile(__dirname + '/index.html');
})

var server = app.listen(process.env.PORT || 5000, function() {
    var host = server.address().address
    var port = server.address().port

    console.log("Server listening at http://%s:%s", host, port)
})