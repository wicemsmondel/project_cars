var express = require('express');
var router = express.Router();
var user = require('../models/userModel')
var indexController = require('../controller/indexController');


// GET pages
router.route('/')
    .get(indexController.home);

router.route('/login')
    .get(indexController.login)
    .post(indexController.login);

router.route('/register')
    .get(indexController.register)
    .post(indexController.register);

router.route('/logout')
    .get(indexController.logout);

module.exports = router;