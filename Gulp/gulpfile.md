# Сборка ***gulpfule.js***
```js
var gulp = require('gulp'),
    sass = require('gulp-sass'),
    cleanCss = require('gulp-clean-css'),
    del = require('del'),
    watch = require('gulp-watch'),
    browserSync = require('browser-sync').create();

// Отслеживание изменений в SCSS .html style.css
gulp.task('stream', ['browser-sync'], function () {
    watch('app/sass/**/*.scss', function () {
        gulp.start('sass');
    });
    watch('app/*.html', browserSync.reload);
    watch('app/css/style.css', browserSync.reload);
});

gulp.task('sass', function () {
    return gulp.src("app/sass/style.scss")
        .pipe(sass({outputStyle: 'expanded'})).on('error', sass.logError)
        .pipe(gulp.dest("app/css"));
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