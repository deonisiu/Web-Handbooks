# Del [plugin](https://www.npmjs.com/package/del)

## Описание

Плагин для удаления файлов и папок

## Install

`npm install --save-dev del`

## Example

```js
var del = require('del'); // Подключаем библиотеку для удаления файлов и папок

gulp.task('clean', function() {
    return del.sync('dist'); // Удаляем папку dist перед сборкой
});
```