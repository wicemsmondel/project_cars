var express = require('express');
var router = express.Router();

router.get('/ok', function(req, res) {
    console.log(req.query);
    res.render("OK");
})

/* GET home page. */
router.get('/', function(req, res, next) {
    res.render('index');
});
router.post('/login', function(req, res, next) {
    res.render('login');
});
router.post('/register', function(req, res, next) {
    res.render('register');
});
module.exports = router;