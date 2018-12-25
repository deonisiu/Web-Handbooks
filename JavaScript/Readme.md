# Справочник по JavaScript

---
## Структура js папки в проекте для сборки через Gulp-concat

Плагин Gulp-concat объединяет файлы в порядке который :
1. Определен в gulp.src(["firstFile.js", "secondFile.js", ...])
2. По алфавитному порядку
3. По глубине вложенности (чем глубже файл тем позже он присоединяется)

![img](img/jsFilesStruct.png)

Где :
* start.js - начальный файл общей сборки
```js
/**
 * Start scripts
 */
'use strict';
```
* script(folder) - общая папка для всех скриптов
* winOnload(folder) - папка для заполнения фун-и window.onload
* onloadStart.js - файл начала фун-и window.onload
```js
window.onload = function () {
```
* onloadEnd.js - файл конца фун-и window.onload
```js
};
```
* end.js - конечный файл общей сборки
```js
/**
 * End scripts
 */
```

## Полезные ссылки

* [Список DOM событий (для addEventListener)](https://developer.mozilla.org/en-US/docs/Web/Events)

## Разделы

* [Библиотека jQuery](jQuery/)