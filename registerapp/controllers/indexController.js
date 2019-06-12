var mongoose = require('mongoose');
var User = mongoose.model('User');
var bcrypt = require('bcrypt')

module.exports.home = function(req, res) {
    res.render('index.ejs', {});
};
module.exports.login = function(req, res) {
    if (req.method != 'POST') res.render('login.ejs', {});
    else {
        if (req.body.email && req.body.password) {
            User.find({ email: req.body.email }, function(err, user) {
                if (err) res.render('login.ejs', { error: err });
                else if (typeof user[0] == 'undefined') res.render('login.ejs', { error: 'Cet utilisateur n\'existe pas !' });
                else {
                    //Load hash from your password DB
                    bcrypt.compare(req.body.password, user[0].password).then(function(response) {
                        //response == true
                        if (response) {
                            req.session.user = user;
                            res.redirect('/');
                        } else {
                            res.render('login.ejs', { error: 'Mot de passe erroné !' })
                        }
                    });
                }
            });
        } else {
            res.render('login.ejs', { error: 'Veuillez saisir vos identifiants !' });
        }
    }
};
module.exports.register = function(req, res) {
    if (req.method != 'POST') res.render('register.ejs', {});
    else {
        if (req.body.password === req.body.passwordConfirm) {
            User.create({ email: req.body.email, password: req.body.password }, function(err, user) {
                if (err) res.render('register.ejs', { error: "Erreur de saisie !" });
                else {
                    res.redirect('/login');
                }
            });
        } else {
            res.render('register.ejs', { error: "wrong password" });
        }
    }

};