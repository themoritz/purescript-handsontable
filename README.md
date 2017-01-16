# purescript-handsontable

Minimal Purescript bindings for [Handsontable](http://handsontable.com/).

## About

These bindings are minimal in a sense that, where possible, the direct correspondence between Javascript objects and Purescript records is exploited.
The Handsontable [options](http://docs.handsontable.com/0.25.1/Options.html) can be configured directly via Purescript records.

As a consequence, there is no additional layer of type-safety and values get passed on to the Handsontable API as they are.

Purescript functions can be passed on as well (callbacks).
Use `mkFnN` from `Data.Function.Uncurried` to convert Purescript functions to uncurried Javascript functions.

## Test the example

```bash
npm install
bower install
gulp browserify
python -m SimpleHTTPServer
```

Then navigate to `http://localhost:8000/example/`.

## Documentation

Module documentation is [published on Pursuit](http://pursuit.purescript.org/packages/purescript-handsontable).

You can find an example usage [here](example/src/Main.purs).
