
const httpServer = require("http").createServer();
const { Server } = require("socket.io");
const io = require("socket.io")(httpServer, {
    cors: {
        origin: "*",
        methods: ["GET", "POST"]
    }
});
// var cookieParser = require('cookie-parser')

console.log(__dirname);

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

// app.get('/', (req, res) => {
//     res.sendFile(__dirname + '/index.html');
// });
user_connected_list = [];

io.on('connection', (socket) => {
    console.log('a user connected');
    user_connected_list.push(socket.id);

    for (i = 0; i < user_connected_list.length; i++) {
        console.log(user_connected_list[i] + " user_" + i)
        io.emit('connect_user', user_connected_list[i] + " user_" + i);
    }
    // console.log(sessions[client.session])
});


httpServer.listen(3800, () => {
    console.log('listening on *:3800');
});

io.on('connection', (socket) => {
    socket.on('chat message', (msg) => {
        console.log('message: ' + msg);
    });
});

io.on('connection', (socket) => {
    socket.on('chat message', (msg) => {
        io.emit('chat message', msg);
    }); // emit on console
});
// io.on('connection', (socket) => {
//     socket.broadcast.emit('hi');
//     socket.user_connected_list[0].emit()

// });




/*
instancier des tokens dans les cookies
instancier des signatures dans les cookies
recuperer le dom des cookies,
faire les verification avec les decode des différents champs des cookies

creer des doonées de navigation avec les data des user + des sockets


*/