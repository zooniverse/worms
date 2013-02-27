Spine   = require('spine')
User    = require('zooniverse/lib/models/user')
Game    = require('models/Game')
Subject = require('models/Subject')

class PeerClassificationController extends Spine.Controller
  className: 'peerClassifier'
  elements:
    '.left'      : 'left'
    '.right'     : 'right'
    'video'      : 'video'
    '.countdown' : 'countdown'
    '.message'   : 'messageBox'
    '.score'     : 'scoreBox'
    '.times'     : 'times'

  events:
    'click .button' : "startGame"


  constructor:->
    super 
    @render()
    User.bind('sign-in', @renderStats)
    
    # Game.bind('playerJoined', =>  @renderStats();  @message("Player Joined"))
    Spine.bind('gameSetup', @render)
    Spine.bind('gameStarted', @startCountDown)
    Spine.bind('score', @score)

    $(document).keypress @markEvent

  startGame:=>
    Game.startGame()

  render:=> 
    @html require('views/peerClassifier')
    @delay ->
      @renderVideo() unless $('video').length > 0
      @renderStats()
    ,200

  score:(data)=>
    @scoreBox.html "Score: #{data.totalScore}"
    @message("+ #{data.points} #{data.message}")
   

  markEvent:(e)=>
    if e.keyCode == 32
      e.preventDefault()

      time = Game.markTime( moment() )
      @refreshElements()
      @times.append( "<p class='time'> #{time}, </p> " )


  message:(text)=>
    message = $("<p> #{text}</p>")
    @messageBox.append message
    message.fadeOut(2000)

  startCountDown:=>
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
      @startVideo()
    , 5000


  saveClassification:=>
    Game.saveClassification()

  startVideo:(e)=>

    Game.setStartTime moment()
    e.preventDefault() if e?
    @video[0].playbackRate = 1000
    @video[0].play()
    @video.on "ended", @saveClassification

  renderVideo :=>
    @left.html require('views/video')
      subject : Game.currentSubject

    @refreshElements()

  renderStats: =>
    @right.html require('views/stats')
      player1     : User.current
      player2     : Game.otherPlayer
      gameStatus  : Game.status
      

    @refreshElements()


module.exports = PeerClassificationController