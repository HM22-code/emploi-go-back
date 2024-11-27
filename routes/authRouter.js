var express = require('express');
var router = express.Router();

/* GET login page. */
router.get('/login', function(req, res, next) {
  res.render('login');
});

/* GET logout page. */
router.get('/logout', function(req, res, next) {
  res.render('logout');
});

/* GET signup page. */
router.get('/signup', function(req, res, next) {
  res.render('signup');
});

module.exports = router;