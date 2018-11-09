# Gulp-Uglify [plugin](https://www.npmjs.com/package/gulp-uglify)

## Описание

Плагин для минификации JavaScript файлов

## Install

`npm install --save-dev gulp-uglify`

Также используется дополнительный модуль [pump](https://github.com/mafintosh/pump)

`npm install pump`

## Example

```js
var gulp = require('gulp');
var uglify = require('gulp-uglify');
var pump = require('pump');
 
gulp.task('compress', function (cb) {
  pump([
        gulp.src('lib/*.js'),
        uglify(),
        gulp.dest('dist')
    ],
    cb
  );
});
```