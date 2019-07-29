var mysql = require('mysql');
var User = require('../models/userModel');
var session = require('express-session');
var bcrypt = require("bcrypt");
const db = require('../config/db');

module.exports.home = function (req, res) {
    db.query("SELECT DISTINCT car_brand FROM `t_cars`", (err, data) => {
        if (err) res.render('index', { error: err, title: "Project Cars Accueil" });
        else {
            db.query("SELECT car_image FROM `t_cars` ORDER BY  car_id DESC LIMIT 8", (err, result) => {
                db.query("SELECT DISTINCT car_model FROM `t_cars`", (err, resultat) => {
                    db.query("SELECT DISTINCT car_body FROM `t_cars` ORDER BY  car_body ASC", (err, donnees) => {
                        res.render('index', { error: err, title: "Project Cars Accueil", brands: data, images: result, models: resultat, bodyworks: donnees });
                    });
                });
            });
        };
    });
};

module.exports.login = function (req, res) {
    if (req.session.user) {
        return res.redirect('/');
    }
    if (req.method !== 'POST') res.render('login', { title: "Project Cars Connexion" });
    else {
        if (req.body.email && req.body.password) {
            User.getuser(req.body.email, function (err, user) {
                if (err) res.render('login', { error: err, title: "Project Cars Connexion" });
                else if (typeof user[0] == 'undefined') res.render('login', { error: "Cet utilisateur n\'existe pas !", title: "Project Cars Connexion" });
                else {
                    bcrypt.compare(req.body.password, user[0].user_password).then(function (response) {
                        if (response) {
                            req.session.user = user[0];
                            console.log(user);
                            if (user[0].user_status == 2) {
                                console.log("user");
                                return res.redirect('/admin');
                            }
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
    // if req.session.user.user_status === 2

    res.render('admin', { title: "Administration" });
};


module.exports.catalog = function (req, res) {
    let brand = req.query.brand;
    let model = req.query.model;
    let bodywork = req.query.bodywork;
    // console.log(req);
    let strQuery = "SELECT * FROM `t_cars`";
    let bAdd = 0;

    if (brand != undefined){
        bAdd=1;
        
        strQuery += " WHERE car_brand LIKE " + mysql.escape(brand);
    }
    if (model != undefined){        
        if (!bAdd)
            strQuery += " WHERE ";
        else 
            strQuery += " AND ";
        bAdd = 1;
        strQuery += " car_model LIKE " + mysql.escape(model);
    }
    // console.log(strQuery);
    if (bodywork != undefined) {
        if (!bAdd) 
            strQuery += " WHERE ";
        else 
            strQuery += " AND ";        
            
        strQuery += " car_body LIKE " + mysql.escape(bodywork);
    }
// db.query("SELECT * FROM `t_cars` WHERE car_brand = ? AND car_model = ? AND car_body = ?", {car_brand: brand, car_model: model, car_body: bodywork}

    db.query(strQuery , (err, data) => {
            if (err) {
                console.log(err);
                res.render('catalog', { error: err, title: "Project Cars Accueil" });
            }
            else
                res.render('catalog', { title: "Catalogue", cars: data });
            // console.log(data)
        });
};

module.exports.catalogBrand = (req, res) => {
    db.query("SELECT * FROM t_cars WHERE car_brand=?", req.params.car_brand, (err, data) => {
        if (err) res.render('index', { error: err, title: "Project Cars Accueil" });
        else
            res.render('catalog', { title: "Catalogue", cars: data });
    });
};