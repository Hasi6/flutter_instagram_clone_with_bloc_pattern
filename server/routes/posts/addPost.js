const PostsDao = require("../../daos/Posts/PostsDao");

const postsDao = new PostsDao();

const addPosts = app => {
  app.post("/api/addPost", async (req, res) => {
    try {
      const response = await postsDao.addPost(req.body);
      console.log(response);
      return res.json(response);
    } catch (err) {
      console.error(err.message);
    }
  });
};

module.exports = addPosts;
