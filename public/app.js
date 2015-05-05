var InteractiveCSS;

$(function() {
  console.log("starting up");
  return new InteractiveCSS;
});

InteractiveCSS = (function() {
  function InteractiveCSS() {
    this.cube = $('.shape').hasClass('cube');
    this.toggleVelocity(true);
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
    $('#backfacessss').click(function(e) {
      $(e.target).toggleClass('active');
      return $('.shape').toggleClass('backfaces');
    });
    $('#move-menu').click(function(e) {
      return $('#controls').fadeOut().toggleClass('toggled').fadeIn();
    });
    $('#hello').click(function(e) {
      return $('#intro').toggle();
    });
    $('#hide-cube').click(function(e) {
      return $('.velocity-cube').toggle();
    });
    $('#velocity-pause').click((function(_this) {
      return function(e) {
        var val;
        val = !$(e.target).hasClass('active');
        $(e.target).toggleClass('active');
        return _this.toggleVelocity(val);
      };
    })(this));
    $('#velocity-move').click((function(_this) {
      return function(e) {
        var val;
        val = !$(e.target).hasClass('active');
        $(e.target).toggleClass('active');
        return _this.toggleVelocity(val);
      };
    })(this));
    $('#perspective').change(function() {
      return $('#stage').css('-webkit-perspective', $(this).val());
    });
  }

  InteractiveCSS.prototype.toggleVelocity = function(val) {
    if (val) {
      return $('.velocity-cube').velocity({
        properties: {
          rotateX: '360deg',
          rotateY: '360deg'
        },
        options: {
          duration: 4000,
          loop: true,
          easing: 'linear'
        }
      });
    } else {
      return $('.velocity-cube').velocity('stop', true);
    }
  };

  InteractiveCSS.prototype.toggleGSAP = function(val) {
    if (!this.gsap) {
      this.gsap = new TweenLite({
        target: $('.velocity-cube')[0],
        duration: 4000,
        vars: {
          rotateX: '360deg',
          rotateY: '360deg',
          backgroundColor: '#fff'
        }
      });
      console.log(this.gsap);
      return this.gsap.play();
    } else {
      return this.gsap.reverse();
    }
  };

  return InteractiveCSS;

})();
