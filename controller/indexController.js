
var mysql = require('mysql');
var User = require('../models/userModel');
var session = require('express-session');
var bcrypt = require("bcrypt");
const db = require('../config/db');

module.exports.home = function (req, res) {
    db.query("SELECT DISTINCT  car_brand FROM `t_cars`",  (err, data)=> {
        if (err) res.render('index', { error: err, title: "Project Cars Accueil" });
        else
        res.render('index', { title: "Project Cars Accueil", cars: data });
    });
    // db.query("SELECT car_image FROM `t_cars`",  (err, data)=> {
    //     if (err) res.render('index', { error: err, title: "Project Cars Accueil" });
    //     else
    //     res.render('index', { title: "Project Cars Accueil", cars: data });
    // });
};

module.exports.login = function (req, res) {
    if (req.session.user){console.log(req.session.user);
        return res.redirect('/');}
    if (req.method !== 'POST') res.render('login', { title: "Project Cars Connexion" });
    else {
        if (req.body.email && req.body.password) {
            User.getuser(req.body.email, function (err, user) {
                if (err) res.render('login', { error: err, title: "Project Cars Connexion" });
                else if (typeof user[0] == 'undefined') res.render('login', { error: "Cet utilisateur n\'existe pas !", title: "Project Cars Connexion" });
                else {
                    // console.log(user[0].user_password);

                    bcrypt.compare(req.body.password, user[0].user_password).then(function (response) {
                        if (response) {
                            req.session.user = user;
                            return res.redirect('/');
                        } else {
                            res.render('login', { error: 'Mot de passe incorrect !', title: "Project Cars Connexion" });
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
    if (req.method !== 'POST') res.render('register', { title: "Inscription" });
    else {
        if (req.body.password === req.body.passwordConfirm) {
            bcrypt.hash(req.body.password, 10, function (err, hash) {
                User.adduser(req.body.firstname, req.body.lastname, req.body.email, hash,
                    function (err, user) {
                        if (err) res.render('register', { error: err, title: "Inscription" });
                        else {
                            return res.redirect('login');
                        }
                    });
            });
        } else res.render('register', { error: "Les mots de passe sont différents !", title: "Inscription" });
    }
};

module.exports.logout = function (req, res) {
    if (req.session.user)
        req.session.destroy();
    return res.redirect('login');
};

module.exports.admin = function (req, res) {
    res.render('admin', { title: "Administration" });
};

// module.exports.catalog = function (req, res) {
//     let promise = new Promise(function (success, reject) {
//         db.query('SELECT * FROM project_cars.t_cars', function (err, data) {
//             if (err) reject(err);
//             else success(data);
//         })
//     })
//         .then(data => {
//             res.render('catalog', { title: "Catalogue", data });
//         })
//         .catch(err => console.log(err))
// };


module.exports.catalog = function (req, res) {
    db.query("SELECT * FROM `t_cars`",  (err, data)=> {
        if (err) res.render('index', { error: err, title: "Project Cars Accueil" });
        else
        res.render('catalog', { title: "Catalogue", cars: data });
        console.log(data)
    });
};
// module.exports.catalogBrand = function (req, res) {
//     db.query("SELECT * FROM `t_cars` WHERE car_brand= "(.$carBrand)",  (err, data)=> {
//         if (err) res.render('index', { error: err, title: "Project Cars Accueil" });
//         else
//         res.render('catalog', { title: "Catalogue", cars: data });
    
//     });
// };

module.exports.catalogBrand = function (req, res) {

    var carBrand  = req.params.car_brand;
    db.query("SELECT * FROM t_cars WHERE car_brand=?", carBrand,(err, data) => {
        if (err) res.render('index', { error: err, title: "Project Cars Accueil" });
        else
        // console.log(req.params.car_brand, "GGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG");
            res.render('brand.ejs', { title: "Catalogue", cars: data });
            console.log(__dirname, "gggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg")

    });
};