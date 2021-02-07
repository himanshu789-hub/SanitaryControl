'use strict';

Object.defineProperty(exports, "__esModule", {
	value: true
});
exports.activateBuildItems = activateBuildItems;
function activateBuildItems() {
	var elements = {
		ItemWrapper: '#Item-Wrapper',
		loading: '#loading'
	};
	if (!(window.categoryId && window.productRequestUrl && window.isSubCategory != undefined)) {
		console.error('variable not found');
		return;
	}

	if (!$(elements.ItemWrapper)) {
		console.error('Item Wrapper Element Not Found');
		return;
	}
	window.page = 0;
	function buildItems(data) {
		Array.from(data).forEach(function (item) {
			var itemHolder = $('<div>').addClass('itemHolder');
			var imageHolder = $('<div>').addClass('imageHolder');
			var img = $('<img>').attr('src', item.imagePath);
			var link = $('<a>').text('View Details').addClass('link').attr('href', '/Item/GetProduct/' + item.id);
			imageHolder.append([img, link]);
			var text = $('<text>').text(item.name).addClass('title');
			itemHolder.append([imageHolder, text]);
			$(elements.ItemWrapper).append(itemHolder);
		});
	}
	$(elements.ItemWrapper).scroll(ajaxItemLoading);
	var ajaxItemLoading = function ajaxItemLoading() {
		if ($(elements.ItemWrapper).scrollTop() == $(elements.ItemWrapper)[0].scrollHeight - $(elements.ItemWrapper)[0].clientHeight) {
			var url = window.productRequestUrl + ('?page=' + ++window.page + '&IsEndCategory=' + window.isSubCategory + '&CategoryId=' + window.categoryId);
			$.ajax({
				url: url,
				method: 'GET',
				success: function success(res) {
					if (res.length == 0) {
						$(elements.ItemWrapper)[0].removeEventListener('scroll', ajaxItemLoading);
					} else {
						buildItems(res);
					}
					$(elements.loading).remove();
				},
				beforeSend: function beforeSend() {
					var loadingSpan = $('<span style="display:block" class="text-center"><i class="fa fa-spinner fa-spin fa-3x"></span>').attr('id', 'loading');
					$(loadingSpan).insertAfter($(elements.ItemWrapper));
				}
			});
		}
	};
}