export const selectMenu =  function () {
	const pathName = location.pathname;
	const controller = pathName.split('/')[2];
	const selector = '#' + controller;
	$('.main-ul a:not([href=""])').each(function(index,element){
		if ($(element).attr('href') == window.location.pathname) {
		     	if($(element).parents('.sub-ul').length)
				 {
			    $(selector).collapse('show');
					$(element).addClass('current-link');
					$(element).parent().addClass('current-link-item');
					$(selector).parent().addClass('current-item');
		
				}
				else
				{
			$(element).addClass('active-link current-link');
					
				}
		}
	});
};
