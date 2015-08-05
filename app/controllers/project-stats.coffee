BaseController = require './base-controller'

class ProjectStats extends BaseController
  className: 'project-stats'
  template: require '../views/project-stats'

  render: ->
    @html @template @

module.exports = ProjectStats
