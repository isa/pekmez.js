sinon = require 'sinon'
domino = require 'domino'

{Pekmez} = require '../src/pekmez'

describe 'Pekmez', ->

   # before ->
   #    document = sinon.spy()
   #    document.

   it 'should get contents of all the script blocks when language is pekmez', ->
      document = domino.createWindow('<script type="text/pekmez"></script>').document

      pekmez = new Pekmez
      actual = pekmez.all document

      actual.length.should.equal 1

   it 'should not get any of the script blocks when language is not pekmez', ->
      document = domino.createWindow('<script type="text/javascript"></script>').document

      pekmez = new Pekmez
      actual = pekmez.all document

      actual.length.should.equal 0

   it 'should identify the script type and the content', ->
      expected_type = 'network'
      expected_content = 'A -> B'
      document = domino.createWindow("<script type='text/pekmez' data-type='#{expected_type}'>#{expected_content}</script>").document

      pekmez = new Pekmez
      [actual, rest...] = pekmez.all document

      actual.type.should.equal expected_type
      actual.content.should.equal expected_content

   it 'should find dom elements by tag', ->
      document = domino.createWindow('<p></p>').document

      pekmez = new Pekmez
      actual = pekmez.$ 'p', document

      actual.length.should.equal 1

   it 'should find the dom element by id', ->
      locator = 'identifier'
      document = domino.createWindow("<p id='#{locator}'></p>").document

      pekmez = new Pekmez
      actual = pekmez.$ "##{locator}", document

      actual.length.should.equal 1

   it 'should find dom elements by classname', ->
      locator = 'identifier'
      document = domino.createWindow("<p class='#{locator}'></p>").document

      pekmez = new Pekmez
      actual = pekmez.$ ".#{locator}", document

      actual.length.should.equal 1

   it 'should create a graph with 2 nodes and one edge', ->
      content = 'A -> B'

      pekmez = new Pekmez
      actual = pekmez.init content

      actual.nodes.length.should.equal 2
      actual.edges.length.should.equal 1

   # it 'should create a graph with 1 node and no edges', ->
   #    content = 'A'

   #    pekmez = new Pekmez
   #    actual = pekmez.init content

   #    actual.nodes.length.should.equal 1
