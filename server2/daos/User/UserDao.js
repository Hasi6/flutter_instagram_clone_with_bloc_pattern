const mongoose = require("mongoose");
const User = mongoose.model("users");
const md5 = require("md5");

class UserDao {
  // Add User
  addUser = async data => {
    const { email, password, username } = data;

    const image = `https://gravatar.com/avatar/${md5(body.email)}?d=identicon`;
    try {
      const newUser = new User({
        email,
        password,
        image,
        username
      });

      await newUser.save();

      return newUser;
    } catch (err) {
      console.error(err.message);
    }
  };
}

module.exports = UserDao;
