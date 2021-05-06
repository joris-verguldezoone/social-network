const express = require('express');
const app = express();
const http = require('http');
const server = http.createServer(app);
const { Server } = require("socket.io");
const io = new Server(server);

app.get('/', (req, res) => {
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

        //

        socket.broadcast.to(user_connected_list.toid).emit('sendMsg', { msg: data.msg, name: data.name });
    });
});
//
// io.emit('some event', { someProperty: 'some value', otherProperty: 'other value' }); // This will emit the event to all connected sockets

// io.on('connection', (socket) => {
//     socket.broadcast.emit('hi');
// });

io.on('connection', (socket) => {
    socket.on('chat message', (msg) => {
        io.emit('chat message', msg);
    }); // emit on console
});

// socket.broadcast.to('feDpMG7RgYpI8QwxAAAB').emit('send msg', { 'bjr fdp': somedata_server });

