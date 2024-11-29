var express = require('express');
var router = express.Router();

/**
 * @swagger
 * /:
 *   get:
 *     summary: Returns index
 *     responses:
 *       200:
 *         description: A successful response
 */
router.get('/', (req, res, next) => {
  res.render('index');
});

module.exports = router;
