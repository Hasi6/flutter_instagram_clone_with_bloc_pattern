const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const userSchema = new Schema({
  email: { type: String, required: true, unique: true },
  username: { type: String, required: true },
  image: { type: String, required: true },
  signInMethod: { type: String, required: true },
  status: { type: String },
  description: { type: String }
});

module.exports = mongoose.model("users", userSchema);
