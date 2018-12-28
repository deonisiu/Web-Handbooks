# Gulp-Minify [plugin]()

## Описание

Плагин для минификации JavaScript файлов с использованием terser

## Install

`npm install --save-dev gulp-minify`

## Example

```js
const minify = require('gulp-minify');
 
gulp.task('compress', function() {
  gulp.src(['lib/*.js', 'lib/*.mjs'])
    .pipe(minify())
    .pipe(gulp.dest('dist'))
});
```