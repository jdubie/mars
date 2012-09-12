config = require('./config')
debug = require('debug')('mars/routes')

db = config.db.main()

# one
#
exports.one = (req, res) ->
  db.get req.params.id, (err, body, headers) ->
    res.render('one', body)

# all
#
# @param {string} type
# @return {function}
exports.all = (url) ->
  type = singularize(url)

  (req, res) ->
    callback = (err, body, headers) ->
      return res.send(404, 'Error') if err
      debug 'body.rows', body.rows
      res.render('all', rows: body.rows, type: type)

    db.view('lifeswap', 'docs_by_type', key: type, include_docs: true, callback)


singularize = (plural) ->
  plural[0...plural.length-1]
