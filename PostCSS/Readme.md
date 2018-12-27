# Postcss [github](https://github.com/postcss/postcss#postcss-)

---
## Полезные ссылки

* [PostCSS быстрый старт in Gulp](https://habr.com/post/271739/)
* [Введение в PostCSS](https://webformyself.com/vvedenie-v-postcss/)
* [PostCSS and Source Maps](https://github.com/postcss/postcss/blob/master/docs/source-maps.md)
* [AutpPrefixer](https://github.com/postcss/autoprefixer)
---
## Плагины для PostCSS

* [Список плагинов](https://github.com/postcss/postcss/blob/master/docs/plugins.md)
* [Основные плагины](https://post-css.ru/install/)

### Интересные плагины

* [Gulp-Postcss](https://www.npmjs.com/package/gulp-postcss) - Установка PostCSS в Gulp

Install - `npm install --save-dev gulp-postcss`

Использует gulp-postcss и gulp-sourcemaps:
```js
gulp.task('css', function () {
    var postcss    = require('gulp-postcss');
    var sourcemaps = require('gulp-sourcemaps');

    return gulp.src('src/**/*.css')
        .pipe( sourcemaps.init() )
        .pipe( postcss([ require('autoprefixer'), require('precss') ]) )
        .pipe( sourcemaps.write('.') )
        .pipe( gulp.dest('build/') );
});
```
* [Autoprefixer](plugins/autoprefixer.md)
* [PreCSS](https://www.npmjs.com/package/precss)
* [PostCSS-assets](https://github.com/borodean/postcss-assets)

## Описание

По умолчанию PostCSS ничего не делает с CSS. Он только берет изначальный Css код и парсит его превращая в Абстрактное Синтаксическое Дерево (AST, Abstract Syntax Tree). Затем в работу включаются все плагины PostCss, которые и работают с АСТ деревом. После того как плагины проходятся по АСТ дереву и что то меняют, сам PostCss проводит обратный парсинг превращая дерево в стандартный Css код.

Или если короче то :

PostCss - это плагин для прогонки CSS через несколько плагинов с единичным парсингом