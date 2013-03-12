User  = require 'zooniverse/models/user'

Classification = require 'models/Classification'
Subject = require 'models/Subject'

class Game

		# @socket = io.connect "http://worms.zooniverse.org"
		# window.scocketConnection = @socket
		
		
		# @socket.on 'playerJoined', (player) =>
		# 	console.log "player joined ",player
		# 	@otherPlayer = player
		# 	@trigger 'playerJoined', (player)
		# 	@save()

		# @socket.on 'start', =>
		# 	@status = 'playing'
		# 	@trigger 'gameStarted'
		# 	@save()

		# @socket.on 'teamMateTime', (data)=>
		# 	console.log "teammate" , data
		# 	@teamMateTimes.push data.time
		# 	@compareTimes(time, data.time) for time in @times  
	
	@setupGame:->
		@status ||= 'waiting'

		unless @currentSubject?
		
			@times  = []
			@teamMateTimes = []
			@score  =  0
			@currentSubject = Subject.randomSubject()
			console.log "current subject is #{@currentSubject}"
			if @currentSubject?
				previousGame = @currentSubject.randomPrevious()
				if previousGame?
					@teamMateTimes = previousGame.times
					@otherPlayer   = previousGame.name
				else
					@score = 200
			else
				alert('out of subjects')
			Spine.trigger("gameSetup")

	@startGame:=>
		@setStartTime()
		@status = 'playing'
		Spine.trigger('gameStarted')

	@compareTimes: (time1, time2)=>
		if Math.abs(time1 - time2)  < 1000
			points = 20
			@score += points 
			Spine.trigger('score', {points: points, totalScore: @score, message: 'great!', playerTime: time1, otherPlayerTime: time2}) 
			console.log "scoring high"

		else if Math.abs(time1 - time2)  < 2000
			points = 10
			@score += points 
			Spine.trigger('score', {points: points, totalScore: @score, message: 'good'})
			console.log "scoring low"

	@setStartTime:(time)=>
		@startTime= time

	@saveClassification:=>
		c = new Classification
			subject_id : @currentSubject.id
			workflow_id: @currentSubject.workflow_ids[0]
			annotations : [{timings: @times} , {score: @score}]
		console.log "new classifcation ", c
		c.save()
		c.send()
		
	@markTime:(time)=>
		diff = ( time.diff(@startTime))
		# @socket.emit 'timeMarked', ({user_id: User.current.id, time: diff})	 
		@times.push diff 
		@compareTimes(diff, timeO) for timeO in @teamMateTimes
		time.diff(@startTime, 'seconds', true)

	@requestJoin:->
		if User.current?
			@socket.emit 'joinGame', {id : User.current.id, name: User.current.name}
		else 
			console.log "could not find user"

module.exports = Game 