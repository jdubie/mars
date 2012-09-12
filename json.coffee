config = require('./config')
debug = require('debug')('mars/json')

db = config.db.main()

# one
#
exports.one = (req, res) ->
  db.get(req.params.id).pipe(res)

# all
#
# @param {string} type
# @return {function}
exports.all = (type) ->
  type = type[0...type.length-1]
  debug 'type', type
  (req, res) ->
    db.view('lifeswap', 'docs_by_type', key: type, include_docs: true).pipe(res)
