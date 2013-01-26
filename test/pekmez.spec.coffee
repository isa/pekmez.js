{Pekmez} = require '../src/pekmez'

describe 'Pekmez', ->

   beforeEach: () ->
      script1 = sinon.stub()
      script2 = sinon.stub()

      document =
         getElementsByTagName = sinon.stub().returns([script1, script2])

   it 'should get contents of all the script blocks when language is pekmez', ->
      pekmez = new Pekmez
      actual = pekmez.blocks()

      actual[0].type.should.equal 'network'
      actual[0].content.should.equal 'A -> B'

   it 'should create a new Pekmez instance', ->
      pekmez = new Pekmez

