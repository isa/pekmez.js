class Pekmez
   constructor: () ->

   all: (d = document) ->
      found = []
      scripts = this.$ 'script', d
      for script in scripts
         if script.type is 'text/pekmez'
            found.push new Content(script.getAttribute('data-type'), script.innerHTML)

      found

   $: (locator, d = document) ->
      [first, rest...] = locator
      if first is '#'
         element = d.getElementById(rest.join(''))
         return if element then [element] else []
      if first is '.'
         return d.getElementsByClassName rest.join('')

      d.getElementsByTagName locator

   init: (content) ->
      return {
         nodes: ['A', 'B']
         edges: [{'A': 'B'}]
      }

class Content
   constructor: (@type, content) ->
      @content = content.trim()

root = exports ? window
root.Pekmez = Pekmez
