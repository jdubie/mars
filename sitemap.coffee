debug = require('debug')('mars/sitemap')

# index
#
exports.index = (req, res) ->
  res.render('sitemap_index')

# about
#
exports.static = (req, res) ->
  res.render('sitemap_static')

# swaps
#
exports.swaps = (req, res) ->
  res.render('sitemap_swaps', req._json)

exports.users = (req, res) ->
  res.render('sitemap_users', req._json)

# all
#
# @param {string} type
# @return {function}
exports.all = (req, res) ->
  res.render('all', req._json)
