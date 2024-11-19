/**
 * @swagger
 * /:
 *   get:
 *     summary: Returns index
 *     responses:
 *       200:
 *         description: A successful response
 */
var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

module.exports = router;
