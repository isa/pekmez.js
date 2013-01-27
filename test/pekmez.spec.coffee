sinon = require 'sinon'
domino = require 'domino'

{Pekmez} = require '../src/pekmez'

describe 'Pekmez', ->

   # before ->
   #    document = sinon.spy()
   #    document.

   it 'should get contents of all the script blocks when language is pekmez', ->
      # script1 = sinon.stub()
      # script2 = sinon.stub()

      # sinon.stub(document, 'getElementsByTagName').withArgs('script').returns([
      #    script1,
      #    script2
      # ])

      pekmez = new Pekmez
      [actual, rest] = pekmez.all()

      actual.type.should.equal 'network'
      actual.content.should.equal 'A -> B'

      # byTag.called.should.be true

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
