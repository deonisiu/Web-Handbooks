# Сборка ***gulpfule.js***
```js
var gulp = require('gulp'),
    sass = require('gulp-sass'),
    cleanCss = require('gulp-clean-css'),
    watch = require('gulp-watch'),
    concat = require('gulp-concat'),
    browserSync = require('browser-sync').create();

// Отслеживание изменений в SCSS .html style.css .js
// ---
// Внутри watch добавляется конструкция {usePolling:true}
// позволяющая не увеличивать время выполнения таска
// ---
gulp.task('stream', ['browser-sync'], function () {
    watch('app/sass/**/*.scss', {usePolling:true}, function () {
        gulp.start('sass');
    });
    watch('app/*.html', {usePolling:true}, browserSync.reload);
    watch('app/css/style.css', {usePolling:true}, browserSync.reload);
    watch('app/js/**/*.js', {usePolling:true}, browserSync.reload);
    watch(['app/js/start.js', 'app/js/scripts/**/*.js', 'app/js/end.js'], {usePolling:true}, function () {
        gulp.start('concat-js');
    });
});

gulp.task('concat-js', function () {
    return gulp.src(['app/js/start.js', 'app/js/scripts/**/*.js', 'app/js/end.js'])
        .pipe(concat('script.js'))
        .pipe(gulp.dest('app/'));
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