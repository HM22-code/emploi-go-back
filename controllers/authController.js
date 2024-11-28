const User = require('../models/user');
const bcrypt = require('bcrypt')
const jwt = require('jsonwebtoken');

exports.login = (req, res, next) => {
  User.findOne({ username: req.body.username })
    .then(user => {
      if (!user) {
        return res.status(401).json({ message: 'Incorrect username or password'});
      }
      bcrypt.compare(req.body.password, user.password)
        .then(valid => {
          if (!valid) {
            return res.status(401).json({ message: 'Incorrect username or password' });
          }
          res.status(200).json({
            userId: user.id,
            token: jwt.sign(
              { userId: user.id },
              process.env.TOKEN_SECRET,
              { expiresIn: '24h' }
          )
          });
        })
        .catch(error => res.status(500).json({ message: 'Failed to login.' }));
    })
    .catch(error => res.status(500).json({ message: 'Failed to login.' }));
};

