# Gulp-UnCSS plugin

* [NPM link](https://github.com/ben-eb/gulp-uncss)

## Описание

Плагин для удаления неиспользуемых стилей CSS

## Install

`npm install --save-dev gulp-uncss`

## Example

```js
var gulp = require('gulp');
var uncss = require('gulp-uncss');

gulp.task('default', function () {
    return gulp.src('site.css')
        .pipe(uncss({
            html: ['index.html', 'posts/**/*.html', 'http://example.com']
        }))
        .pipe(gulp.dest('./out'));
});
```