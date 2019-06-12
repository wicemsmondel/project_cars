var express = require('express');
var router = express.Router();
var indexController = require('../../controllers/indexController');


router.route('/')
    .get(indexController.home);

router.route('/login')
    .get(indexController.login)
    .post(indexController.login);

router.route('/register')
    .get(indexController.register)
    .post(indexController.register);

// router.route('/auth/facebook')
//     .get(indexController.home);

module.exports = router;