BaseController = require 'controllers/base-controller'

class SubPage extends BaseController
  className: 'sub-page'
  template: require 'views/sub-page'

  constructor: ->
    super
    @html @template({content: @content})

module.exports = SubPage