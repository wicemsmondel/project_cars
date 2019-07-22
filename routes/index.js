
var express = require('express');
var router = express.Router();
var user = require('../models/userModel');
var indexController = require('../controller/indexController');
var session = require('express-session');
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

router.route('/admin')
    .get(indexController.admin);

router.route('/catalog')
    .get(indexController.catalog);

router.route('/catalog/:car_brand')
.get(indexController.catalogBrand)


    //     db.all("SELECT * FROM Article NATURAL JOIN brand WHERE brand_name=?", req.params.brand, function (error, data) {
    //         res.send(data);
    //     });
    // })

    module.exports = router;