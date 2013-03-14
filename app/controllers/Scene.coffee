Slides = require 'controllers/Slides'

class Reset extends Spine.Controller
  template: require 'views/scene/reset'

  events:
    'click': 'reset'

  constructor: ->
    super
    @html @template()

  reset: =>
    @trigger 'reset'

class Scene extends Spine.Controller
  className: 'scene'

  currentStep: 0
  positions: []

  elements:
    'section': 'sections'
    '.sections': 'sectionContainer'

  constructor: (element) ->
    super
    @html require 'views/scene'

  active: =>
    super
    @reset = new Reset
    @reset.appendTo 'body'
    @reset.on 'reset', @resetAnimation

    @delay @go, 100

  deactivate: =>
    super
    if @reset
      @reset.release()
    $('body').height 'auto'

  go: =>
    @sections.each (i, el) =>
      klass = new Slides[i]({el: $(el)})
      @positions.push [i, [$(el).outerHeight() * i, $(el).outerHeight() * i + $(el).outerHeight()], klass]

    $('body').height (@positions.length + 1) * @sections.height()
    @currentRegion = @positions[0][1]
    @positions[@currentStep][2].enter()

    $(document).scroll =>
      if window.pageYOffset < 0 then return

      unless @currentRegion[0] <= window.pageYOffset <= @currentRegion[1]
        if window.pageYOffset < @currentRegion[0]
          # @transition 'up'
        else
          if @sections[@currentStep + 1]?
            @transition 'down'

  transition: (direction) =>
    oldPosition = @positions[@currentStep]

    switch direction
      when 'up'
        @currentStep -= 1
      else
        @currentStep += 1

    oldPosition[2].exit =>
      @positions[@currentStep][2].enter()

    @currentRegion = @positions[@currentStep][1]

  resetAnimation: =>
    @sections.fadeOut()

    cleanUp = =>
      @reset.off()
      @reset.el.remove()
      @positions = []
      @currentStep = 0

      @html require 'views/scene'
      @reset = new Reset
      @reset.appendTo 'body'
      @reset.on 'reset', @resetAnimation
      @go()

    @delay cleanUp, 500

    window.scroll 0, 0

module.exports = Scene