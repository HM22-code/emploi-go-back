/**
 * @swagger
 * /:
 *   get:
 *     summary: Returns users
 *     responses:
 *       200:
 *         description: A successful response
 */
var express = require('express');
var router = express.Router();

/* GET users listing. */
router.get('/', function(req, res, next) {
  res.send('respond with a resource');
});

module.exports = router;
