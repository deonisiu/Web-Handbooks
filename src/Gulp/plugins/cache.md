# Gulp-Cache [plugin](https://www.npmjs.com/package/gulp-cache)

## Описание

Плагин для кеширования (используется для плагинов gulp-imagemin)

## Install

`npm install --save-dev gulp-cache`

---
## Очистка кеша
```js
gulp.task('clear', function () {
    return cache.clearAll();
})
```

---
## Example

```js
import fs from 'fs';
import gulp from 'gulp';
import jshint from 'gulp-jshint';
import cache from 'gulp-cache';
 
gulp.task('lint', () =>
    gulp.src('./lib/*.js')
        .pipe(cache(jshint('.jshintrc'), {
            key: makeHashKey,
            // What on the result indicates it was successful
            success(jshintedFile) {
                return jshintedFile.jshint.success;
            },
            // What to store as the result of the successful action
            value(jshintedFile) {
                // Will be extended onto the file object on a cache hit next time task is ran
                return {
                    jshint: jshintedFile.jshint
                };
            }
        }))
        .pipe(jshint.reporter('default'))
});
 
const jsHintVersion = '2.4.1',
    jshintOptions = fs.readFileSync('.jshintrc');
 
function makeHashKey(file) {
    // Key off the file contents, jshint version and options
    return `${file.contents.toString('utf8')}${jshintVersion}${jshintOptions}`;
}
```