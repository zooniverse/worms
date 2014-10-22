Spine = require 'spine'

Dialog = require 'zooniverse/controllers/dialog'
Subject = require 'zooniverse/models/subject'
User = require 'zooniverse/models/user'

Game = require '../../lib/game'

class ActionsRight extends Spine.Controller
  className: 'section actions'
  template: require '../../views/classifier/actions-right'

  events:
    'click .favorite': 'onFavorite'
    'click .discuss': 'onDiscuss'
    'click .help': 'onHelp'
    'click .next': 'onRequestNext'
    'click .guide': 'onGuide'


  constructor: ->
    super

    @helpDialog = new Dialog
      className: 'zooniverse-dialog help-dialog'
      content: require '../../views/classifier/help'

    @html @template()

    User.on 'change', @render
    Game.on 'new end', @render

  render: =>
    @html @template
      user: User.current
      game: Game.current

  onFavorite: (e) =>
    return if $(e.currentTarget).hasClass 'disabled'

    $(e.currentTarget).addClass 'disabled'

    Spine.trigger 'make-favorite'

  onDiscuss: (e) =>
    return if $(e.currentTarget).hasClass 'disabled'

    window.open Subject.current.talkHref()

  onHelp: (e) =>
    Spine.trigger 'click-tutorial'

  onRequestNext: (e) =>
    return if $(e.currentTarget).hasClass 'disabled'

    Spine.trigger 'finished-classification'

  onGuide: =>
    Spine.trigger 'show-guide'

module.exports = ActionsRight