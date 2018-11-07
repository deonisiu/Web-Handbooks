# Gulp-connect plugin

* [NPM link](https://www.npmjs.com/package/gulp-connect)

## Описание

Плагин для запуска веб-сервера с использованием [LiveReload](https://www.npmjs.com/package/gulp-livereload)

## Install

`npm install --save-dev gulp-connect`

## Example


### USAGE
```js
var gulp = require('gulp'),
  connect = require('gulp-connect');
 
gulp.task('connect', function() {
  connect.server();
});
 
gulp.task('default', ['connect']);
```

### LiveReload
```js
var gulp = require('gulp'),
  connect = require('gulp-connect');
 
gulp.task('connect', function() {
  connect.server({
    root: 'app',
    livereload: true
  });
});
 
gulp.task('html', function () {
  gulp.src('./app/*.html')
    .pipe(gulp.dest('./app'))
    .pipe(connect.reload());
});
 
gulp.task('watch', function () {
  gulp.watch(['./app/*.html'], ['html']);
});
 
gulp.task('default', ['connect', 'watch']);
```

### Start and stop server
```js
gulp.task('jenkins-tests', function() {
  connect.server({
    port: 8888
  });
  // run some headless tests with phantomjs
  // when process exits:
  connect.serverClose();
});
```

## API

[Autoprefixer options](https://www.npmjs.com/package/gulp-connect#api)