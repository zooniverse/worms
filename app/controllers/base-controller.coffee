class BaseController extends Spine.Controller

  constructor: ->
    super
    @body = $('body')

  activate: ->
    super
    @body.addClass @className

  deactivate: ->
    super
    @body.removeClass @className

module.exports = BaseController