class Pekmez
   constructor: () ->

   all: () ->
      [new Content('network', 'A -> B')]

   $: (locator, d = document) ->
      [first, rest...] = locator
      if first is '#'
         element = d.getElementById(rest.join(''))
         return if element then [element] else []
      if first is '.'
         return d.getElementsByClassName rest.join('')

      d.getElementsByTagName locator

class Content
   constructor: (type, content) ->
      @type = type
      @content = content.trim()

root = exports ? window
root.Pekmez = Pekmez
