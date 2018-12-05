# Gulp-Postcss [plugin](https://www.npmjs.com/package/gulp-postcss)

## Описание

По умолчанию PostCSS ничего не делает с CSS. Он только берет изначальный Css код и парсит его превращая в Абстрактное Синтаксическое Дерево (AST, Abstract Syntax Tree). Затем в работу включаются все плагины PostCss, которые и работают с АСТ деревом. После того как плагины проходятся по АСТ дереву и что то меняют, сам PostCss проводит обратный парсинг превращая дерево в стандартный Css код.

Или если короче то :

PostCss - это плагин для прогонки CSS через несколько плагинов с единичным парсингом

## Install

`npm install --save-dev gulp-postcss`

## Example

```js
var postcss = require('gulp-postcss');
var gulp = require('gulp');
 
gulp.task('css', function () {
    return gulp.src('./src/*.css')
        .pipe(postcss())
        .pipe(gulp.dest('./dest'));
});
```

## Интересные плагины

* [Autoprefixer](plugins/autoprefixer.md)