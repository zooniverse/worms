Subject = require 'zooniverse/models/subject'

createTutorialSubject = ->
  new Subject
    id: '5154c8b8ea30527e1d003a93'
    zooniverse_id: 'TUTORIAL_SUBJECT'

    location: mp4: './tutorial/subject/5154c8b8ea30527e1d003a93.mp4'

    metadata:
      tutorial: true
      file_name: 'TUTORIAL_SUBJECT'

    workflow_ids: ['TODO']

module.exports = createTutorialSubject