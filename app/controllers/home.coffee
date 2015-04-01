BaseController = require './base-controller'
Api = require 'zooniverse/lib/api'
require '../lib/carousel'
ProjectStats = require './project-stats'

class Home extends BaseController
  className: 'slider'
  template: require '../views/slider'

  elements:
    '#slider': 'slider'

  constructor: ->
    super
    @html @template @

    projectStats = new ProjectStats
    @el.append projectStats.el

    projectFetch = $.getJSON "https://api.zooniverse.org/projects/worms"
    statusFetch = $.getJSON "https://api.zooniverse.org/projects/worms/status?status_type=subjects"

    $.when(projectFetch, statusFetch).done (projectResult, statusResult) =>
      return unless projectResult[1] == 'success' && statusResult[1] == 'success'

      projectStats.classificationCount = projectResult[0].classification_count
      projectStats.completeCount = projectResult[0].complete_count
      projectStats.userCount = projectResult[0].user_count
      projectStats.subjectCount = statusResult[0].reduce (p, v) ->
        p + v.count
      , 0

      projectStats.render()

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
