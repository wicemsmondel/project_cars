var mysql = require('mysql');
var connection = require('../config/db');




exports.adduser = function(login, pass) {
    var values = [login, pass];

    var sql = "INSERT INTO project_cars.t_users (user_email, user_password) VALUES (?)";
    connection.query(sql, [values], function(err, result) {
        console.log(err);
        if (err) throw err;
        console.log("1 user inserted");
    });
}