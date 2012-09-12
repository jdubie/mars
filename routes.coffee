debug = require('debug')('mars/routes')

# one
#
exports.one = (req, res) ->
  res.render('one', req._json)

# all
#
# @param {string} type
# @return {function}
exports.all = (req, res) ->
  res.render('all', req._json)
