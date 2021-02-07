'use strict';

var _nav = require('./../nav');

var _item = require('./../item');

var _slider = require('./../slider');

var _lightbox = require('./../lightbox');

var _lazyload = require('./../lazyload');

require('./../../css/clientsite.css');

window.lightbox = (0, _lightbox.LightBox)();
window.buildSlider = _slider.buildSlider;
window.activateBuildItems = _item.activateBuildItems;
window.removeControls = _slider.removeControls;
window.buildNavigation = _nav.BuildNavigation;
window.lazyLoadActivation = _lazyload.LazyLoadingActivation;