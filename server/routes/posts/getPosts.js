const PostDao = require("../../daos/Posts/PostsDao");

const postDao = new PostDao();

const getPosts = app => {
  app.get("/api/getPosts/:page", async (req, res) => {
    const page = req.params.page;

    try {
      const response = await postDao.getPosts(page, 5);
      return res.json(response);
    } catch (err) {
      console.error(err.message);
    }
  });
};

module.exports = getPosts;
