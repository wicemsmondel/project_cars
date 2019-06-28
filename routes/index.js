var express = require('express');
var router = express.Router();
var user = require('../models/userModel')
    // var indexController = require('../controller/indexController');


/* GET home page. */
router.get('/', function(req, res, next) {
    res.render('index');
});
router.get('/login', function(req, res, next) {
    res.render('login');
});
router.get('/register', function(req, res, next) {
    res.render('register');
});

router.post('/login', function(req, res, next) {
    res.send(data);
});
router.post('/register', function(req, res, next) {
    user.adduser(req.body.firstname, req.body.lastname, req.body.email, req.body.password);
    res.redirect('login');
});

module.exports = router;


// router.route('/')
//     .get(indexController.home);

// router.route('/login')
//     .get(indexController.login)
//     .post(indexController.login);

// router.route('/register')
//     .get(indexController.register)
//     .post(indexController.register);