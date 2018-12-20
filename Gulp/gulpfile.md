# Сборка ***gulpfule.js***
```js
var gulp = require('gulp'),
    sass = require('gulp-sass'),
    concatCss = require('gulp-concat-css'),
    cleanCss = require('gulp-clean-css'),
    del = require('del'),
    watch = require('gulp-watch'),
    gulpSequence = require('gulp-sequence'),
    browserSync = require('browser-sync').create();

// Отслеживание изменений в SCSS .html style.css
gulp.task('stream', ['browser-sync'], function () {
    watch('app/sass/**/*.scss', function () {
        gulp.start('sequence');
    });
    watch('app/*.html', browserSync.reload);
    watch('app/css/style.css', browserSync.reload);
});

// Последовательное выполнение тасков
gulp.task('sequence', function ( cb ) {
    gulpSequence(
        'sass',
        'del-style-css',
        'concat-css',
        cb
    );
});

gulp.task('sass', ['clear-css'], function () {
    return gulp.src("app/sass/**/*.scss")
        .pipe(sass({outputStyle: 'expanded'})).on('error', sass.logError)
        .pipe(gulp.dest("app/css"));
});



// На одном уровне соединение .css файлов идёт по алфавитному порядку
// Чем глубже вложен файл тем позже он будет вставлен
gulp.task('concat-css', function () {
    return gulp.src('app/css/**/*.css')
        .pipe(concatCss('style.css'))
        .pipe(gulp.dest('app/css/'));
});

// Удаление файла style.css
gulp.task('del-style-css', function () {
    return del.sync("app/css/style.css");
});

// Удаление всех файлов папки css кроме style.css
gulp.task('clear-css', function () {
    return del.sync(["app/css/*", "!app/css/style.css"]);
});

// Минификация css
gulp.task('minify-css', function () {
    return gulp.src("app/css/style.css")
        .pipe(cleanCss({compatibility: 'ie8'}))
        .pipe(gulp.dest('dist/css'));
});

// Сервер синхронизации
gulp.task('browser-sync', function () {
    browserSync.init({
        server: {
            baseDir: 'app'
        },
        notify: false
    });
});
```