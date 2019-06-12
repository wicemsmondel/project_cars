var mongoose = require('mongoose');
var Schema = mongoose.Schema;
var bcrypt = require('bcrypt');
var validator = require('validator')

var User = new Schema({
    email: {
        type: String,
        unique: true,
        require: true,
        validate: { validator: validator.isEmail, message: 'Invalid email' }
    },
    password: { type: String, require: true },

});

User.pre('save', function(next) {
    var user = this;

    //only hass psw if modif
    if (!user.isModified('password')) return next();

    bcrypt.hash(user.password, 10, function(err, hash) {
        user.password = hash;
        return next();
    });
});

User.methods.comparePassword = function(password, callback) {
    bcrypt.compare(password, this.password, function(err, req) {
        if (err) return err;

        callback(null, res);

    })
}
module.exports = mongoose.model('User', User);