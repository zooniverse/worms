Subject = require 'zooniverse/models/subject'

createTutorialSubject = ->
  new Subject
    zooniverse_id: 'TUTORIAL_SUBJECT'

    location: mp4: './offline/subjects/nlp-14__tm1880_X_on_food_L_2010_03_18__13_12___3___10_seg-11.mp4'

    coords: [0, 0]

    metadata:
      tutorial: true
      file_name: 'TUTORIAL_SUBJECT'

    workflow_ids: ['TODO']

module.exports = createTutorialSubject