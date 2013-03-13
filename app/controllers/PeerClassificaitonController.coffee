Classification = require 'zooniverse/models/classification'
Subject = require 'zooniverse/models/subject'
User = require 'zooniverse/models/user'

Game = require 'models/Game'

class PeerClassificationController extends Spine.Controller
  className: 'peerClassifier'

  elements:
    '.left': 'left'
    '.right': 'right'
    'video': 'video'
    '.countdown': 'countdown'
    '.message': 'messageBox'
    '.score': 'scoreBox'
    '.player1 .times': 'p1Times'
    '.player2 .times': 'p2Times'

  events:
    'click .start': 'startCountDown'
    'click .finished': 'finish'

  constructor: ->
    super
    Game.bind 'score', @score
    User.bind 'sign-in', @renderStats

    $(document).keypress @markEvent

    Subject.on 'select', =>
      @classification = new Classification subject: Subject.current
      @game = new Game
      @render()

  render: =>
    @html require 'views/peerClassifier'
    @delay ->
      @renderVideo() unless $('video').length > 0
      @renderStats()
    , 200

  renderVideo: =>
    @left.html require('views/video')
      subject: Subject.current

    @refreshElements()

  renderStats: =>
    @right.html require('views/stats')
      player1: User.current
      player2: @game.otherPlayer
      gameStatus: @game.status
      score: @game.score
    @refreshElements()

  score: (data) =>
    @scoreBox.html "#{data.totalScore}"
    @p2Times.append("<p class='time'> <span>Match at :</span> #{data.otherPlayerTime} s </p>  ")
    @message("You matched with #{Game.otherPlayer} earn #{data.points}!")
    
  markEvent: (e) =>
    if e.keyCode is 32 and @game.status is 'playing'
      e.preventDefault()

      time = @game.markTime()
      @refreshElements()
      @p1Times.append( "<p class='time'> <span>Egg at :</span> #{time} s</p>  " )

  message: (text) =>
    message = $("<p>#{text}</p>")
    @messageBox.append message
    message.fadeOut(2000)

  startCountDown: =>
    @game.start()

    @renderStats()
    setTimeout =>
      @countdown.show()
      @countdown.html("3")
    , 1000

    setTimeout =>
      @countdown.html("2")
    , 2000

    setTimeout =>
      @countdown.html("1")
    , 3000

    setTimeout =>
      @countdown.html("GO")
    , 4000

    setTimeout =>
      @countdown.hide()
      @start()
    , 5000

  finalScoreMessage: =>
    if @game.otherPlayer?
      @messageBox.html("You marked #{@game.times} eggs and #{@game.otherPlayer.length} marked #{@game.teamMateTimes.length} eggs.")
    else
      @messageBox.html("You marked #{@game.times.length} eggs!")

  start: (e) =>
    e.preventDefault() if e?

    @game.setStartTime moment()

    @video[0].playbackRate = 1
    @video[0].play()

    @video.on 'ended', @onVideoEnd

  onVideoEnd: =>
    @finalScoreMessage()
    @refreshElements()

  finish: =>
    annotations = @game.getGameStatus()

    @classification.annotate annotations
    @classification.send()

    Subject.next()

module.exports = PeerClassificationController