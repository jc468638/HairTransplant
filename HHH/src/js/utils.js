
$.get('templates/menu.html', function (data) {
    $('.menu').html(data);
    console.log('template appended');
});


$.get('templates/footer.html', function (data) {
    $('.footer').html(data);
    $('.year').html(new Date().getFullYear());
});



//-- javascript for init -->
$('.datetimepicker').datetimepicker({
    icons: {
        time: 'fa fa-clock-o',
        date: 'fa fa-calendar',
        up: 'fa fa-chevron-up',
        down: 'fa fa-chevron-down',
        previous: 'fa fa-chevron-left',
        next: 'fa fa-chevron-right',
        today: 'fa fa-screenshot',
        clear: 'fa fa-trash',
        close: 'fa fa-remove'
    }
});
// Select all links with hashes
$('a[href*="#"]')
    // Remove links that don't actually link to anything
    .not('[href="#"]')
    .not('[href="#0"]')
    .click(function (event) {
        // On-page links
        if (
            location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '')
        &&
        location.hostname == this.hostname
        ) {
            // Figure out element to scroll to
            var target = $(this.hash);
            target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
            // Does a scroll target exist?
            if (target.length) {
                // Only prevent default if animation is actually gonna happen
                event.preventDefault();
                $('html, body').animate({
                    scrollTop: target.offset().top
                }, 1000, function () {
                    // Callback after animation
                    // Must change focus!
                    var $target = $(target);
                    $target.focus();
                    if ($target.is(':focus')) { // Checking if the target was focused
                        return false;
                    } else {
                        $target.attr('tabindex', '-1'); // Adding tabindex for elements not focusable
                        $target.focus(); // Set focus again
                    }
                });
            }
        }
    });


function alertSuccess(message) {
    var alertContainer =
    '<div class="alert alert-success">'+
    '<div class="container">'+
    '<div class="alert-icon">'+
    '<i class="material-icons">check</i>'+
    '</div>'+
    '<button type="button" class="close" data-dismiss="alert" aria-label="Close">'+
    '<span aria-hidden="true"><i class="material-icons">clear</i></span>'+
    '</button>'+
    '<b>Success:</b>' +
      message +
    '</div>'+
    '</div>';
    return alertContainer;
}
