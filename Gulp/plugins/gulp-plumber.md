# Gulp-Plumber [plugin](https://www.npmjs.com/package/gulp-plumber)

## Описание

Плагин для предотвращения разрыва pipe-ов вызванных ошибками от gulp плагинов

## Install

`npm install --save-dev gulp-plumber`

## Example

```js
var plumber = require('gulp-plumber');
 
gulp.src('./src/*.ext')
    .pipe(plumber())
    .pipe(gulp.dest('./dist'));
```