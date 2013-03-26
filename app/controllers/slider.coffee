$.fn.pixels = (property) ->
  parseInt(@css(property).slice(0, -2))

class Slider extends Spine.Controller
  className: 'slider'

  currentStep: 1
  pause: 7000

  elements:
    'section': 'sections'
    '.section-container': 'sectionContainer'
    'section .container': 'sectionsContent'
    '#classify-button': 'button'

  constructor: ->
    super
    @html require 'views/slider'
    @delay =>
      @numSliders = @sections.length
      @sections.width $(document).width()
      @sectionContainer.width @numSliders * @sections.first().width()
      @sectionsContent.show()

  activate: =>
    super
    @start() unless @playing

  deactivate: =>
    super
    @stop()
    @restart()

  start: =>
    @playing = true
    @intervalId = setInterval @play, @pause

  play: =>
    if @currentStep < @numSliders
      @sectionContainer.css
        marginLeft: @sectionContainer.pixels('margin-left') - @sections.first().width()
      @currentStep += 1
    else
      @restart()

  stop: =>
    @playing = false
    clearInterval(@intervalId)

  restart: =>
    @sectionContainer.css
      marginLeft: 0
    @currentStep = @constructor::currentStep


module.exports = Slider