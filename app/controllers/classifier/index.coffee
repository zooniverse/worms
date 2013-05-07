Classification = require 'zooniverse/models/classification'
Subject = require 'zooniverse/models/subject'

Game = require 'lib/game'

BaseController = require 'controllers/base-controller'

Actions = require 'controllers/classifier/actions'
Announcer = require 'controllers/classifier/announcer'
Details = require 'controllers/classifier/details'
Stats = require 'controllers/classifier/stats'
Video = require 'controllers/classifier/video'

class Classifier extends BaseController
  className: 'classifier'

  elements:
    '.left': 'left'
    '.right': 'right'

  template: require 'views/classifier'

  constructor: ->
    super
    @html @template()
    $(document).keypress @markEvent

    # Build pieces
    @details = new Details
    @details.el.appendTo @right

    @announcer = new Announcer
    @announcer.el.appendTo @right

    @stats = new Stats
    @stats.el.appendTo @right

    @video = new Video
    @video.el.appendTo @left

    @actions = new Actions
    @actions.el.appendTo @right

    # User.on 'change', @renderStats
    Subject.on 'select', =>
      @classification = new Classification subject: Subject.current
      new Game

    Spine.on 'finished-classification', @finish
    Game.on 'end', @onGameEnd

  markEvent: (e) =>
    @stats.markEvent e

  start: =>
    Game.current.setStartTime moment()

  finish: =>
    annotations = Game.current.getGameStatus()

    @classification.annotate annotations
    @classification.send()

    Subject.next()


  # Events
  onGameEnd: =>
    if Game.current.otherPlayer?
      message = "You marked #{Game.current.times.length} eggs and #{Game.current.otherPlayer} marked #{Game.current.teamMateTimes.length} eggs."
    else
      if Game.current.times.length is 1
        message = "You marked 1 egg!"
      else
        message = "You marked #{Game.current.times.length} eggs!"

    @announcer.announce message


module.exports = Classifier