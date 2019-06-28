var mysql = require('mysql');
var connection = require('../config/db');

exports.adduser = function(firstname, lastname, email, password, cb) {
    // var values = [firstname, lastname, email, password];
    // var sql = "INSERT INTO project_cars.t_users (user_firstname, user_lastname, user_email, user_password) VALUES (?)";
    connection.query('INSERT INTO project_cars.t_users SET ?', { user_firstname: firstname, user_lastname: lastname, user_email: email, user_password: password },
        function(err, result) {

            if (err) return cb(err, null);
            return cb(null, result)
        });
}

exports.getuser = function(email, cb) {
    connection.query("SELECT  user_email, user_password FROM project_cars.t_users WHERE user_email = ?", [email], function(err, result, fields) {
        if (err) throw err;
        return cb(null, result);
    });
}