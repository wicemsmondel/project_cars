var mysql = require('mysql');

var connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'admin',
    database: 'project_cars',
});

console.log('db connected')
    // Export DB connection (to the models)
module.exports = connection;