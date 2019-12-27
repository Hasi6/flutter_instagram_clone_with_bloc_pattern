const mongoose = require("mongoose");
const User = mongoose.model("users");
const md5 = require("md5");

class UserDao {
  // Add User
  addUser = async data => {
    const { email, signInMethod, username } = data;

    const image = `https://gravatar.com/avatar/${md5(email)}?d=identicon`;
    try {
      const newUser = new User({
        email,
        signInMethod,
        image,
        username
      });

      await newUser.save();
      console.log(newUser);
      return newUser;
    } catch (err) {
      console.error(err.message);
    }
  };

  // Find User By Email
  findUserByEmail = async email => {
    try {
      const user = User.findOne({ email });
      return user;
    } catch (err) {
      console.error(err.message);
    }
  };
}

module.exports = UserDao;
