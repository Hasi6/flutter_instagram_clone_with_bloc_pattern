const express = require("express");
const socketio = require("socket.io");
const http = require("http");
const connectDB = require("./config/db");

const app = express();

// INIT MIDDLEWARE
app.use(
  express.json({
    extended: true
  })
);

// MODELS
require("./models/User");
require("./models/Posts");

// Database Connection
connectDB();

// SERVER CREATE
const PORT = process.env.PORT || 5000;

const server = http.createServer(app);
const io = socketio(server);
server.listen(PORT, () => console.log(`App Started at port ${PORT}`));

// SOCKET IO LOGIC

// REQUESTS

// GET
require("./routes/user/findUserByEmail")(app);
require("./routes/posts/getPosts")(app);

// POST
require("./routes/user/addUser")(app);
require("./routes/posts/addPost")(app);

// UPDATE

// DELETE
