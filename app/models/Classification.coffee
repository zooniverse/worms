Spine = require 'spine'
Api = require 'zooniverse/lib/api'
Subject = require 'models/Subject'
User = require 'zooniverse/lib/models/user'

class Classification extends Spine.Model
  @configure 'Classification', 'subject_id', 'annotations', 'workflow_id'
  
  constructor: ->
    super
    @annotations ||= []

  
  subject: ->
    Subject.find @subject_id
  
  annotate: (questionId, answerId) ->
    annotation = {}
    annotation[questionId] = answerId
    @annotations.push annotation
    @save()

  url: ->
    "/projects/worms/workflows/#{@workflow_id}/classifications"
  
  toJSON: ->
    json =
      classification:
        subject_ids: [@subject_id]
        favorite: false

    
    json.classification = $.extend json.classification, super
    json
  
  send: ->
    if User.current?
      User.current.project ||= {}
      User.current.project.classification_count ||= 0 
      User.current.project.classification_count = User.current.project.classification_count + 1
      User.current.save()
      User.current.trigger("updateProfile")

    Classification.trigger 'classified'
    Api.post @url(), @toJSON()

module.exports = Classification