
// var mysql = require('mysql');
var db = require('../config/db');

// Add user to the database

exports.adduser = function(firstname, lastname, email, password, cb) {
    db.query('INSERT INTO project_cars.t_users SET ?', { user_firstname: firstname, user_lastname: lastname, user_email: email, user_password: password },
        function(err, result) {
            if (err) return cb(err, null);
            return cb(null, result)
        });
}

exports.getuser = function(email, cb) {
    db.query("SELECT  user_email, user_password, user_status FROM project_cars.t_users WHERE user_email = ?", [email], function(err, result, fields) {
        if (err) throw err;
        return cb(null, result);
    });
}

// exports.getadmin = function(email, cb) {
//     db.query("SELECT  user_email, user_password, user_status FROM project_cars.t_users WHERE user_status = 2", [email], function(err, result, fields) {
//         if (err) throw err;
//         return cb(null, result);
//     });
// }