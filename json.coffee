debug = require('debug')('mars/json')
path = require('path')
config = require('./config')

db = config.db.main()

nanoCallback = (req, next) ->
  errorRes = null
  (err, body) ->
    if err?
      debug '#nanoCallback: err', err
      errorRes =
        statusCode: err.status_code ? 500
        error: err.error
        reason: err.reason
    else
      req._json = body

    next(errorRes)

# one
#
exports.one = (req, res, next) ->
  db.get(req.params.id, nanoCallback(req, next))

# all
#
# @param {string} type
# @return {function}
exports.all = (req, res, next) ->
  type = getTypeFromUrl(req.url)
  opts = key: type, include_docs: true
  db.view('lifeswap', 'docs_by_type', opts, nanoCallback(req, next))

# url
#
# @param url {string}
# @return {string} type of doc for url
#
getTypeFromUrl = (url) ->
  plural = url.split('/')[1]
  plural[0...plural.length-1]


# TODO: only if testing
# if config.test
exports.getTypeFromUrl = getTypeFromUrl
