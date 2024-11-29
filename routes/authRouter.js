var express = require('express');
var router = express.Router();
var authController = require('../controllers/authController');

/* POST login. */
router.post('/login', authController.login);

/* POST logout. */
router.post('/logout', authController.logout);

/* POST signup. */
router.post('/signup', authController.signup);

module.exports = router;