const postsDao = require("../../daos/Posts/PostsDao");

const addPosts = app => {
  app.post("/api/addPost", async (req, res) => {
    try {
      const response = await postsDao.addPosts(req.body);
      return res.json(response);
    } catch (err) {
      console.error(err.message);
    }
  });
};

module.exports = addPosts;
