BaseController = require './base-controller'
Api = require 'zooniverse/lib/api'
ProjectStats = require './project-stats'

class Home extends BaseController
  className: 'home'
  template: require '../views/pages/home'

  elements:
    '#stats-container': 'statsContainer'

  constructor: ->
    super
    @html @template @

    projectStats = new ProjectStats
    @statsContainer.append projectStats.el

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

module.exports = Home
