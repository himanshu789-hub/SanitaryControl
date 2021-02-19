
import 'bootstrap/dist/css/bootstrap.css'
import  'jquery/dist/jquery';
import 'bootstrap/dist/js/bootstrap.bundle';
import * as $ from 'jquery'
window.$ = $;
window.jQuery = $;
import  'jquery-validation';
import 'jquery-validation-unobtrusive';
import './../../css/cmssite.css';
import {selectMenu} from './../homepage';
import {LazyLoadingActivation} from './../lazyload';
window.lazyLoadActivation = LazyLoadingActivation;
window.selectMenu = selectMenu;