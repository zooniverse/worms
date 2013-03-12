BaseSubject = require 'zooniverse/models/subject'

_ = require 'underscore/underscore'

class Subject extends Spine.Model
  @configure 'Subject', 'preloaded', 'location', 'metadata', 'active', 'workflow_ids', 'project_id', 'workflow_ids'
  
  constructor: ->
    super
    @preloaded = false
    @active = true

  retire: =>
    @active = false
    @save()
    @trigger 'retire'

  randomPrevious: =>
  	_(@metadata.timings).shuffle()[0]

  @getMore: ->
    @fetch(5)

  @randomSubject: ->
    _(@activeSubjects()).shuffle()[0]
    
  @activeSubjects: ->
    @select (subject) ->
      subject.active

module.exports = Subject