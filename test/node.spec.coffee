{Node} = require '../src/node'

describe 'Node', ->

    it 'should tests instance label', ->
      node = new Node 'circle'
      node.label.should.equal 'circle'


