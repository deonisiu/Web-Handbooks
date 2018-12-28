# Gulp-Sass plugin

* [NPM link](https://www.npmjs.com/package/gulp-sass)

## Описание

Плагин для работы с Sass препроцессором

## Install

`npm install --save-dev gulp-sass`

## Example

```js
var gulp = require('gulp'),       // Подключаем Gulp
    sass = require('gulp-sass');  //Подключаем Sass пакет

gulp.task('sass', function(){     // Создаем таск "sass"
    return gulp.src('app/sass/main.sass') // Берем источник
        .pipe(sass())                     // Преобразуем Sass в CSS посредством gulp-sass
        .pipe(gulp.dest('app/css'))       // Выгружаем результата в папку app/css
});
```