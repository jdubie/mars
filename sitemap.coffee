debug = require('debug')('mars/sitemap')

# one
#
exports.index = (req, res) ->
  res.render('index')

# all
#
# @param {string} type
# @return {function}
exports.all = (req, res) ->
  res.render('all', req._json)
