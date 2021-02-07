'use strict';

Object.defineProperty(exports, "__esModule", {
	value: true
});
exports.LazyLoadingActivation = LazyLoadingActivation;
function LazyLoadingActivation() {
	var lazyElements = {
		lazyWrapper: '.lazy-wrapper'
	};
	$(lazyElements.lazyWrapper).scroll(function () {
		if ($(this).scrollTop() == $(this)[0].scrollHeight - $(this)[0].clientHeight) {
			layLoader.init();
		}
	});

	var layLoader = {
		lazyLoadingInitiater: function lazyLoadingInitiater() {
			clearInterval(this.intervalId);
			setTimeout(function () {
				layLoader.loadImagesLazy();
			}, 500);
		},
		intervalId: -1,
		init: function init() {
			$(lazyElements.lazyWrapper)[0].addEventListener('scroll', layLoader.lazyLoadingInitiater);
			$(window)[0].addEventListener('resize', layLoader.lazyLoadingInitiater);
			$(window)[0].addEventListener('orientationchange', layLoader.lazyLoadingInitiater);
		},
		loadImagesLazy: function loadImagesLazy() {
			var images = $(lazyElements.lazyWrapper).find(' .lazy');
			images.each(function (index, element) {
				if ($(element).offset().top <= $(lazyElements.lazyWrapper)[0].clientHeight) {
					var dataSrc = $(element).attr('data-src');
					$(element).attr('src', dataSrc);
					$(element).removeClass('lazy');
				}
			});
			if (!images.filter('.lazy').length) {
				$(lazyElements.lazyWrapper)[0].removeEventListener('scroll', layLoader.lazyLoadingInitiater);
				$(window)[0].removeEventListener('resize', layLoader.lazyLoadingInitiater);
				$(window)[0].removeEventListener('orientationchange', layLoader.lazyLoadingInitiater);
			}
		}
	};

	layLoader.loadImagesLazy();
	layLoader.init();
}