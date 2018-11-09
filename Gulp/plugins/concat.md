# Gulp-Concat [plugin](https://www.npmjs.com/package/gulp-concat)

## Описание

Плагин для объединения нескольких файлов в один

## Install

`npm install --save-dev gulp-concat`

## Example

```js
var concat = require('gulp-concat');
 
gulp.task('scripts', function() {
  return gulp.src('./lib/*.js')
    .pipe(concat('all.js'))
    .pipe(gulp.dest('./dist/'));
});
```

---
## Разница между ***concat*** и ***concat-css*** плагинами

При обработки исходных файлов с кодом :

1 файл
```css
body {
  background-color: red; }
```
2 файл
```css
h1 { font-size: 42px; }
```

***Concat*** выдаст общий файл вида:
```css
body {
  background-color: red; }

h1 { font-size: 42px; }
```

***Concat-css*** выдаст общий файл вида:
```css
body {
  background-color: red; 
}

h1 { 
  font-size: 42px; 
}
```