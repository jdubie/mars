express = require('express')
config  = require('./config')
routes  = require('./routes')
json    = require('./json')
sitemap = require('./sitemap')

#
# Config server
#
app = express()
engines = require('consolidate')
app.engine('eco', engines.eco)
app.set('view engine', 'eco')
app.set('views', __dirname + '/views')

#
# Sitemaps
#
app.get('/sitemap.xml', sitemap.index)
app.get('/sitemap_about.xml', sitemap.about)
app.get('/swaps/sitemap.xml', json.all, sitemap.swaps)
app.get('/users/sitemap.xml', json.all, sitemap.users)

#
# Routes
#
app.get('/', routes.root)
app.get('/swaps', json.all, routes.all)
app.get('/users', json.all, routes.all)
app.get('/swaps/:id', json.one, routes.one)
app.get('/users/:id', json.one, routes.one)

#
# Start server
#
app.listen(config.port)
