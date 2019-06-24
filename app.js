var createError = require('http-errors');
var express = require('express');
var database = require('./config/db.js');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');

var indexRouter = require('./routes/index');
var usersRouter = require('./routes/users');

var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use('/', indexRouter);
app.use('/users', usersRouter);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
    next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
    // set locals, only providing error in development
    res.locals.message = err.message;
    res.locals.error = req.app.get('env') === 'development' ? err : {};

    // render the error page
    res.status(err.status || 500);
    res.render('error');
});

app.get('/register', function(request, response) {
    // var sql('SELECT * FROM project_cars.t_users;', function(error, data) {
    response.send(data);
});


app.post('/register', function(request, response) {
    console.log(request.body.client_name);
    var sql = ('INSERT INTO project_cars.t_users (user_email, user_password) VALUES(?, ?)', request.body.user_mail, request.body.user_password);
    response.send(data);
})

module.exports = app;