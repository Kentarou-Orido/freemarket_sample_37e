$(function() {
  $('#open').on('click', function() {
    $('#overlay, .modal').fadeIn();
  });

  $('#close').on('click', function() {
    $('#overlay, .modal').fadeOut();
  });

  locateCenter();
  $(window).resize(locateCenter);

  function locateCenter() {
    let w = $(window).width();
    let h = $(window).height();

    let cw = $('.modal').outerWidth();
    let ch = $('.modal').outerHeight();

    $('.modal').css({
      'left': ((w - cw) / 2) + 'px',
      'top': ((h - ch) / 2) + 'px'
    });
  }
});
