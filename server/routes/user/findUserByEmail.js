const UserDao = require("../../daos/User/UserDao");

const userDao = new UserDao();

const findUser = app => {
  app.get("/user/:email", async (req, res) => {
    console.log(req.params.email);
    try {
      const user = await userDao.findUserByEmail(req.params.email);
      console.log(user);
      return res.json(user);
    } catch (err) {
      console.error(err.message);
    }
  });
};

module.exports = findUser;
