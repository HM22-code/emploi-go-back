var express = require('express');
var router = express.Router();
var authController = require('../controllers/authController');

/* GET login page. */
router.get('/login', function(req, res, next) {
  res.render('login');
});

/* POST login form. */
router.post('/login', authController.login);

/* GET logout page. */
router.get('/logout', function(req, res, next) {
  res.render('logout');
});

/* GET signup page. */
router.get('/signup', function(req, res, next) {
  res.render('signup');
});

/* POST signup form. */
router.post('/signup', function(req, res, next) {
  res.json({ message: 'Signup' });
});

module.exports = router;