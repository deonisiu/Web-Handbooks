# Autoprefixer [plugin](https://www.npmjs.com/package/autoprefixer)

## Описание

PostCss плагин для добавления автопрефиксов в Css

## Install

`npm install --save-dev autoprefixer`

## Example

```js
gulp.task('autoprefixer', function () {
    var postcss      = require('gulp-postcss');
    var sourcemaps   = require('gulp-sourcemaps');
    var autoprefixer = require('autoprefixer');

    return gulp.src('./src/*.css')
        .pipe(sourcemaps.init())
        .pipe(postcss([ autoprefixer() ]))
        .pipe(sourcemaps.write('.'))
        .pipe(gulp.dest('./dest'));
});
```