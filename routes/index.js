
var express = require('express');
var router = express.Router();
var user = require('../models/userModel');
var indexController = require('../controller/indexController');
var session = require('express-session');
// GET pages
router.route('/')
    .get(indexController.home);

router.route('/login')
    .get(indexController.login)
    .post(indexController.login);

router.route('/register')
    .get(indexController.register)
    .post(indexController.register);

router.route('/logout')
    .get(indexController.logout);

router.route('/admin')
    .get(indexController.admin);

router.route('/catalog')
    .get(indexController.catalog);

router.route('/catalog/:car_brand')
    .get(indexController.catalogBrand);

module.exports = router;




// <% brands.forEach ((brand, index) => {%>
//     <a href="/catalog/<%= car.car_brand%>">
//         <img class="brand-image" src="images/logo_brands/<%= brand.car_brand%>.png" alt="<%= brand.car_brand%> logo"
//             name="<%= brand.car_brand%>">
//     </a>
//     <% })%></a>