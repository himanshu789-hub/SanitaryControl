'use strict';

require('bootstrap/dist/css/bootstrap.css');

require('jquery/dist/jquery');

require('bootstrap');

var _jquery = require('jquery');

var $ = _interopRequireWildcard(_jquery);

require('jquery-validation');

require('jquery-validation-unobtrusive');

require('./../../css/cmssite.css');

var _homepage = require('./../homepage');

function _interopRequireWildcard(obj) { if (obj && obj.__esModule) { return obj; } else { var newObj = {}; if (obj != null) { for (var key in obj) { if (Object.prototype.hasOwnProperty.call(obj, key)) newObj[key] = obj[key]; } } newObj.default = obj; return newObj; } }

window.$ = $;
window.jQuery = $;

window.selectMenu = _homepage.selectMenu;