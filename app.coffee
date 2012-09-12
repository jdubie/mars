console.error process.env.NODE_PATH

express = require('express')
config = require('./config')
json = require('./json')

#
# Create server
#
app = express()

#
# JSON API
#
app.get('/swaps', json.all('swaps'))
app.get('/users', json.all('users'))
app.get('/swaps/:id', json.one)
app.get('/users/:id', json.one)

#
# Start server
#
app.listen(config.port)
