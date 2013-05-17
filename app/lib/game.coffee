_ = require 'underscore/underscore'

EventEmitter = require 'zooniverse/lib/event-emitter'

Classification = require 'zooniverse/models/classification'
Subject = require 'zooniverse/models/subject'
User = require 'zooniverse/models/user'

class Game extends EventEmitter

  @current: null

  status: 'waiting'
  times: []
  teamMateTimes: []
  score: 0

  constructor: ->
    @constructor.current = @

    unless @currentSubject?
      @currentSubject = Subject.current

      if @currentSubject?
        previousGame = _(@currentSubject.metadata.timings).shuffle()[0]

        if previousGame?
          for time in previousGame.times
            @teamMateTimes.push {used: false, time: parseInt time}
          @otherPlayer = previousGame.name

        else
          @score = 200

      else
        console.log 'no subjects'

    @trigger 'new'

  compareTimes: (time1, closestValidTime) =>
    points = false

    if Math.abs(time1 - closestValidTime.time)  < 1000
      points = 20
    else if Math.abs(time1 - closestValidTime.time) < 2000
      points = 10

    if points
      closestValidTime.used = true
      @score += points
      @trigger 'score', points
      @trigger 'status'


  setStartTime: =>
    @startTime = moment()

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
    time.diff @startTime, 'seconds', true

  getGameStatus: => [{timings: @times} , {score: @score}]

  start: =>
    @status = 'playing'
    @setStartTime()
    @trigger 'start'

  end: =>
    @status = 'finished'
    @trigger 'end'

module.exports = Game