$.fn.pixels = (property) ->
  parseInt(@css(property).slice(0, -2))

class Slider extends Spine.Controller
  className: 'slider'

  constructor: ->
    super
    @html require 'views/slider'

    @delay =>
      $('#slider').carouFredSel
        height: 500
        width: '100%'
        items: 1
        prev: '#back'
        next: '#forward'
        auto:
          timeoutDuration: 5000


module.exports = Slider