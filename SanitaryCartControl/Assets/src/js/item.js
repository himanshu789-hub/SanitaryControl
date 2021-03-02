
export function activateBuildItems() {
	var elements = {
		ItemWrapper: '#Item-Wrapper',
		loading: '#loading',
		footer:'#footer'
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
			const itemHolder = $('<div>').addClass('itemHolder');
			let imageHolder = $('<div>').addClass('imageHolder');
			const img = $('<img>').attr('src', item.imagePath);
			const link = $('<a>').text('View Details').addClass('link').attr('href', `/Item/GetProduct/${item.id}`);
			imageHolder.append([img, link]);
			const text = $('<text>').text(item.name).addClass('title');
			itemHolder.append([imageHolder, text]);
			$(elements.ItemWrapper).append(itemHolder);
		});
	}
	
	const ajaxItemLoading = function () {
		if (document.documentElement.scrollTop == 
			($(document).height()-$(window).height()-$(elements.footer).height())
		) {
			const url =
				window.productRequestUrl + `?page=${++window.page}&IsEndCategory=${window.isSubCategory}&CategoryId=${window.categoryId}`;
			$.ajax({
				url,
				method: 'GET',
				success: function (res) {
					if (res.length == 0) {
						$(window).off('scroll',ajaxItemLoading);
					} else {
						buildItems(res);
					}
					$(elements.loading).remove();
				},
				beforeSend: function () {
					const loadingSpan = $(
						'<span style="display:block" class="text-center"><i class="fa fa-spinner fa-spin fa-3x"></span>',
					).attr('id', 'loading');
					$(loadingSpan).insertAfter($(elements.ItemWrapper));
				},
			});
		}
	};
	$(window).on('scroll',ajaxItemLoading);
	
}
