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
			var li = $('<li><a class="p-1">' + this.title + '</a></li>');
			li.appendTo(parent);
			li.attr('data-level', level);
			var span = $('<span></span>');
			let a = li.find('a');
			a.text(this.title);
			span.append(a);
			li.append(span);
			if(level==1)
			{
			 li.addClass('col-12 col-lg-3');
			}
		   a.attr('href', window.requestUrl + GetQueryString(this.isEndPoint,this.id));
		
			if (this.categories && this.categories.length > 0) {
				span.append('<span class="expand"><i class="fa fa-angle-down"></i></span>');
				li.addClass('parent');
				var ul = $('<ul></ul>').attr('id', 'child');
				ul.appendTo(li);
				buildMenu(ul, this.categories, level + 1);
			} 
		});
	}
	function GetQueryString(IsEndPoint,Id)
	{
		return `?IsEndCategory=${IsEndPoint}&CategoryId=${Id}&Page=0`;
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
