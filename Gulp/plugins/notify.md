# Gulp-Notify plugin

* [NPM link](https://www.npmjs.com/package/gulp-notify)

## Описание

Плагин уведомлений для Gulp

## Install

`npm install --save-dev gulp-notify`

## Example

```js
var notify = require("gulp-notify");
gulp.src("./src/test.ext")
  .pipe(notify("Hello Gulp!"));
```