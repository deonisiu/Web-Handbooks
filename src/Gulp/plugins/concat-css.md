# Gulp-Concat-Css plugin

## Описание

Плагин для объединения нескольких css файлов в один

## Install

`npm install --save-dev gulp-concat-css`

## Example

```js
var concatCss = requare('gulp-concat-css');

gulp.task('default', function () {
  return gulp.src('assets/**/*.css')
    .pipe(concatCss("styles/bundle.css"))
    .pipe(gulp.dest('out/'));
});
```

## API

concatCss(targetFile, options)

- targetFile: The relative path of the generated file containing the concatenated css
- options: (since 2.1.0)
  - inlineImports: (default true) Inline any local import statement found
  - rebaseUrls: (default true) Adjust any relative URL to the location of the target file.
  - includePaths: (default []) Include additional paths when inlining imports
  - commonBase: (default to the base property of the first file) Common base path from wich resolving files and urls

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