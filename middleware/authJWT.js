const jwt = require('jsonwebtoken');

module.exports = (req, res, next) => {
  const jwtToken = req.cookies["jwtToken"];
  if (!jwtToken) {
    return res.status(401).json({ message: 'Invalid credentials.' });
  }
  jwt.verify(jwtToken, process.env.TOKEN_SECRET, (err, decoded) => {
    if (err) {
      return res.status(401).json({ message: 'Invalid credentials.' });
    }
    next();
  });
};