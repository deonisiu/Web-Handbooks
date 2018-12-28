# [Gulp-imagemin](https://www.npmjs.com/package/gulp-imagemin) + [Imagemin-pngquant](https://www.npmjs.com/package/imagemin-pngquant) plugins

## Описание

Плагины для оптимизации изображений

## Install

`npm install --save-dev gulp-imagemin`

`npm install --save-dev imagemin-pngquant`

## Example

***gulp-imagemin***
```js
const gulp = require('gulp');
const imagemin = require('gulp-imagemin');
 
gulp.task('default', () =>
    gulp.src('src/images/*')
        .pipe(imagemin())
        .pipe(gulp.dest('dist/images'))
);
```

***imgmin-pngquant***
```js
const imagemin = require('imagemin');
const imageminPngquant = require('imagemin-pngquant');
 
imagemin(['images/*.png'], 'build/images', {use: [imageminPngquant()]}).then(() => {
    console.log('Images optimized');
});
```

---
## Общий пример использования + plugin gulp-cache

Без использования gulp-cache 
```js
var imagemin = require('gulp-imagemin'), // Подключаем библиотеку для работы с изображениями
    pngquant = require('imagemin-pngquant'); // Подключаем библиотеку для работы с png

gulp.task('img', function() {
    return gulp.src('app/img/**/*') // Берем все изображения из app
        .pipe(imagemin({ // Сжимаем их с наилучшими настройками
            interlaced: true,
            progressive: true,
            svgoPlugins: [{removeViewBox: false}],
            use: [pngquant()]
        }))
        .pipe(gulp.dest('dist/img')); // Выгружаем на продакшен
});
```

Вместе с gulp-cache :
```js
var cache = require('gulp-cache'); // Подключаем библиотеку кеширования

gulp.task('img', function() {
    return gulp.src('app/img/**/*') // Берем все изображения из app
        .pipe(cache(imagemin({  // Сжимаем их с наилучшими настройками с учетом кеширования
            interlaced: true,
            progressive: true,
            svgoPlugins: [{removeViewBox: false}],
            use: [pngquant()]
        })))
        .pipe(gulp.dest('dist/img')); // Выгружаем на продакшен
});
```