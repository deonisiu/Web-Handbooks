# Gulp-Autoprefixer plugin

* [NPM link](https://www.npmjs.com/package/gulp-autoprefixer)

## Описание

Плагин для автоматического добавления префиксов

## Install

`npm install --save-dev gulp-autoprefixer`

## Example

```js
const gulp = require('gulp');
const autoprefixer = require('gulp-autoprefixer');
 
gulp.task('default', () =>
    gulp.src('src/app.css')
        .pipe(autoprefixer({
            browsers: ['last 2 versions'],
            cascade: false
        }))
        .pipe(gulp.dest('dist'))
);
```

## API

[Autoprefixer options](https://github.com/postcss/autoprefixer#options)