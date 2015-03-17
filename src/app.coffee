$ ->
  console.log "starting up"
  new InteractiveCSS

class InteractiveCSS

  constructor: ->
    @cube = $('.shape').hasClass 'cube'

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
    $('#backfaces').click (e) ->
      $(e.target).toggleClass 'active'
      $('.shape').toggleClass 'backfaces'

    $('#perspective').change ->
      $('#stage').css '-webkit-perspective', $(this).val()
