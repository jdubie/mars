express = require('express')
config  = require('./config')
routes  = require('./routes')

#
# Config server
#
app = express()
engines = require('consolidate')
app.engine('eco', engines.eco)
app.set('view engine', 'eco')
app.set('views', __dirname + '/views')

#
# JSON API
#
app.get('/swaps', routes.all('swaps'))
app.get('/users', routes.all('users'))
app.get('/swaps/:id', routes.one)
app.get('/users/:id', routes.one)

#
# Start server
#
app.listen(config.port)
