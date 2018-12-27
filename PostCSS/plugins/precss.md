# [PreCSS](https://github.com/jonathantneal/precss)

## Описание

PostCss плагин для использования Sass возможностей таких как переменные, итераторы, условия в Css

## Install

`npm install --save-dev precss`

## Example

```js
gulp.task('autoprefixer', function () {
    var postcss      = require('gulp-postcss');
    var sourcemaps   = require('gulp-sourcemaps');
    var precss = require('precss');

    return gulp.src('./src/*.css')
        .pipe(sourcemaps.init())
        .pipe(postcss([ precss() ]))
        .pipe(sourcemaps.write('.'))
        .pipe(gulp.dest('./dest'));
});
```