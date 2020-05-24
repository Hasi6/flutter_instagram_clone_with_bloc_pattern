const postDao = require("../../daos/Posts/PostsDao");

const getPost = app => {
  app.get("/api/getPost/:id", async (req, res) => {
    const id = req.params.id;

    try {
      const response = await postDao.getPostById(id);
      return res.json(response);
    } catch (err) {
      console.error(err.message);
    }
  });
};

module.exports = getPost;
