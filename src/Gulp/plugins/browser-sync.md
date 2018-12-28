# Browser-sync plugin

## Описание

Плагин для LiveReload страниц при сохранении файлов

## Install

`npm install --save-dev browser-sync`

## Example

```js
var browserSync = require("browser-sync"); // Подключаем Browser-sync

gulp.task("browser-sync", function () { // task browser-sync
    browserSync({ // выполняем browser sync
        server: { // Определяем параметры сервера
            baseDir: "app" // Директория для сервера - app
        },
        notify: false // Отключаем уведомления
    });
});

gulp.task("watch", ["browser-sync", "sass"], function () {
    gulp.watch("app/sass/**/*.scss", ["sass"]); // Наблюдение за sass файлами
    gulp.watch("app/*.html", browserSync.reload); // Наблюдение за HTML файлами в корне проекта
    gulp.watch("app/js/*.js", browserSync.reload); // Наблюдение за JS файлами в папке js
});
```