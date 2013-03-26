_ = require 'underscore/underscore'

Classification = require 'zooniverse/models/classification'
Subject = require 'zooniverse/models/subject'
User = require 'zooniverse/models/user'

class Game extends Spine.Controller

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
					for time in previousGame.times
						@teamMateTimes.push {used: false, time: parseInt(time)}
					@otherPlayer = previousGame.name
				else
					@score = 200
			else
				console.log 'no subjects'

	compareTimes: (time1, closestValidTime) =>
		if Math.abs(time1 - closestValidTime.time)  < 1000
			closestValidTime.used = true
			points = 20
			@score += points
			@trigger 'score', {points: points, totalScore: @score, playerTime: time1, otherPlayerTime: closestValidTime.time}
		else if Math.abs(time1 - closestValidTime.time) < 2000
			closestValidTime.used = true
			points = 10
			@score += points
			@trigger 'score', {points: points, totalScore: @score}

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

	start: ->
		@status = 'playing'

	end: ->
		@status = 'finished'

module.exports = Game 