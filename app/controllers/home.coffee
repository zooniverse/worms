BaseController = require './base-controller'
Api = require 'zooniverse/lib/api'
require '../lib/carousel'
{ formatNumber } = require '../lib/utils'

PROGRESS_BAR_STARTING_POINT = 292157
DESIRED_CLASSIFICATIONS = 100000

class Home extends BaseController
  className: 'slider'
  template: require '../views/slider'

  desiredClassifications: DESIRED_CLASSIFICATIONS
  progressBarStartingPoint: PROGRESS_BAR_STARTING_POINT

  elements:
    '#slider': 'slider'
    '#current-progress': 'currentProgress'
    '#current-progress-number': 'currentProgressNumber'

  constructor: ->
    super
    @html @template @

    Api.current.get '/projects/worms', (project) =>
      progress = project.classification_count - PROGRESS_BAR_STARTING_POINT
      percentComplete = progress / DESIRED_CLASSIFICATIONS * 100
      @currentProgress.css 'width': "#{percentComplete}%"
      @currentProgressNumber.html formatNumber Math.max(progress, 0)

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
    setTimeout =>
      @slider.trigger 'updateSizes'
      @slider.trigger 'play', true
    , 100

  deactivate: =>
    super
    @slider.trigger 'stop'

module.exports = Home
