import 'bootstrap';
import * as $ from 'jquery';
import 'bootstrap/dist/css/bootstrap.css';
import {BuildNavigation} from './../nav';
import {activateBuildItems} from './../item';
import {buildSlider,removeControls} from './../slider';
window.buildSlider = buildSlider;
window.activateBuildItems = activateBuildItems;
window.removeControls = removeControls;
window.buildNavigation = BuildNavigation;
window.$ = $;
import './../../css/clientsite.css';
console.log('Client Development Bundle Loaded')