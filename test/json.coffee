json = require('../json')

describe 'json', () ->
  describe '#getTypeFromUrl', () ->
    it 'should work', () ->
      json.getTypeFromUrl('/users/1').should.eql 'user'
