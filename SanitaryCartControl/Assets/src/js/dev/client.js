import 'bootstrap';
import * as $ from 'jquery';
import 'bootstrap/dist/css/bootstrap.css';
import {BuildNavigation} from './../nav';
import {activateBuildItems} from './../item';
import {buildSlider,removeControls} from './../slider';
import {LazyLoadingActivation} from './../lazyload'
import { LightBox } from './../lightbox';

window.buildSlider = buildSlider;
window.activateBuildItems = activateBuildItems;
window.removeControls = removeControls;
window.buildNavigation = BuildNavigation;
window.$ = $;
window.lightbox = LightBox();
import './../../css/clientsite.css';
window.lazyLoadActivation = LazyLoadingActivation;
console.log('Client Development Bundle Loaded')