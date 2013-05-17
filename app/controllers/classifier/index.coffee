Classification = require 'zooniverse/models/classification'
Subject = require 'zooniverse/models/subject'
User = require 'zooniverse/models/user'

Game = require 'lib/game'

BaseController = require 'controllers/base-controller'

Actions = require 'controllers/classifier/actions'
Announcer = require 'controllers/classifier/announcer'
Details = require 'controllers/classifier/details'
Stats = require 'controllers/classifier/stats'
Video = require 'controllers/classifier/video'

{Tutorial, Dialog, Step} = require 'zootorial'

TutorialSteps = require 'lib/tutorial/steps'
createTutorialSubject = require('lib/tutorial/subject')

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

    @tutorial = new Tutorial
      firstStep: 'welcome'
      steps: TutorialSteps
      parent: $('body')

    @tutorial.video = @video

    User.on 'change', @onUserChange
    Subject.on 'select', @onSubjectSelect

    Spine.on 'finished-classification', @finish
    Game.on 'end', @onGameEnd

  onUserChange: (e, user) =>
    fakeSubject = new Subject (require 'lib/fake_subject')
    fakeSubject.select()
    # if user?.project.tutorial_done
    #   if Subject.current.metadata.tutorial
    #     @tutorial.end()
    #     Subject.next()

    # else
    #   tutorialSubject = createTutorialSubject()
    #   tutorialSubject.select()

  onSubjectSelect: (e, subject) =>
    @classification = new Classification {subject}
    new Game

  activate: =>
    super

    if Subject.current?.metadata.tutorial then @tutorial.start()

  deactivate: =>
    super
    @tutorial?.end()

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
      message = "You marked #{Game.current.times.length} #{ (Game.current.times.length is 1) ? 'egg' : 'eggs' } and #{Game.current.otherPlayer} marked #{Game.current.teamMateTimes.length} eggs."
    else
      if Game.current.times.length is 1
        message = "You marked 1 egg!"
      else
        message = "You marked #{Game.current.times.length} eggs!"

    @announcer.announce message


module.exports = Classifier