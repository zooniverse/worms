Spine = require 'spine'
translate = require 't7e'
Subject = require 'zooniverse/models/subject'

DEFAULT_MUTATION = 'notAvailable'

class Details extends Spine.Controller
  className: 'section subject-info'
  template: require '../../views/classifier/details'

  constructor: ->
    super

    @html @template()

    Subject.on 'select', @render

  render: =>
    if Subject.current.metadata.mutation of (translate.strings).mutations then mutation = Subject.current.metadata.mutation
    mutation ?= DEFAULT_MUTATION

    @html @template
      mutation: mutation

module.exports = Details