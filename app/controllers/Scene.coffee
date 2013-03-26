Slides = require 'controllers/Slides'

class Reset extends Spine.Controller
  className: 'reset-button'
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
    '#classify-button': 'button'

  constructor: (element) ->
    super
    @html require 'views/scene'

  active: =>
    super
    # @reset = new Reset
    # @reset.appendTo 'body'
    # @reset.on 'reset', @resetAnimation
    # $('body > footer').hide()

    @delay @go, 100

  deactivate: =>
    super
    # @resetAnimation false
    $('body > footer').show()
    $('body').height 'auto'
    $('body > .reset-button').remove()

  go: =>
    @positions = []
    @currentStep = 0

    @sections.each (i, el) =>
      klass = new Slides[i]({el: $(el)})
      @positions.push [i, [$(el).outerHeight() * i, $(el).outerHeight() * i + $(el).outerHeight()], klass]

    if Spine.Route.path is '/' then $('body').height (@positions.length + 1) * @sections.height()
    @currentRegion = @positions[0][1]
    @positions[@currentStep][2].enter()

    $(document).scroll =>
      if window.pageYOffset < 0 then return

      unless @currentRegion[0] <= window.pageYOffset <= @currentRegion[1]
        if window.pageYOffset > @currentRegion[0] and @sections[@currentStep + 1]?
          @transition 'down'

      if @sectionContainer.position().top < $(document).scrollTop()
        $('.stack > .scene').css {position: 'fixed', top: 40}
      else
        $('.stack > .scene').css {position: 'absolute', top: 0}

    $(document).scroll()

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

  resetAnimation: (replay = true) =>
    $.smoothScroll
      scrollTarget: 'body > header'
      afterScroll: =>
        @sectionContainer.fadeOut 300
        show = =>
          @html require 'views/scene'
          @go()
          @sectionContainer.show()

        @delay show, 300

module.exports = Scene