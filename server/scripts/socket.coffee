colorIO = io.connect "http://#{window.location.hostname}:8080/color"

updateComponent = (io, component) ->
  io.on component, (value) ->
    colors[component] = value
    $(".#{component}")
      .val colors[component]
      .trigger 'change'
    $('body').css
      'background-color': "rgb(#{colors.r}, #{colors.g}, #{colors.b})"

updateComponent colorIO, 'r'
updateComponent colorIO, 'g'
updateComponent colorIO, 'b'

colors =
  r: 0
  g: 0
  b: 0

$(document).ready ->
  $('.r').knob
    bgColor: 'rgba(255, 255, 255, 0.5)'
    change: (value) ->
      colors.r = value
      colorIO.emit 'r', value
      $('body').css
        'background-color': "rgb(#{colors.r}, #{colors.g}, #{colors.b})"
  $('.g').knob
    bgColor: 'rgba(255, 255, 255, 0.5)'
    change: (value) ->
      colors.g = value
      colorIO.emit 'g', value
      $('body').css
        'background-color': "rgb(#{colors.r}, #{colors.g}, #{colors.b})"
  $('.b').knob
    bgColor: 'rgba(255, 255, 255, 0.5)'
    change: (value) ->
      colors.b = value
      colorIO.emit 'b', value
      $('body').css
        'background-color': "rgb(#{colors.r}, #{colors.g}, #{colors.b})"
