r = io.connect "http://localhost:8080/r"
r.on "update", (value) ->
  console.log value
  $('.r')
    .val value
    .trigger 'change'

$(document).ready ->
  $('.r').knob
    change: (value) ->
      r.emit 'update', value
