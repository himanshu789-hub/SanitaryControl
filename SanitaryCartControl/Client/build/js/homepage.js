'use strict';

Object.defineProperty(exports, "__esModule", {
	value: true
});
var selectMenu = exports.selectMenu = function selectMenu() {
	var pathName = location.pathname;
	var controller = pathName.split('/')[1];
	var selector = '#' + controller;
	$(selector + ' a').each(function (index, element) {
		if ($(element).attr('href') == window.location.pathname) {
			$(selector).collapse('show');
			$(element).addClass('current-link');
			$(element).parent().addClass('current-link-item');
			$(selector).parent().addClass('current-item');
		}
	});
};