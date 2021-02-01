function BuildNavigation() {
	if (!$) {
		console.error('jQuery Do Not Exists');
		return;
	}
	if (!$('ul#menu')) {
		console.error('No menu element exists');
		return;
	} else if (!window.requestUrl | !window.appendEvents) {
		console.error('variables not found');
		return;
	}

	function buildMenu(parent, items, level) {
		$.each(items, function (index, item) {
			var li = $('<li><a class="p-1">' + this.title + '</a></li>');
			li.appendTo(parent);
			li.attr('data-level', level);
			var span = $('<span></span>');
			let a = li.find('a');
			a.text(this.title);
			span.append(a);
			li.append(span);

			a.attr('href', window.requestUrl + GetQueryString(this.isEndPoint, this.id));

			if (this.categories && this.categories.length > 0) {
				span.append('<span class="expand"><i class="fa fa-angle-down"></i></span>');
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
	$.ajax({
		url: '/api/GetSufficientCategory',
		success: function (data) {
			$('ul#menu').each(function (index, element) {
				buildMenu($(element), data, 0);
			});
			appendEvents();
		},
	});
}
