var express = require('express'),
    mongoose = require('mongoose');
bodyParser = require('body-parser');
ejs = require('ejs');
User = require('./models/user');

const app = express();
const session = require('express-session')

app.use(bodyParser.urlencoded({ extended: false }))


var indexRoutes = require('./config/routes/index');

app.use('/', indexRoutes);

//Connect to DB
mongoose.connect('mongodb://localhost/registerloginapp', { useNewUrlParser: true });

var db = mongoose.connection;


app.set('view engine', 'ejs');
app.use(session({
    secret: 'keyboardcat',
    resave: false,
    saveUninitialized: true,
}))
mongoose.set('useCreateIndex', true);

app.listen(3000);