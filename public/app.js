var InteractiveCSS;

$(function() {
  console.log("starting up");
  return new InteractiveCSS;
});

InteractiveCSS = (function() {
  function InteractiveCSS() {
    this.cube = $('.shape').hasClass('cube');
    $('h1').click(function(e) {
      var h;
      console.log("header click");
      h = $(e.target);
      h.addClass('expand');
      return h.on('webkitAnimationEnd', function() {
        return h.removeClass('expand');
      });
    });
    $('.button[data-rotate]').click(function(e) {
      var btn, newState;
      btn = $(e.target);
      newState = !btn.hasClass('active');
      $('.button').removeClass('active');
      btn.toggleClass('active', newState);
      $('.cube').removeClass('rotate-up rotate-down rotate-left rotate-right');
      if (newState) {
        return $('.cube').addClass(btn.data('rotate'));
      }
    });
    $('#main-nav li').click(function(e) {
      var href;
      href = $(e.target).data('href');
      $('.tab').removeClass('visible');
      return $(href).addClass('visible');
    });
    $('#cube-ring-switch').click(function(e) {
      var mode;
      mode = this.cube ? "cube" : "ring";
      this.cube = !this.cube;
      $('.shape').toggleClass('cube ring');
      return $(e.target).text(mode);
    });
    $('#backfaces').click(function(e) {
      $(e.target).toggleClass('active');
      return $('.shape').toggleClass('backfaces');
    });
    $('#perspective').change(function() {
      return $('#stage').css('-webkit-perspective', $(this).val());
    });
  }

  return InteractiveCSS;

})();
