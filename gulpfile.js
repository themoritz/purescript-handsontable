'use strict'

var gulp = require('gulp')
var purescript = require('gulp-purescript')
var browserify = require('browserify')
var vinyl = require('vinyl-source-stream')

var sources = [
  'src/**/*.purs',
  'bower_components/purescript-*/src/**/*.purs'
]
var foreigns = [
  'src/**/*.js',
  'bower_components/purescript-*/src/**/*.js'
]
var exampleSources = [
  'example/src/**/*.purs'
]

gulp.task('make', function () {
  return purescript.psc({
    src: sources,
    ffi: foreigns
  })
})

gulp.task('example', function () {
  return purescript.psc({
    src: sources.concat(exampleSources),
    ffi: foreigns
  })
})

gulp.task('bundle', ['example'], function () {
  return purescript.pscBundle({
    src: 'output/**/*.js',
    output: 'dist/main.js',
    main: 'Main'
  })
})

gulp.task('browserify', ['bundle'], function () {
  return browserify('dist/main.js')
    .require(['moment', 'pikaday', 'numbro', 'zeroclipboard'])
    .bundle()
    .pipe(vinyl('handsontable.js'))
    .pipe(gulp.dest('example'))
})

gulp.task('watch-browser', function () {
  gulp.watch(sources.concat(exampleSources).concat(foreigns), 'bundle')
})

gulp.task('watch-make', function () {
  gulp.watch(sources.concat(foreigns), 'make')
})

gulp.task('default', ['make'])
