var mysql = require('mysql');

var connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'admin',
    database: 'project_cars',
});
connection.connect(function(err) {
    if (err) throw err;
    console.log('Connected to database');
});

// Export DB connection (to the models)
module.exports = connection;