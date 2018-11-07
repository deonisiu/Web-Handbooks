# Gulp-Rename plugin

## Описание

Плагин для переименовывания файлов

## Install

`npm install --save-dev gulp-rename`

## Example

```js
var rename = require('gulp-rename');

gulp.task('default', function() {
  gulp.src('css/*.css')
    .pipe(concatCSS('bundle.css'))
    .pipe(minifyCSS())
    .pipe(rename('bundle.min.css')) // RENAME PLUGIN
    .pipe(gulp.dest('app/'));
});
```