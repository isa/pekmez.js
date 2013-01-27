# pekmez.js

### Build Status

[![Build Status](https://secure.travis-ci.org/isa>/pekmez.js.png)](http://travis-ci.org/is/pekmez.js)

### Installation

If you want to develop extensions for `pekmez.js` make sure that you have `nodeJS`, `coffee-script`, `mocha`, `sinon`, `domino` and `should`:

```bash
$ brew install nodejs
$ npm install -g coffee-script mocha should sinon domino
```

Assuming you have the correct NPM setup.. If not, do something like this:

```bash
echo 'export NODE_PATH="'$(npm root -g)'"' >> ~/.bashrc
```

To execute unit tests:

```bash
$ mocha
```

### Usage

To use `pekmez.js` with your web site, include your diagram scripts within the script tags and define a placeholder like below:

```html
<html>
   <head>
      <script href="pekmez.js" type="text/javascript"></script>
      <script type="text/pekmez" data-type="network">
         A -> LB;
         B -> LB;
      </script>
   </head>
   <body>
      <div id="diagram-1"></div>
   </body>
</html>
```
