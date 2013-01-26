{Node} = require '../src/node'
{Edge} = require '../src/edge'

describe 'Edge', ->

   it 'should tests instance label', ->
      first_node  = new Node 'First Node'
      second_node = new Node 'Second Node'

      edge = new Edge first_node, second_node

      edge.from.should.equal first_node
      edge.to.should.equal second_node
