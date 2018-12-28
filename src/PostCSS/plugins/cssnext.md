# [CssNext](http://cssnext.io/)

## Описание

PostCss плагин для использования самых последних изменений синтаксиса в Css

## Install

`npm install --save-dev cssnext`

## Example

```js
gulp.task('autoprefixer', function () {
    var postcss      = require('gulp-postcss');
    var sourcemaps   = require('gulp-sourcemaps');
    var cssnext = require('cssnext');

    return gulp.src('./src/*.css')
        .pipe(sourcemaps.init())
        .pipe(postcss([ cssnext() ]))
        .pipe(sourcemaps.write('.'))
        .pipe(gulp.dest('./dest'));
});
```