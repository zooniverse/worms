_ = require 'underscore/underscore'

Classification = require 'zooniverse/models/classification'
Subject = require 'zooniverse/models/subject'
User = require 'zooniverse/models/user'

class Game extends Spine.Events

	constructor: ->
		@status ||= 'waiting'

		unless @currentSubject?
			@times = []
			@teamMateTimes = []
			@score =  0
			@currentSubject = Subject.current

			if @currentSubject?
				previousGame = _(@currentSubject.metadata.timings).shuffle()[0]
				if previousGame?
					@teamMateTimes = previousGame.times
					@otherPlayer   = previousGame.name
				else
					@score = 200
			else
				console.log 'no subjects'

	compareTimes: (time1, time2) =>
		if Math.abs(time1 - time2)  < 1000
			points = 20
			@score += points 
			Spine.trigger('score', {points: points, totalScore: @score, message: 'great!', playerTime: time1, otherPlayerTime: time2}) 
			console.log "scoring high"

		else if Math.abs(time1 - time2)  < 2000
			points = 10
			@score += points 
			@trigger('score', {points: points, totalScore: @score, message: 'good'})
			console.log "scoring low"

	setStartTime: =>
		@startTime = moment()
		
	markTime: =>
		time = moment()
		diff = (time.diff(@startTime))
		@times.push diff 
		@compareTimes(diff, timeO) for timeO in @teamMateTimes
		time.diff(@startTime, 'seconds', true)

	getGameStatus: => [{timings: @times} , {score: @score}]

	start: ->
		@status = 'playing'

module.exports = Game 