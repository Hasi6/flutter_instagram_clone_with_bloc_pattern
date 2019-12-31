const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const PostsSchema = new Schema(
  {
    user: { type: Schema.Types.ObjectId, ref: "users", required: true },
    image: { type: String, required: true },
    caption: { type: String, required: true },
    location: { type: String, required: true }
  },
  { timestamps: true }
);

module.exports = mongoose.model("posts", PostsSchema);
