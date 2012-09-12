#
# Port to listen on
#
port = 4545

module.exports.port = port

#
# CouchDB Configuration
#
nano = require('nano')
url  = require('url')

db = {}

# Db connection
switch process.env.ENV
  when 'PROD'
    protocol = 'http:'
    hostname = 'localhost'
    port = 5984
  when 'STAGE', 'TEST', 'DEV'
    protocol = 'http:'
    hostname = 'localhost'
    port = 5985
  else
    console.error 'You must specifiy and environment, Bro.'
    process.exit()

## export db convience function
db.main = () -> nano(url.format({protocol, hostname, port})).use('lifeswap')

## exports db configurations
module.exports.db = db
