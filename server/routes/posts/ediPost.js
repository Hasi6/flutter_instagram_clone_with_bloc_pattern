const postDao = require("../../daos/Posts/PostsDao");

const editPost = app => {
  app.get("/api/editPost/:id", async (req, res) => {
    const id = req.params.id;

    try {
      const response = await postDao.editPost(id, req.body);
      return res.json(response);
    } catch (err) {
      console.error(err.message);
    }
  });
};

module.exports = editPost;
