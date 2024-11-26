/**
 * @swagger
 * /:
 *   get:
 *     summary: Returns markers
 *     responses:
 *       200:
 *         description: A successful response
 */
var express = require('express');
var router = express.Router();

/* GET markers listing. */
router.get('/', function(req, res, next) {
  res.send('respond with a resource');
});

module.exports = router;
