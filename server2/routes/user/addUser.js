const UserDao = require("../../daos/User/UserDao");

const userDao = new UserDao();

const addUser = app => {
  app.post("/addUser", async (req, res) => {
    console.log(res.body);
    try {
      return res.json(userDao.addUser(JSON.parse(req.body)));
    } catch (err) {
      console.error(err.message);
    }
  });
};

module.exports = addUser;
