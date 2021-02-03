import 'bootstrap';
import * as $ from 'jquery';
import 'bootstrap/dist/css/bootstrap.css';
import {BuildNavigation} from './../nav';
import {buildItems} from './../item';
import {buildSlider,removeControls} from './../slider';
window.buildSlider = buildSlider;
window.buildItems = buildItems;
window.removeControls = removeControls;
window.buildNavigation = BuildNavigation;
window.$ = $;
import './../../css/clientsite.css';
console.log('Client Development Bundle Loaded')