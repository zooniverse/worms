Spine = require 'spine'

Game = require '../../lib/game'

class ActionsLeft extends Spine.Controller
  className: 'section actions'
  template: require '../../views/classifier/actions-left'

  events:
    'click .site-intro': 'onClickSiteIntro'
    'click .egg-laying': 'onClickEggLaying'

  constructor: ->
    super

    @html @template()

  onClickSiteIntro: (e) =>
    Spine.trigger 'click-site-intro'

  onClickEggLaying: =>
    if Game.current.status is 'playing' then Game.current.markTime()

module.exports = ActionsLeft