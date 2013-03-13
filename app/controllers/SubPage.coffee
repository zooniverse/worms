class SubPage extends Spine.Controller
  template: require 'views/sub-page'

  constructor: ->
    super
    @html @template({content: @content})

module.exports = SubPage