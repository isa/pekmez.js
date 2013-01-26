{Pekmez} = require '../src/pekmez'

describe 'Pekmez', ->

   beforeEach: () ->
      document =
         getElementsByTagName: (tagName) ->
            []

   it 'should get contents of all the script blocks when language is pekmez', ->
      pekmez = new Pekmez
      actual = pekmez.blocks()

      actual[0].type.should.equal 'network'
      actual[0].content.should.equal 'A -> B'
