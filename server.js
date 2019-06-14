var mysql = require('mysql');

//Creating connection with MySQL database
var con = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'admin',
    database: 'project_cars',
});
con.connect(function(err) {
    if (err) throw err;
    console.log('Connected to database');
    var sql = "SELECT * FROM t_users";
    con.query(sql, function(err, result, fields) {
        if (err) throw err;
        console.log(fields);
    });
});