# Gulp-Html-Beautify [plugin](https://www.npmjs.com/package/gulp-html-beautify)

* [Настройка Gulp+Pug+Beautify](http://4webfan.ru/pug-gulp/)

## Описание

Плагин форматирования HTML кода

## Install

`npm install --save-dev gulp-html-beautify`

## SIMPLE Example

```js
var htmlbeautify = require('gulp-html-beautify');
 
gulp.task('htmlbeautify', function() {
  var options = {
    {indentSize: 2}
  };
  gulp.src('./src/*.html')
    .pipe(htmlbeautify(options))
    .pipe(gulp.dest('./public/'))
});
```

## Example FOR USE

Все теги помещенные в unformatted будут форматироваться как строчные.

```js
gulp.task('htmlbeautify', function() {
    var options = {
        indentSize: 2,
        unformatted: [
            // https://www.w3.org/TR/html5/dom.html#phrasing-content
             'abbr', 'area', 'b', 'bdi', 'bdo', 'br', 'cite',
            'code', 'data', 'datalist', 'del', 'dfn', 'em', 'embed', 'i', 'ins', 'kbd', 'keygen', 'map', 'mark', 'math', 'meter', 'noscript',
            'object', 'output', 'progress', 'q', 'ruby', 's', 'samp', 'small',
             'strong', 'sub', 'sup', 'template', 'time', 'u', 'var', 'wbr', 'text',
            'acronym', 'address', 'big', 'dt', 'ins', 'strike', 'tt'
        ]
 
    };
gulp.src('./*.html')
    .pipe(htmlbeautify(options))
    .pipe(gulp.dest('./'))
});
```

## Options
```js
{
    "indent_size": 4,
    "indent_char": " ",
    "eol": "\n",
    "indent_level": 0,
    "indent_with_tabs": false,
    "preserve_newlines": true,
    "max_preserve_newlines": 10,
    "jslint_happy": false,
    "space_after_anon_function": false,
    "brace_style": "collapse",
    "keep_array_indentation": false,
    "keep_function_indentation": false,
    "space_before_conditional": true,
    "break_chained_methods": false,
    "eval_code": false,
    "unescape_strings": false,
    "wrap_line_length": 0,
    "wrap_attributes": "auto",
    "wrap_attributes_indent_size": 4,
    "end_with_newline": false
}
```