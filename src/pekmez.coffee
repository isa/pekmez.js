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
      statements = get_statements content
      nodes = []
      edges = []

      (get_nodes statement for statement in statements).map (x) ->
         nodes.push node for node in x when node not in nodes

      edges.push get_edge statement for statement in statements

      edges = edges.filter (edge) -> edge isnt null
      
      return {nodes, edges}

   get_statements = (content) -> content.split /\n/

   get_nodes = (statement) -> statement.split /-[><]?/

   get_edge = (statement) ->
      match = /-[><]?/.exec statement
      if match isnt null
         return match[0]
      return null

class Content
   constructor: (@type, content) ->
      @content = content.trim()

root = exports ? window
root.Pekmez = Pekmez
