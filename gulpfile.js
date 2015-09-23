'use strict'

var gulp        = require('gulp'),
    purescript  = require('gulp-purescript');

var sources = [
  'src/**/*.purs',
  'bower_components/purescript-*/src/**/*.purs'
];
var foreigns = [
  'src/**/*.js',
  'bower_components/purescript-*/src/**/*.js'
];
var exampleSources = [
  'example/src/**/*.purs'
];
var exampleForeigns = [
  'example/src/**/*.js'
];

gulp.task('docs', function() {
  return purescript.pscDocs({
    src: sources,
    docgen: {
      "Handsontable": "docs/Handsontable.md",
      "Handsontable.Hooks": "docs/Handsontable/Hooks.md",
      "Handsontable.Types": "docs/Handsontable/Types.md"
    }
  });
});

gulp.task('make', function() {
  return purescript.psc({
    src: sources,
    ffi: foreigns
  });
});

gulp.task('example', function() {
  return purescript.psc({
    src: sources.concat(exampleSources),
    ffi: foreigns.concat(exampleForeigns)
  });
});

gulp.task('bundle', ['example'], function() {
  return purescript.pscBundle({
    src: 'output/**/*.js',
    output: 'example/handsontable.js',
    main: "Main"
  });
});

gulp.task('watch-browser', function() {
  gulp.watch(sources.concat(exampleSources).concat(foreigns).concat(exampleForeigns), 'bundle');
});

gulp.task('watch-make', function() {
  gulp.watch(sources.concat(foreigns), 'make');
});

gulp.task('default', ['make']);
