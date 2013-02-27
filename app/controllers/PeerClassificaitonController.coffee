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
    '.player1 .times'     : 'p1Times'
    '.player2 .times'     : 'p2Times'
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
    @scoreBox.html "#{data.totalScore}"
    @p2Times.append("<p class='time'> <span>Match at :</span> #{data.otherPlayerTime} s </p>  ")
    @message("You matched with #{Game.otherPlayer} earn #{data.points}!")
    

  markEvent:(e)=>
    if e.keyCode == 32 and Game.status=='playing'
      e.preventDefault()

      time = Game.markTime( moment() )
      @refreshElements()
      @p1Times.append( "<p class='time'> <span>Egg at :</span> #{time} s</p>  " )


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
    @finalScoreMessage()
    Game.saveClassification()

  finalScoreMessage:=>
    if Game.otherPlayer?
      @messageBox.html("You marked #{Game.times} eggs and #{Game.otherPlayer.length} marked #{Game.teamMateTimes.length} eggs.")
    else
      @messageBox.html("You marked #{Game.times.length} eggs. Click finish to see another video!")  

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
      score       : Game.score
      

    @refreshElements()


module.exports = PeerClassificationController