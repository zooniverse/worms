Subject = require 'zooniverse/models/subject'

createTutorialSubject = ->
  new Subject
    id: '519a3eb2447b5e2c3d000018'
    location: mp4: './tutorial/subject/519a3eb2447b5e2c3d000018.mp4'

    metadata:
      tutorial: true

module.exports = createTutorialSubject