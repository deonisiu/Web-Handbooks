# Сборка ***gulpfule.js***
```js
var gulp = require('gulp'),
    sass = require('gulp-sass'),
    cleanCss = require('gulp-clean-css'),
    watch = require('gulp-watch'),
    concat = require('gulp-concat'),

    postcss = require('gulp-postcss'),
    autoprefixer = require('autoprefixer'),
    cssnext = require('cssnext'),
    precss = require('precss'),

    browserSync = require('browser-sync').create();

// Отслеживание изменений в SCSS .html style.css .js
// ---
// Внутри watch добавляется конструкция {usePolling:true}
// позволяющая не увеличивать время выполнения таска
// ---
gulp.task('stream', ['browser-sync'], function () {
    watch('src/sass/**/*.scss', {usePolling:true}, function () {
        gulp.start('sass');
    });
    watch('src/*.html', {usePolling:true}, browserSync.reload);

    watch('src/css/style.css', {usePolling:true}, browserSync.reload);
    watch('src/css/style.css', {usePolling:true}, function () {
        gulp.start('autoprefixer');
    });

    watch('src/js/**/*.js', {usePolling:true}, browserSync.reload);
    watch(['src/js/start.js', 'src/js/scripts/**/*.js', 'src/js/end.js'], {usePolling:true}, function () {
        gulp.start('concat-js');
    });
});

gulp.task('concat-js', function () {
    return gulp.src(['src/js/start.js', 'src/js/scripts/**/*.js', 'src/js/end.js'])
        .pipe(concat('script.js'))
        .pipe(gulp.dest('src/js'));
});

gulp.task('sass', function () {
    return gulp.src("src/sass/style.scss")
        .pipe(sass({outputStyle: 'expanded'})).on('error', sass.logError)
        .pipe(gulp.dest("src/css"));
});

// Минификация css
gulp.task('minify-css', function () {
    return gulp.src("src/css/style.css")
        .pipe(cleanCss({compatibility: 'ie8'}))
        .pipe(gulp.dest('dist/css'));
});

// Сервер синхронизации
gulp.task('browser-sync', function () {
    browserSync.init({
        server: {
            baseDir: 'src'
        },
        notify: false
    });
});

gulp.task('build', ['buildhtml', 'buildcss', 'buildjs', 'buildimg']);

// Build Html for dist folder
gulp.task('buildhtml', function () {
    return gulp.src("src/*.html")
        .pipe(gulp.dest("dist"));
});

// AutoPrefixer for 2 last versions in browsers
// + Minify CSS
gulp.task('buildcss', function () {
    return gulp.src('src/css/style.css')
        .pipe(postcss([ autoprefixer({browsers: ['last 2 version']}) ]))
        .pipe(cleanCss({compatibility: 'ie8'}))
        .pipe(gulp.dest('dist/css'));
});

// Build JavaScript for dist folder
gulp.task('buildjs', function () {
    return gulp.src('src/js/script.js')
        .pipe(gulp.dest('dist/js'));
});

gulp.task('buildimg', function () {
    return gulp.src('src/img/**')
        .pipe(gulp.dest('dist/img'));
});

// Test Task for PostCSS
gulp.task('postcss', function () {
    var processors = [
        autoprefixer({browsers: ['last 5 version']}),
        precss,
        cssnext
    ];

    return gulp.src("test/style.css")
        .pipe(postcss(processors))
        .pipe(gulp.dest("test/out"));
});
```