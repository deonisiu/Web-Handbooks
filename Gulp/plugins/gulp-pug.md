# Gulp-Pug [plugin](https://www.npmjs.com/package/gulp-pug)

* [Настройка Gulp+Pug+Beautify](http://4webfan.ru/pug-gulp/)

## Описание

Плагин препроцессор для HTML

## Install

`npm install --save-dev gulp-pug`

## Example

```js
var pug = require('gulp-pug');
 
gulp.task('pug', function() {
  return gulp.src('pug/*.pug')
    .pipe(pug())
    .pipe(gulp.dest("./"))
});
```