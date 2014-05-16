express = require 'express'
io = require('socket.io').listen 8080

app = express()

app.use express.static __dirname + '/server'

app.listen 80, ->
  console.log 'Listening on :80'

colors = 
  r: 0
  g: 0
  b: 0

io
  .of '/color'
  .on 'connection', (socket) ->
    watchForChanges socket, 'r'
    watchForChanges socket, 'g'
    watchForChanges socket, 'b'


watchForChanges = (socket, component) ->
  socket.emit component, colors[component]
  socket.on component, (val) ->
    if not isNaN val and val >= 0 and val <= 255
      colors[component] = Math.floor val
      socket.broadcast.emit component, colors[component]