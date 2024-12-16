var express = require('express');
var router = express.Router();
var etablissementController = require('../controllers/etablissementController');

router.get('/', etablissementController.findAll);

module.exports = router;