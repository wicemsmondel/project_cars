var express = require('express');
var router = express.Router();
var user = require('../models/userModel')

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
    user.adduser(req.body.email, req.body.password);
    res.redirect('login');
});
module.exports = router;