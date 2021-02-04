import * as $ from 'jquery';
export function activateBuildItems() {
	function buildItems(data) {
		if (!(window.categoryId && window.productRequestUrl)) {
			console.error('variable not found');
			return;
		}

		var elements = {
			ItemWrapper: '#Item-Wrapper',
			loading: '#loading',
		};

		if (!$(elements.ItemWrapper)) {
			console.error('Item Wrapper Element Not Found');
			return;
		}
		window.page = 0;

		data.forEach(function (item) {
			const itemHolder = $('<div>').addClass('itemHolder');
			let imageHolder;
			if (!isSubCategory) imageHolder = $('<a>').addClass('imageHolder');
			else imageHolder = $('<div>').addClass('imageHolder');

			const img = $('<img>').attr('src', item.Image);
			const link = $('<a>').text('View Details').addClass('link').attr('href', '#');
			imageHolder.append(img);
			if (!isSubcategory) imageHolder.append(link);
			const text = $('<text>').text(item.Name).addClass('title');
			itemHolder.append([imageHolder, text]);
			$(elements.ItemWrapper).append(itemHolder);
		});
         
		$(window).scroll(function () {
			debugger;
			
				if ($(window).scrollTop() == $(document).height() - $(window).height()) {
			const url = window.itemRequestUrl + `?page=${++page}&IsSubcategory=${window.isSubcategory}&Id=${window.id}`;
			$.ajax({
				url,
				method: 'GET',
				success: function (res) {
					$(elements.loading).remove();
					if (res.length == 0) {
						window.removeEventListener('scroll');
					} else {
						buildItems(res);
					}
				},
				beforeSend: function () {
					const loadingSpan = $('<span>').attr('id', 'loading');
					$(elements.ItemWrapper).append(loadingSpan);
				},
			});
			}
		});
	}
}
