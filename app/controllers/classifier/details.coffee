Subject = require 'zooniverse/models/subject'
User = require 'zooniverse/models/user'

class Details extends Spine.Controller
  className: 'subject-info'
  tag: 'section'
  template: require 'views/classifier/details'

  mutations: require 'lib/mutations'

  constructor: ->
    super
    
    @html @template()

    Subject.on 'select', =>
      @render()

  render: =>
    if Subject.current?.metadata.mutation and @mutations[Subject.current.metadata.mutation]?
      mutation = @mutations[Subject.current.metadata.mutation]
    else
      mutation = null

    @html @template
      mutation: mutation

module.exports = Details