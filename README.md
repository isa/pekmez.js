# pekmez.js

### Installation

If you want to develop extensions for `pekmez.js` make sure that you have `nodeJS`, `coffee-script`, `mocha` and `should`:

```bash
$ brew install nodejs
$ npm install -g coffee-script mocha should
```

To execute unit tests:

```bash
$ mocha --compilers coffee:coffee-script -r should tests
```

### Usage

To use `pekmez.js` with your web site, include your diagram scripts within the script tags and define a placeholder like below:

```html
<html>
   <head>
      <script href="pekmez.js" language="text/javascript"></script>
      <script language="text/pekmez" data-type="network">
         A -> LB;
         B -> LB;
      </script>
   </head>
   <body>
      <div id="diagram-1"></div>
   </body>
</html>
```
