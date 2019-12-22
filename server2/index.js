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

// POST

// UPDATE

// DELETE
