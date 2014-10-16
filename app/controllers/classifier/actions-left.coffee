Spine = require 'spine'

Dialog = require 'zooniverse/controllers/dialog'

class ActionsLeft extends Spine.Controller
  className: 'section actions'
  template: require '../../views/classifier/actions-left'

  events:
    'click .tutorial': 'onClickTutorial'
    'click .site-intro': 'onClickSiteIntro'

  constructor: ->
    super

    @html @template()

  onClickTutorial: (e) =>
    Spine.trigger 'click-tutorial'

  onClickSiteIntro: (e) =>
    Spine.trigger 'click-site-intro'

module.exports = ActionsLeft