import * as $ from 'jquery';
export function BuildNavigation() {
	if (!$) {
		console.error('jQuery Do Not Exists');
		return;
	}
	if (!$('ul[data-append="true"]')) {
		console.error('No menu element exists');
		return;
	}
	let requestUrl = '/Item/Get';
	function buildMenu(parent, items, level) {
		$.each(items, function (index, item) {
			var li = $('<li><span><a class="p-1">' + this.title + '</a><span></li>');
			li.appendTo(parent);
			li.attr('data-level', level);
			let a = li.find('a');
			a.text(this.title);
			a.attr('href', requestUrl + GetQueryString(this.isEndPoint, this.id));

			if (this.categories && this.categories.length > 0) {
				a.append('<span class="expand"><i class="arrow-sign"></i></span>');
				li.addClass('parent');
				var ul = $('<ul></ul>').attr('id', 'child');
				ul.appendTo(li);
				buildMenu(ul, this.categories, level + 1);
			}
		});
	}
	function GetQueryString(IsEndPoint, Id) {
		return `?IsEndCategory=${IsEndPoint}&CategoryId=${Id}&Page=0`;
	}
	function appendEvents() {
		$('nav ul#child>li').click(function (e) {
			e.stopPropagation();
		});
		$('nav li.parent:not([data-level="0"])').on('mouseover',function () {
			if ($(window).width() > 992) {
				const subMenu = $(this).find('>ul#child');
				const windowHeight = window.innerHeight;
				const offSetLeft = $(subMenu).offset().left;
				const width = $(subMenu).width();
				const parentMenu = $(this).parent();
				const parentWidth = $(this).width();
				const offSetTop = $(subMenu).offset().top;
				const height = $(subMenu).height();

				if (offSetTop + height > windowHeight && !$(subMenu).hasClass('adjusted')) {
					if (height == windowHeight) $(subMenu).css('top', `-${offSetTop}px`);
					else if (height < windowHeight) $(subMenu).css('top', `-${offSetTop + height + 10 - windowHeight}px`);
					else
						$(subMenu)
							.css({ top: `-${offSetTop - 10}px` })
							.addClass('edge-over');
					$(subMenu).addClass('adjusted');
				}
				if (offSetLeft + width > $(window).innerWidth()) {
					$(subMenu).css({ right: `100%` });
				}
			}
		});
		var intervalId;
		$(document).on('resize', function () {
			clearInterval(intervalId);
			intervalId = setTimeout(function () {
				$('ul#menu ul#child').attr('style', '');
			}, 500);
		});
		$('nav ul#menu').mouseleave(function (e) {
			$('li.parent.active').removeClass('active');
		});

		$('nav li.parent span.expand').click(function (e) {
			const li = $(this).parents('li.parent').first();
			const level = li.data('level');
			const liList = li.siblings().filter(function (index, value) {
				return $(value).hasClass('parent') && value != li[0];
			});
			const array = $.grep(liList, function (value) {
				return $(value).find('>ul#child.showList').length > 0;
			});
			array.forEach(element => {
				$(element).find('>ul#child.showList').removeClass('showList');
				$(element).find('>span>span.expand>i').removeClass('fa-angle-up');
			});

			li.find('>ul#child').first().toggleClass('showList');
			li.toggleClass('active');
			li.find('>span>span.expand>i').toggleClass('fa-angle-up');
			e.stopPropagation();
			e.preventDefault();
		});
	}

	$.ajax({
		url: '/api/GetSufficientCategory',
		success: function (data) {
			$('ul[data-append="true"]').each(function (index, element) {
				buildMenu($(element), data, 1);
			});
			appendEvents();
		},
	});
}
