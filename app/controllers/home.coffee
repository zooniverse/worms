BaseController = require 'controllers/base-controller'

class Home extends BaseController
  className: 'slider'

  elements:
    '#slider': 'slider'

  constructor: ->
    super
    @html require 'views/slider'

    @delay =>
      @slider.carouFredSel
        height: 500
        width: '100%'
        items: 1
        prev: '#back'
        next: '#forward'
        auto:
          play: true
          timeoutDuration: 5000

  activate: =>
    super
    @slider.trigger 'play', true

  deactivate: =>
    super
    @slider.trigger 'stop'


module.exports = Home