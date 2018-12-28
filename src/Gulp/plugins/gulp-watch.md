# Gulp-Watch [plugin](https://www.npmjs.com/package/gulp-watch)

## Описание

Частичная замена для ***gulp.watch***

Плагин для наблюдения за файлами (срабатывает при удалении и создании файлов)

***ВАЖНО*** : Gulp-Watch использует [chokidar](https://github.com/paulmillr/chokidar), если при использовании не добавить опцию `{usePolling:true}`, то время выполнения тасков может ***постоянно увеличиваться***. Пример:
```js
watch('app/sass/**/*.scss', {usePolling:true}, function () {
    gulp.start('sass');
});
```

Статья на [Тостере](https://toster.ru/q/380260) о проблеме времени выполнения

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