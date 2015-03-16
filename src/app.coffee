$ ->
  console.log "starting up"
  new InteractiveCSS

class InteractiveCSS

  constructor: ->

    $('h1').click (e) ->
      console.log "header click"
      h = $(e.target)
      h.addClass 'expand'
      h.on 'webkitAnimationEnd', ->
        h.removeClass 'expand'

    $('.button').click (e) ->
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
