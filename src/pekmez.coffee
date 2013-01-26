class Pekmez
   constructor: () ->

   blocks: () ->
      [new Content('network', 'A -> B')]

class Content
   constructor: (type, content) ->
      @type = type
      @content = content.trim()

root = exports ? window
root.Pekmez = Pekmez
