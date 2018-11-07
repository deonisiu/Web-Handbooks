# Gulp-livereload plugin

* [NPM link](https://www.npmjs.com/package/gulp-livereload)

## Описание

Плагин для автоматического обновления странцы для сервера gulp-connect

## Install

`npm install --save-dev gulp-livereload`

## Example

```js
var gulp = require('gulp'),
    less = require('gulp-less'),
    livereload = require('gulp-livereload');
 
gulp.task('less', function() {
  gulp.src('less/*.less')
    .pipe(less())
    .pipe(gulp.dest('css'))
    .pipe(livereload());
});
 
gulp.task('watch', function() {
  livereload.listen();
  gulp.watch('less/*.less', ['less']);
});
```