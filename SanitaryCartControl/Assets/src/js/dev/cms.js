
import 'bootstrap/dist/css/bootstrap.css'
import  'jquery/dist/jquery';
import 'bootstrap/dist/js/bootstrap.bundle';
import * as $ from 'jquery'
import 'jquery-validation';
import 'jquery-validation-unobtrusive';
import './../../css/cmssite.css';
import { selectMenu } from './../homepage';
import { LazyLoadingActivation } from './../lazyload';

window.$ = $;
window.jQuery = $;
window.lazyLoadActivation = LazyLoadingActivation;
window.selectMenu = selectMenu;
