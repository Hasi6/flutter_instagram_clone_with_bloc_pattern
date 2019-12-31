const mongoose = require("mongoose");
const Posts = mongoose.model("posts");

class PostsDao {
  // Add Posts
  addPost = async post => {
    try {
      const { user, image, location, caption } = post;
      const newPost = new Posts({
        user,
        image,
        location,
        caption
      });

      await newPost.save();
      return newPost;
    } catch (err) {
      console.error(err.message);
    }
  };

  // Get Posts
  getPosts = async (page, perPage) => {
    const posts = await Posts.find()
      .populate("user", ["username", "image", "_id"])
      .skip(Math.abs(perPage * page - perPage))
      .limit(perPage)
      .sort({ createdDate: -1 });
    return posts;
  };

  // Get Post By Id
  getPostById = async _id => {
    try {
      const post = await Posts.findById(_id);
      return post;
    } catch (err) {
      console.error(err.message);
    }
  };

  // Edit Post
  editPost = async (id, editPostPayload) => {
    try {
      const post = await Posts.findById(id);
      if (!post) {
        return { msg: "No Post Found" };
      }
      const { image, caption, location } = editPostPayload;
      post.image = image;
      post.caption = caption;
      post.location = location;
      await post.save();
      return post;
    } catch (err) {
      console.error(err.message);
    }
  };

  // Delete Post
  deletePost = async id => {
    try {
      const post = await Posts.findById(id);
      if (!post) {
        return { msg: "No Post Found" };
      }
      await Posts.findByIdAndDelete(id);
      return { msg: "Post Deleted" };
    } catch (err) {
      console.error(err.message);
    }
  };
}

module.exports = PostsDao;
