$ ->
  console.log "starting up"
  new InteractiveCSS

class InteractiveCSS

  constructor: ->

    $('.button').click (e) ->
      btn = $(e.target)
      newState = !btn.hasClass 'active'
      $('.button').removeClass 'active' # clear other buttons
      btn.toggleClass 'active', newState
      $('.cube').removeClass 'rotate-up rotate-down rotate-left rotate-right'

      if newState # we want to spin dat cube
        $('.cube').addClass btn.data('rotate')
