const UserDao = require("../../daos/User/UserDao");

const userDao = new UserDao();

const addUser = app => {
  app.post("/addUser", async (req, res) => {
    try {
      const user = await userDao.addUser(req.body);
      console.log(user);
      return res.json(user);
    } catch (err) {
      console.error(err.message);
    }
  });
};

module.exports = addUser;
