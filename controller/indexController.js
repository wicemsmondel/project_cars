var mysql = require('mysql');
var User = require('../models/userModel');
var session = require('express-session');
var bcrypt = require("bcrypt");
const db = require('../config/db');


module.exports.home = function (req, res) {
    let promise = new Promise(function (success, reject) {
        db.query('SELECT * FROM project_cars.t_cars', function (err, data) {
            if (err) reject(err);
            else success(data);
        })
    })
        .then(data => {
            res.render('index', { title: "Home", data });
        })
        .catch(err => console.log(err))



};

module.exports.login = function (req, res) {
    if (req.session.user)
        return res.redirect('/');
    if (req.method !== 'POST') res.render('login', { title: "Login" });
    else {
        if (req.body.email && req.body.password) {
            User.getuser(req.body.email, function (err, user) {

                if (err) res.render('login', { error: err, title: "Login" });
                else if (typeof user[0] == 'undefined') res.render('login', { error: "Cet utilisateur n\'existe pas !", title: "Login" });
                else {
                    // console.log(user[0].user_password);

                    bcrypt.compare(req.body.password, user[0].user_password).then(function (response) {
                        if (response) {
                            req.session.user = user;
                            return res.redirect('/');
                        } else {
                            res.render('login', { error: 'Mot de passe incorrect !', title: "Login" });
                        }
                    });
                }
            });
        }
    }

};

module.exports.register = function (req, res) {
    if (req.session.user)
        res.redirect('/');
    if (req.method !== 'POST') res.render('register', { title: "Register" });
    else {
        if (req.body.password === req.body.passwordConfirm) {
            bcrypt.hash(req.body.password, 10, function (err, hash) {
                User.adduser(req.body.firstname, req.body.lastname, req.body.email, hash,
                    function (err, user) {
                        if (err) res.render('register', { error: err, title: "Register" });
                        else {
                            return res.redirect('login');
                        }

                    });
            });

        } else res.render('register', { error: "Les mots de passe sont différents !", title: "Register" });
    }
};

module.exports.logout = function (req, res) {
    if (req.session.user)
        req.session.destroy();
    return res.redirect('login');

};

module.exports.admin = function (req, res) {
    res.render('admin', { title: "Admin" });

};