{spawn} = require('child_process')

task 'run', 'Starts node server', ->
  process.env.DEBUG = 'mars*'
  process.env.NODE_PATH = __dirname
  require('./app')

task 'test', 'Run unit tests', ->
  test = spawn 'mocha', [
    '--timeout', 5000,
    '--compilers', 'coffee:coffee-script',
    '--reporter', 'list',
    '--require', 'should',
  ]
  test.stderr.pipe(process.stderr)
  test.stdout.pipe(process.stdout)
  #./node_modules/.bin/mocha \
