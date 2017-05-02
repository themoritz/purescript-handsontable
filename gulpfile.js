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
  return purescript.compile({
    src: sources,
    ffi: foreigns
  })
})

gulp.task('example', function () {
  return purescript.compile({
    src: sources.concat(exampleSources),
    ffi: foreigns
  })
})

gulp.task('bundle', ['example'], function () {
  return purescript.bundle({
    src: 'output/**/*.js',
    output: 'tmp/main.js',
    main: 'Main'
  })
})

gulp.task('browserify', ['bundle'], function () {
  return browserify('tmp/main.js')
    .require(['moment', 'pikaday', 'numbro', 'zeroclipboard'])
    .bundle()
    .pipe(vinyl('bundle.js'))
    .pipe(gulp.dest('example'))
})

gulp.task('default', ['make'])
