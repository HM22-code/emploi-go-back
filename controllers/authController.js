const User = require('../models/user');
const bcrypt = require('bcrypt')
const jwt = require('jsonwebtoken');

exports.login = (req, res) => {
  // check if user exist
  User.findOne({ where: { username: req.body.username } })
    .then(user => {
      if (!user) {
        return res.status(401).json({ message: 'Incorrect username or password'});
      }
      // compare passwords
      bcrypt.compare(req.body.password, user.password)
        .then(valid => {
          if (!valid) {
            return res.status(401).json({ message: 'Incorrect username or password' });
          }
          // generate JWT token
          const jwtToken = jwt.sign({ id: user.id, role: user.role },process.env.TOKEN_SECRET,{ expiresIn: '24h' })
          res.cookie("jwtToken", jwtToken, { httpOnly: true, secure: true });
          res.json({ token: jwtToken });
        })
        .catch(error => res.status(500).json({ message: 'Failed to login.' }));
    })
    .catch(error => res.status(500).json({ message: 'Failed to login.' }));
};

exports.logout = (req, res) => {
  res.clearCookie('jwtToken')
  res.redirect('/');
};

exports.signup = (req, res) => {
  try {
    req.body.password = bcrypt.hash(req.body.password, 10);
    const user = User.create({ username: req.body.username, email: req.body.email, password: req.body.password });
    res.json(user);
  } catch (error) {
    res.status(500).json({ message: 'Failed to create user.' });
  }
};