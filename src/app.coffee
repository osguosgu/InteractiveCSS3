$ ->
  console.log "starting up"
  new InteractiveCSS

class InteractiveCSS

  constructor: ->
    @cube = $('.shape').hasClass 'cube'
    @toggleVelocity true

    $('h1').click (e) ->
      console.log "header click"
      h = $(e.target)
      h.addClass 'expand'
      h.on 'webkitAnimationEnd', ->
        h.removeClass 'expand'

    $('.button[data-rotate]').click (e) ->
      btn = $(e.target)
      newState = !btn.hasClass 'active'
      $('.button').removeClass 'active' # clear other buttons
      btn.toggleClass 'active', newState
      $('.cube').removeClass 'rotate-up rotate-down rotate-left rotate-right'

      if newState # we want to spin dat cube
        $('.cube').addClass btn.data('rotate')

    $('#main-nav li').click (e) ->
      href = $(e.target).data 'href'
      $('.tab').removeClass 'visible'
      $(href).addClass 'visible'

    $('#cube-ring-switch').click (e) ->
        mode =
          if @cube
            "cube"
          else
            "ring"
        @cube = !@cube
        $('.shape').toggleClass 'cube ring'
        $(e.target).text mode

    $('#backfacessss').click (e) ->
      $(e.target).toggleClass 'active'
      $('.shape').toggleClass 'backfaces'

    $('#move-menu').click (e) ->
      $('#controls').fadeOut().toggleClass('toggled').fadeIn()

    $('#hello').click (e) ->
      $('#intro').toggle()

    $('#hide-cube').click (e) ->
      $('.velocity-cube').toggle()

    $('#velocity-pause').click (e) =>
      val = !$(e.target).hasClass('active')
      $(e.target).toggleClass 'active'
      @toggleVelocity val

    $('#velocity-move').click (e) =>
      val = !$(e.target).hasClass('active')
      $(e.target).toggleClass 'active'
      @toggleVelocity val

    $('#perspective').change ->
      $('#stage').css '-webkit-perspective', $(this).val()

  toggleVelocity: (val) ->
    if val
      $('.velocity-cube').velocity(
        properties:
          rotateX: '360deg'
          rotateY: '360deg'
        options:
          duration: 4000
          loop: true
          easing: 'linear'
      )
    else
      $('.velocity-cube').velocity('stop', true)

  toggleGSAP: (val) ->
    unless @gsap
      @gsap = new TweenLite
        target: $('.velocity-cube')[0]
        duration: 4000
        vars:
          rotateX: '360deg'
          rotateY: '360deg'
          backgroundColor: '#fff'

      console.log @gsap
      @gsap.play()
    else
      @gsap.reverse()
