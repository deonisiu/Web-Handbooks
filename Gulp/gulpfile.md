# Сборка ***gulpfule.js***
```js
var gulp = require('gulp'),
    sass = require('gulp-sass'),
    concatCss = require('gulp-concat-css'),
    cleanCss = require('gulp-clean-css'),
    del = require('del'),
    browserSync = require('browser-sync');

gulp.task('sass', function () {
    return gulp.src("app/sass/**/*.scss")
        .pipe(sass().on('error', function ( error ) {
            console.log("----------------");
            console.log("SASS ERROR : " + error.message);
        }))
        .pipe(gulp.dest("app/css"))
});

// На одном уровне соединение .css файлов идёт по алфавитному порядку
// Чем глубже вложен файл тем позже он будет вставлен
gulp.task('concat-css', ['del-main-css'], function () {
    return gulp.src('app/css/**/*.css')
        .pipe(concatCss('main.css'))
        .pipe(gulp.dest('app/css/'));
});

// Удаление файла main.css
gulp.task('del-main-css', function () {
    return del.sync("app/css/main.css");
});

// Минификация css
gulp.task('minify-css', function () {
    return gulp.src("app/css/main.css")
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

gulp.task('watch', ['browser-sync'], function () {
    gulp.watch('app/*.html', browserSync.reload);
    gulp.watch('app/css/**/*.css', ['concat-css', browserSync.reload]);
    gulp.watch('app/sass/**/*.scss', ['sass']);
});
```