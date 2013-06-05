BaseController = require 'controllers/base-controller'

class Home extends BaseController
  className: 'slider'
  template: require 'views/slider'

  elements:
    '#slider': 'slider'

  constructor: ->
    super
    @html @template()

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
    @delay =>
      @slider.trigger 'updateSizes'
      @slider.trigger 'play', true

  deactivate: =>
    super
    @slider.trigger 'stop'

module.exports = Home