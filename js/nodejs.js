const express = require('express');
const app = express();
const http = require('http');
const server = http.createServer(app);
const { Server } = require("socket.io");
const io = new Server(server);
var cookieParser = require('cookie-parser')

var mysql = require('mysql');

var con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: ""
});

con.connect(function (err) {
    if (err) throw err;
    console.log("Connected! at social-network");
});

function inscription()






app.get('/inscription', (req, res) => {
    res.sendFile(__dirname + '/index.html');
});

io.on('connection', (socket) => {
    console.log('a user connected');

    user_connected_list.push(socket.id);

    for (i = 0; i < user_connected_list.length; i++) {
        console.log(user_connected_list[i] + "coucou user_id")
    }

});

server.listen(3000, () => {
    console.log('listening on *:3000');
});

user_connected_list = [];

io.on('connection', (socket) => {
    socket.on('chat message', (msg) => {

        console.log('message: ' + msg);
        socket.broadcast.to(user_connected_list.toid).emit('sendMsg', { msg: data.msg, name: data.name });
    });
});


io.on('connection', (socket) => {
    socket.on('chat message', (msg) => {
        io.emit('chat message', msg);
    }); // emit on console
});



/*
instancier des tokens dans les cookies
instancier des signatures dans les cookies
recuperer le dom des cookies,
faire les verification avec les decode des différents champs des cookies

creer des doonées de navigation avec les data des user + des sockets


*/