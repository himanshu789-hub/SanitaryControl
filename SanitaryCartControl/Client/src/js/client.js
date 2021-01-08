import * as $ from 'jquery';
if (!$) {
	console.error('jQuery Do Not Exists');
}
if (!$('ul#menu')) {
	console.error('No menu exists');
} else if (!window.requestUrl|!window.appendEvents) {
	console.error('variables not found');
} else {
	function buildMenu(parent, items, level) {
		$.each(items, function (index, item) {
			var li = $('<li><a>' + this.title + '</a></li>');
			li.appendTo(parent);
			li.attr('data-level', level);
			var span = $('<span></span>');
			let a = li.find('a');
			a.text(this.title);
			span.append(a);
			li.append(span);

			if (this.categories && this.categories.length > 0) {
				a.attr('href', window.requestUrl + `?Page=0&IsSubCategory=true&Id=${this.id}`);
				span.append('<span class="expand"><i class="fa fa-angle-down"></i></span>');
				li.addClass('parent');
				var ul = $('<ul></ul>').attr('id', 'child');
				ul.appendTo(li);
				buildMenu(ul, this.categories, level + 1);
            } else
             a.attr('href', window.requestUrl + `?Page=0&IsSubCategory=false&Id=${this.id}`);
		});
	}
	$.ajax({
		url: '/api/getallcategory',
		success: function (data) {
			$('ul#menu').each(function (index, element) {
				buildMenu($(element), data, 0);
            });
            appendEvents();
		},
	});
}
