_ = require 'underscore/underscore'

EventEmitter = require 'zooniverse/lib/event-emitter'

Classification = require 'zooniverse/models/classification'
Subject = require 'zooniverse/models/subject'
User = require 'zooniverse/models/user'

EXACT_SCORE = 20
EXACT_DISTANCE = 1 # in seconds

CLOSE_SCORE = 10
CLOSE_DISTANCE = 2 # in seconds

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
    @firstSpotter = false

    if Subject.current.classification_count > 0 and Subject.current.metadata.timings?
      previousGame = _(Subject.current.metadata.timings).shuffle()[0]
      
      unless previousGame.name is 'Anonymous'
        for time in previousGame.times
          @teamMateTimes.push { used: false, time: parseInt time }
        @otherPlayer = previousGame.name

    else if Subject.current.classification_count is 0
      @score = FIRST_SCORE
      @firstSpotter = true

    @trigger 'new'

  compareTimes: (yourTime, otherPlayTime) =>
    points = false

    if Math.abs(yourTime - otherPlayTime.time) < EXACT_DISTANCE
      points = EXACT_SCORE
    else if Math.abs(yourTime - otherPlayTime.time) < CLOSE_DISTANCE
      points = CLOSE_SCORE

    return points

  markTime: =>
    markedTime = @video.currentTime()
    
    @times.unshift markedTime

    closestValidTime = _.chain(@teamMateTimes)
      .sortBy((timeObj) -> Math.abs(timeObj.time - markedTime))
      .reject((timeObj) -> timeObj.used)
      .first()
      .value()

    if closestValidTime
      points = @compareTimes markedTime, closestValidTime

      if points
        closestValidTime.used = true
        @score += points
        @trigger 'score', points
        @trigger 'status'

    @trigger 'mark'

  removeTime: (i) =>
    removedTime = @times.splice i, 1
    @refreshScore()
    @trigger 'remove-mark', removedTime

  refreshScore: =>
    unless @otherPlayer then return

    score = 0

    timeObj.used = false for timeObj in @teamMateTimes

    for time in @times

      closestValidTime = _.chain(@teamMateTimes)
        .sortBy((timeObj) -> Math.abs(timeObj.time - time))
        .reject((timeObj) -> timeObj.used)
        .first()
        .value()

      if closestValidTime

        points = @compareTimes time, closestValidTime

        if points
          closestValidTime.used = true
          score += points

    @score = score
    @trigger 'status'

  getGameStatus: =>
    timings: @times
    score: @score

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