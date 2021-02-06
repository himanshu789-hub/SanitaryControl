import * as $ from 'jquery';
export function removeControls() {
	$('.control').remove();
}
export function buildSlider(sliderIdentifier, sliderWrapper, automatic) {
	if (!$) {
		console.error('jQuery not found');
		return;
	}
	if (!sliderIdentifier || !sliderWrapper) {
		console.error('Invald Argument');
		return;
	}
	checkIdentifierValidity(sliderIdentifier);
	checkIdentifierValidity(sliderWrapper);

	function checkIdentifierValidity(name) {
		if ($(name).length == 0) {
			console.error(`No '${sliderIdentifier}' exists`);
			return;
		}
		if ($(name).length > 1) {
			console.error(`Multiple Identifier With Name ${sliderWrapper} exists`);
			return;
		}
	}

	const slider = {
		index: -1,
		length: -1,
		touchmoveX: 0,
		touchStartX: 0,
		slideWidth: -1,
		moveX: 0,
		intervalId: -1,
		intervalInMs: 4000,

		init: function () {
			var posX1, posX2;
			$(sliderIdentifier).mousedown(slider.dragStart);
			$(sliderIdentifier).on('touchstart', slider.dragStart);

			$(sliderIdentifier).on('touchmove', slider.dragMove);
			$(sliderIdentifier).on('touchend', slider.dragEnd);
			slider.length = $(sliderIdentifier).children().length;
			const firstChild = $(sliderIdentifier).children().first();
			const lastChild = $(sliderIdentifier).children().last().clone();
			lastChild.insertBefore(`${sliderIdentifier}>*:first-child`);
			firstChild.clone().insertAfter(`${sliderIdentifier}>*:last-child`);
			const lengthAfterClone = slider.length + 2;
			slider.slideWidth = $(sliderWrapper).width();
			$(sliderIdentifier).css({
				width: $(sliderWrapper).width() * lengthAfterClone + 'px',
				transform: `translateX(-${slider.slideWidth}px)`,
			});
			applyAnimaton();
			provideWidthToSlide();
				applyAutomaticSliderIfRequire();
		
			setTimeout(() => {
				this.lazyLoadSliderImage();
			}, 2000);
			
		},
		lazyLoadSliderImage: function () {
			const images = $(sliderIdentifier).find('>img.lazy');
			$(sliderIdentifier).on('transitionend', function () {
				console.log('siding triggers');
				Array.from(images).forEach(element => {
					if ($(element).offset().left == $(sliderIdentifier).scrollLeft()) {
						const dataSrc = $(element).attr('data-src');
						$(element).attr('src', dataSrc);
					}
				});
				const anyImageWithLazyClass = images.filter(element => $(element).hasClass('lazy')).length > 0;
				if (!anyImageWithLazyClass) $(sliderIdentifier).off('scroll');
			});
		},
		dragStart: function (e) {
			if (e.type == 'touchstart') {
				slider.touchStartX = e.touches[0].clientX;
			} else {
				slider.touchStartX = e.clientX;
				document.onmousemove = slider.dragMove;
				document.onmouseup = slider.dragEnd;
			}
		},
		dragMove: function (e) {
			let dist = 0;
			if (e.type == 'touchmove') {
				slider.touchmoveX = e.touches[0].clientX;
				dist = slider.touchStartX - slider.touchmoveX;
				slider.moveX = slider.index * slider.slideWidth + dist;
			} else {
				slider.touchmoveX = e.clientX;
				dist = slider.touchStartX - slider.touchmoveX;
				slider.moveX = slider.index * slider.slideWidth + dist;
			}
		},
		dragEnd: function (e) {
			const absMove = Math.abs(slider.index * slider.slideWidth - slider.moveX);
			if (absMove > slider.slideWidth / 2) {
				if (slider.moveX > slider.index * slider.slideWidth) {
					slider.moveSlider(1);
				} else if (slider.moveX < slider.index * slider.slideWidth) {
					slider.moveSlider(-1);
				}
			}
			document.onmouseup = null;
			document.onmousemove = null;
		},
		moveSlider: function (position) {
			if (slider.index == -1 || slider.index == slider.length - 1) applyAnimaton();

			if (position == 1) {
				if (slider.index < slider.length - 1) {
					console.log('Before Index : ', slider.index);

					slider.index++;
					$(sliderIdentifier).css('transform', `translateX(${-(slider.index + 1) * slider.slideWidth}px)`);
					console.log('After Index : ', slider.index);
				} else {
					$(sliderIdentifier).css('transform', `translateX(${-(slider.length + 1) * slider.slideWidth}px)`);
					setTimeout(() => {
						$(sliderIdentifier).css({ transition: 'unset', transform: `translateX(-${slider.slideWidth}px)` });
					}, slider.intervalInMs / 4);
					slider.index = -1;
				}
			} else if (position == -1) {
				if (slider.index > 0) {
					console.log('Back Before Index : ', slider.index);

					$(sliderIdentifier).css('transform', `translateX(${-slider.index * slider.slideWidth}px)`);

					slider.index--;
				} else {
					console.log('Back Before Index : ', slider.index);

					$(sliderIdentifier).css('transform', `translateX(0px)`);
					slider.index = slider.length - 1;

					setTimeout(() => {
						$(sliderIdentifier).css({
							transition: 'transform .001s ease-in',
							transform: `translateX(-${slider.length * slider.slideWidth}px)`,
						});
					}, slider.intervalInMs / 4);
				}
			}
		},
	};
	slider.init();
	var resizeIntervalId;
	$(window).on('resize', function () {
		clearInterval(resizeIntervalId);
		console.log('resize event fires');
		window.resizeIntervalId = setTimeout(function () {
			clearInterval(slider.intervalId);
			slider.slideWidth = $(sliderWrapper).width();
			provideWidthToSlide();
			adjustSlider();
			applyAutomaticSliderIfRequire();
		}, 500);
	});
	function adjustSlider() {
		$(sliderIdentifier).css('transform', `translateX(-${(slider.index+1) * slider.slideWidth}px)`);
	}
	function provideWidthToSlide() {
		$(sliderIdentifier)
			.children()
			.each(function (index, element) {
				$(element).css({ 'min-width': slider.slideWidth + 'px' });
			});
	}
	$('#prev').click(function () {
		clearInterval(slider.intervalId);
		slider.moveSlider(-1);
		applyAutomaticSliderIfRequire();
	});
	$('#next').click(function () {
		clearInterval(slider.intervalId);
		slider.moveSlider(1);
		applyAutomaticSliderIfRequire();
	});

	function applyAutomaticSliderIfRequire() {
		if (automatic == true) slider.intervalId = activateAutomateSlider();
	}
	function applyAnimaton() {
		$(sliderIdentifier).css('transition', 'all 0.8s ease-in-out');
	}
	function activateAutomateSlider() {
		return setInterval(() => {
			slider.moveSlider(1);
		}, Math.abs(slider.intervalInMs));
	}
}
