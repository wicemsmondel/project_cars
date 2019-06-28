const mysql = require('mysql')
var User = require('../models/userModel');
var bcrypt = require("bcrypt");

module.exports.home = function(req, res) {
    console.log(req.session);

    if (req.session.user)
        res.render('index', { title: "Home" });
    else
        return res.redirect('login')

};

module.exports.login = function(req, res) {
    if (req.session.user)
        return res.redirect('/');
    if (req.method !== 'POST') res.render('login', { title: "Login" });
    else {
        if (req.body.email && req.body.password) {
            User.getuser(req.body.email, function(err, user) {

                if (err) res.render('login', { error: err, title: "Login" });
                else if (typeof user[0] == 'undefined') res.render('login', { error: "Can't find a user", title: "Login" });
                else {
                    console.log(user[0].user_password);

                    bcrypt.compare(req.body.password, user[0].user_password).then(function(response) {

                        if (response) {
                            req.session.user = user;
                            return res.redirect('/');

                        } else {
                            res.render('login', { error: 'Mot de passe erroné', title: "Login" })
                        };
                    });
                }
            });
        } else
            res.render('login', { error: "You must specify an email and a password to login", title: "Login" });
    }

};
module.exports.register = function(req, res) {

    if (req.session.user)
        return res.redirect('/');
    if (req.method !== 'POST') res.render('register', { title: "Register" });
    else {
        if (req.body.password === req.body.passwordConfirm) {
            bcrypt.hash(req.body.password, 10, function(err, hash) {
                User.adduser(req.body.firstname, req.body.lastname, req.body.email, hash,
                    function(err, user) {
                        if (err) res.render('register', { error: err });
                        else {
                            return res.redirect('login');
                        }

                    });
            });

        } else res.render('register', { error: "wrong password" });
    }
};

module.exports.logout = function(req, res) {
    if (req.session.user)
        req.session.destroy();
    return res.redirect('login');

}