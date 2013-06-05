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

  status: 'waiting'
  times: []
  teamMateTimes: []
  score: 0

  constructor: ->
    @constructor.current = @

    @currentSubject = Subject.current
    previousGame = _(@currentSubject.metadata.timings).shuffle()[0]

    if previousGame?
      for time in previousGame.times
        @teamMateTimes.push {used: false, time: parseInt time}
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
    time = moment()
    diff = (time.diff(@startTime))
    @times.push diff

    closestValidTime = _.chain(@teamMateTimes)
      .sortBy((timeObj) -> Math.abs(timeObj.time - diff))
      .reject((timeObj) -> timeObj.used)
      .first()
      .value()

    if closestValidTime then @compareTimes diff, closestValidTime
    time = time.diff @startTime, 'seconds', true

    @trigger 'mark', time

  getGameStatus: =>
    timings: @times
    score: @score

  start: =>
    @startTime = moment()
    
    @status = 'playing'
    @trigger 'start'

  end: =>
    @status = 'finished'
    @trigger 'end'

module.exports = Game