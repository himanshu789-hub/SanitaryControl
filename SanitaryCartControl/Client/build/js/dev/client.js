'use strict';

require('bootstrap');

var _jquery = require('jquery');

var $ = _interopRequireWildcard(_jquery);

require('bootstrap/dist/css/bootstrap.css');

var _nav = require('./../nav');

var _item = require('./../item');

var _slider = require('./../slider');

var _lazyload = require('./../lazyload');

var _lightbox = require('./../lightbox');

require('./../../css/clientsite.css');

function _interopRequireWildcard(obj) { if (obj && obj.__esModule) { return obj; } else { var newObj = {}; if (obj != null) { for (var key in obj) { if (Object.prototype.hasOwnProperty.call(obj, key)) newObj[key] = obj[key]; } } newObj.default = obj; return newObj; } }

window.buildSlider = _slider.buildSlider;
window.activateBuildItems = _item.activateBuildItems;
window.removeControls = _slider.removeControls;
window.buildNavigation = _nav.BuildNavigation;
window.$ = $;
window.lightbox = (0, _lightbox.LightBox)();

window.lazyLoadActivation = _lazyload.LazyLoadingActivation;
console.log('Client Development Bundle Loaded');