_ = require 'underscore/underscore'

EventEmitter = require 'zooniverse/lib/event-emitter'

Classification = require 'zooniverse/models/classification'
Subject = require 'zooniverse/models/subject'
User = require 'zooniverse/models/user'

EXACT_SCORE = 20
EXACT_DISTANCE = 1000

CLOSE_SCORE = 10
CLOSE_DISTANCE = 2000

FIRST_SCORE = 200

class Game extends EventEmitter

  @current: null

  constructor: ->
    @constructor.current = @

    @buffer = false
    @status = 'waiting'
    @times = []
    @teamMateTimes = []
    @score = 0
    @clock = 0

    @currentSubject = Subject.current
    previousGame = _(@currentSubject.metadata.timings).shuffle()[0]

    if previousGame?
      for time in previousGame.times
        @teamMateTimes.push { used: false, time: parseInt time }
      @otherPlayer = previousGame.name

    else
      @score = FIRST_SCORE

    @trigger 'new'

  compareTimes: (time1, closestValidTime) =>
    points = false

    if Math.abs(time1 - closestValidTime.time)  < EXACT_DISTANCE
      points = EXACT_SCORE
    else if Math.abs(time1 - closestValidTime.time) < CLOSE_DISTANCE
      points = CLOSE_SCORE

    if points
      closestValidTime.used = true
      @score += points
      @trigger 'score', points
      @trigger 'status'

  markTime: =>
    markedTime = @video.currentTime()
    
    @times.unshift markedTime

    closestValidTime = _.chain(@teamMateTimes)
      .sortBy((timeObj) -> Math.abs(timeObj.time - markedTime))
      .reject((timeObj) -> timeObj.used)
      .first()
      .value()

    if closestValidTime then @compareTimes markedTime, closestValidTime

    @trigger 'mark'

  removeTime: (i) =>
    @times.splice i, 1

    @trigger 'remove-mark'

  getGameStatus: =>
    timings: @times
    score: @score

  warmUp: (@video) =>
    @status = 'starting'
    @trigger 'warmup'

  start: =>
    @status = 'playing'
    @trigger 'start'

  end: =>
    setTimeout =>
      @buffer = true
    , 1000

    @status = 'finished'
    @trigger 'end'

  pastBuffer: => @buffer

module.exports = Game