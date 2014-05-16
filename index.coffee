express = require 'express'

app = express()

app.use express.static __dirname + '/server'

app.listen 80, ->
  console.log 'Listening on :80'