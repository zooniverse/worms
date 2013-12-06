BaseController = require './base-controller'
$.carousel = require '../lib/carousel'

class Home extends BaseController
  className: 'slider'
  template: require '../views/slider'

  elements:
    '#slider': 'slider'

  constructor: ->
    super
    @html @template()

    @delay =>
      @slider.carousel
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
    setTimeout =>
      @slider.trigger 'updateSizes'
      @slider.trigger 'play', true
    , 100

  deactivate: =>
    super
    @slider.trigger 'stop'

module.exports = Home
