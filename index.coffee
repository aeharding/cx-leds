express = require 'express'
io = require('socket.io').listen 8080

app = express()

app.use express.static __dirname + '/server'

app.listen 80, ->
  console.log 'Listening on :80'

value = 0
r = io
  .of '/r'
  .on 'connection', (socket) ->
    socket.emit 'update', value
    socket.on 'update', (val) ->
      if not isNaN val and val >= 0 and val <= 255
        value = Math.floor val
        socket.broadcast.emit 'update', value