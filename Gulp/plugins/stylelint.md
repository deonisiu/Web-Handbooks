# Gulp-Stylelint plugin

* [Stylelint homepage](https://stylelint.io)
* [NPM link](https://www.npmjs.com/package/gulp-stylelint)

## Описание

Плагин для проверки css кода на наличие ошибок

## Install

`npm install stylelint gulp-stylelint --save-dev`

## Конфигурация

В папке проекта должен быть файл ***.stylelintrc***

[Конфигурация](https://stylelint.io/user-guide/configuration/)

## Example

```js
const gulp = require('gulp');
 
gulp.task('lint-css', function lintCssTask() {
  const gulpStylelint = require('gulp-stylelint');
 
  return gulp
    .src('src/**/*.css')
    .pipe(gulpStylelint({
      reporters: [
        {formatter: 'string', console: true}
      ]
    }));
});```