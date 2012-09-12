{spawn} = require('child_process')

task 'run', 'Starts node server', ->
  process.env.DEBUG = 'mars*'
  process.env.NODE_PATH = __dirname
  require('./app')
