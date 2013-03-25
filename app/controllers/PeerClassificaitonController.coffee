Classification = require 'zooniverse/models/classification'
Favorite = require 'zooniverse/models/favorite'
Subject = require 'zooniverse/models/subject'
User = require 'zooniverse/models/user'
loginDialog = require 'zooniverse/controllers/login-dialog'

Game = require 'models/Game'

class PeerClassificationController extends Spine.Controller
  className: 'classifier'

  elements:
    '.left': 'left'
    '.right': 'right'
    '.overlay': 'videoOverlay'
    '.countdown': 'countdown'
    '.message': 'messageBox'
    '.score': 'scoreBox'
    '.player1 .times': 'p1Times'
    '.player2 .times': 'p2Times'

  events:
    'click .bubble': 'onStartCountDown'
    'click .countdown': 'onStartCountDown'
    'click .finished': 'onFinish'
    'click .favorite': 'onFavorite'
    'click .discuss': 'onDiscuss'
    'click .sign-in': 'onClickSignIn'

  constructor: ->
    super
    Game.bind 'score', @score

    $(document).keypress @markEvent

    User.on 'change', @renderStats
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
      
    @video = _V_ 'worm-video', {}
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
    # @p2Times.append("<p class='time'> <span>Match at :</span> #{data.otherPlayerTime} s </p>  ")
    # @message("You matched with #{Game.otherPlayer} earn #{data.points}!")

  markEvent: (e) =>
    if e.which is 32
      e.preventDefault()

    if @game.status is 'playing'
      time = @game.markTime()
      @refreshElements()
      @p1Times.prepend( "<p class='time'> <span>Egg at :</span> #{time} s</p>  " )

  message: (text) =>
    message = $("<p>#{text}</p>")
    @messageBox.append message
    message.fadeOut(2000)

  start: =>
    @game.setStartTime moment()

    @video.play()
    @video.addEvent 'ended', @onVideoEnd


  # Events
  onStartCountDown: =>
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
      @countdown.remove()
      @start()
    , 5000

  onVideoEnd: =>
    @game.end()
    if @game.otherPlayer?
      message = "You marked #{@game.times} eggs and #{@game.otherPlayer.length} marked #{@game.teamMateTimes.length} eggs."
    else
      if @game.times.length is 1
        message = "You marked 1 egg!"
      else
        message = "You marked #{@game.times.length} eggs!"

    @messageBox.html message
    @videoOverlay.fadeIn()

    @refreshElements()

  onFinish: =>
    annotations = @game.getGameStatus()

    @classification.annotate annotations
    @classification.send()

    Subject.next()

  onFavorite: (e) =>
    $(e.currentTarget).addClass 'disabled'
    @favorite = new Favorite({subjects: [Subject.current]})
    @favorite.send()

  onDiscuss: =>
    window.location = Subject.current.talkHref()

  onClickSignIn: =>
    loginDialog.show()

module.exports = PeerClassificationController