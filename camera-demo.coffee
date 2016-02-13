if Meteor.isClient

  Template.hello.events
    'click button':  ->

      MeteorCamera.getPicture {}, (e,r)->
        if e?
          alert (e.message)
        else
          myColl.insert {time:new Date(),pic:r}
          # uploadCount = (Session.get 'mycount') or 0
          # uploadCount += 1
          # Session.set 'mycount', uploadCount


  Template.hello.helpers
    pictures: ->
       myColl.find({}, {sort:{time:-1}})
