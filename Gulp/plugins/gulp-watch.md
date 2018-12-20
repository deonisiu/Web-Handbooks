# Gulp-Watch [plugin](https://www.npmjs.com/package/gulp-watch)

## Описание

Частичная замена для ***gulp.watch***

Плагин для наблюдения за файлами (срабатывает при удалении и создании файлов)

## Install

`npm install --save-dev gulp-watch`

## Example

```js
var gulp = require('gulp'),
    watch = require('gulp-watch');


gulp.task('watch', function() {
    // simple example
    watch('app/*.html', browserSync.reload);
});
 
gulp.task('stream', function () {
    // Endless stream mode
    return watch('css/**/*.css', { ignoreInitial: false })
        .pipe(gulp.dest('build'));
});
 
gulp.task('callback', function () {
    // Callback mode, useful if any plugin in the pipeline depends on the `end`/`flush` event
    return watch('css/**/*.css', function () {
        gulp.src('css/**/*.css')
            .pipe(gulp.dest('build'));
    });
});
```