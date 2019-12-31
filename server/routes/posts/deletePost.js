const postDao = require("../../daos/Posts/PostsDao");

const deletePost = app => {
  app.get("/api/deletePost/:id", async (req, res) => {
    const id = req.params.id;

    try {
      const response = await postDao.deletePost(id);
      return res.json(response);
    } catch (err) {
      console.error(err.message);
    }
  });
};

module.exports = deletePost;
