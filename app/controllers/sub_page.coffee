class SubPage extends Spine.Controller
  className: 'sub-page'
  template: require 'views/sub-page'

  constructor: ->
    super
    @html @template({content: @content})

module.exports = SubPage