const pathName = location.pathname;
        const controller = pathName.split('/')[1]
        const selector = '#' + controller
        $(selector + ' a').each(function (index, element) {
            if ($(element).attr('href') == window.location.pathname) {
                 $(selector).collapse('show')
                 $(element).addClass('current-link')
                 $(element).parent().addClass('current-link-item');
                 $(selector).parent().addClass('current-item');
            }
        });