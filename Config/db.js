var mysql = require('mysql');

var connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'admin',
    database: 'project_cars',
});
connection.connect(function(err) {
    var sql = "INSERT INTO project_cars.t_users (user_email, user_password, user_firstname, user_lastname, user_status) VALUES ('w.smondel@gmail.com', 'motdepasse', 'wicem', 'smondel', 1)";
    connection.query(sql, function(err, result) {
        if (err) throw err;
        console.log("1 record inserted");
    });
});

// Export DB connection (to the models)
module.exports = connection;