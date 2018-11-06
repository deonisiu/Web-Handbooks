# Gulp-Minify-Css plugin

## Описание

Плагин для минификации css файлов

## Install

`npm install --save-dev gulp-clean-css`

## Example

```js
let gulp = require('gulp');
let cleanCSS = require('gulp-clean-css');

gulp.task('minify-css', () => {
  return gulp.src('styles/*.css')
    .pipe(cleanCSS({compatibility: 'ie8'}))
    .pipe(gulp.dest('dist'));
});
```

## API

[Gulp-Clean-Css AIP](https://github.com/scniro/gulp-clean-css)