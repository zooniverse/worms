BaseController = require './base-controller'

class ProjectStats extends BaseController
  className: 'project-stats'
  template: require '../views/project-stats'

  render: ->
    console.log @
    @html @template @

module.exports = ProjectStats
