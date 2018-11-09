# Gulp

---
## Полезные ссылки

* [Gulp site](https://gulpjs.com)
* [Gulp docs](https://github.com/gulpjs/gulp/tree/v3.9.1/docs)
* [Gulp плагины(sass, uglify, auto prefixer)](https://www.npmjs.com/search?q=keywords:gulpplugin)
* [Gulp рецепты для обычного использования](https://github.com/gulpjs/gulp/tree/v3.9.1/docs/recipes#recipes)

---
## Полезные плагины

* [Browser-Sync](plugins/browser-sync.md)
* [Gulp-Concat-Css](plugins/concat-css.md)
* [Gulp-Clean-Css](plugins/clean-css.md)
* [Gulp-Rename](plugins/rename.md)
* [Gulp-Notify](plugins/notify.md)
* [Gulp-Connect](plugins/connect.md)
* [Gulp-Sass](plugins/sass.md)
* [Gulp-Autoprefixer](plugins/autoprefixer.md)
* [Gulp-Livereload](plugins/livereload.md)
* [Gulp-UnCss](plugins/uncss.md)
* [Gulp-Concat](plugins/concat.md)
* [Gulp-Uglify](plugins/uglify.md)

---
## Навигация по странице
* [Подключение Gulp](https://github.com/deonisiu/Web-Handbooks/tree/master/Gulp#Подключение-gulp)
* [gulp.src](https://github.com/deonisiu/Web-Handbooks/tree/master/Gulp#gulpsrcglobs-options)
* [gulp.dest](https://github.com/deonisiu/Web-Handbooks/tree/master/Gulp#gulpdestpath-options---Параметры-подробнее)
* [gulp.task](https://github.com/deonisiu/Web-Handbooks/tree/master/Gulp#gulptaskname--deps-fn---Параметры-подробнее)
* [gulp.watch](https://github.com/deonisiu/Web-Handbooks/tree/master/Gulp#gulpwatchglob--opts-tasks-or-gulpwatchglob--opts-cb)
* [Gulp CLI docs](https://github.com/deonisiu/Web-Handbooks/tree/master/Gulp#gulp-cli-docs---Основной-список-консольных-gulp-команд)
* [Создание инструкции (task)](https://github.com/deonisiu/Web-Handbooks/tree/master/Gulp#Создание-инструкции-task)

---
## Общее руководство

Gulp - это инструмент, который помогает автоматизировать рутинные задачи веб-разработки.

Для работы с Gulp у вас должен быть установлен Node.js.

Любой проект, использующий Gulp имеет в корне файл ***gulpfile.js***, который содержит набор инструкций по управлению проектом.

Все инструкции для Gulp плагинов прописываются в файле ***gulpfile.js***

---
### Шаблон выборки файлов (glob)[https://en.wikipedia.org/wiki/Glob_(programming)]
Самые распространенные шаблоны выборки:
- \*.sass - выбирает все файлы, имеющие определенное расширение (в данном случае .sass)

- \*\*/\*.js - выбирает все файлы с расширением .js во всех папках проекта

- !header.sass - исключает файл из общей выборки

- \*.+(scss|sass) - задает комплексный шаблон для несколких типов файлов, разделенных вертикальной чертой. В данном примере в выборку попадут любые sass и scss файлы в корне проекта.

---
### Установка в терминале:

Глобальная установка
```console
npm i --global gulp-cli
```

Локальная установка
```console
npm i --save-dev gulp
```

Для нового проекта создается папка, в которую необходимо зайти в терминале.

***Не создавайте русскоязычные папки проектов!***

---
### Подключение Gulp

В файле ***gulpfile.js*** пишем:

```js
var gulp = require("gulp");
```

Так мы подключаем Gulp к проекту, через функцию require. Данная функция подключает пакеты из папки ***node_modules***.

---
### Gulp API docs
Gulp имеет 4 основных команды:
- gulp.src
- gulp.dest
- gulp.task
- gulp.watch

---
### gulp.src(globs[, options])
***gulp.src*** - Выдает файлы из glob запроса или массива glob запросов. Возвращает поток [Виниловых файлов](https://github.com/gulpjs/vinyl-fs), которые могут быть переданы плагинам.

***globs*** - Type: `String` or `Array`

Globs используют [синтаксис node-glob](https://github.com/isaacs/node-glob) + полная поддержка отрицания(!).

Glob со знаком `!` исключает данные файлы из результата, если они не возвращаются следующими glob запросами. Пример:
```
client/
  a.js
  bob.js
  bad.js
```
Следующий запрос получит файлы `a.js` и `bad.js`:
```js
gulp.src(["client/*.js", "!client/b*.js", "client/bad.js"])
```

***options*** - Type: `Object`

Параметры для передачи в [Node-glob](https://github.com/isaacs/node-glob) через [glob-stream](https://github.com/gulpjs/glob-stream).

Gulp поддерживает все свойства [node-glob](https://github.com/isaacs/node-glob#options) и glob-stream за исключением `ignore` и добавляет свойства: `options.buffer`, `options.read`, `options.base`

* `options.buffer` - Type: `Boolean` Default: `True`  
Установка в `false` вернет file.contents в виде потока, а не буферных файлов. Это полезно при работе с большими файлами.
* `options.read` - Type: `Boolean` Default: `True`  
Установка в `false` вернет file.contents как `null` и не будет читать файл.
* `options.base` - Type: `String` Default: Все перед началом glob  
Базовый путь для glob. Пример где файл `somefile.js` содержится в `client/js/somedir`:
```js
gulp.src('client/js/**/*.js') // Matches 'client/js/somedir/somefile.js' and resolves `base` to `client/js/`
  .pipe(minify())
  .pipe(gulp.dest('build'));  // Writes 'build/somedir/somefile.js'

gulp.src('client/js/**/*.js', { base: 'client' })
  .pipe(minify())
  .pipe(gulp.dest('build'));  // Writes 'build/js/somedir/somefile.js'
```

---
### gulp.dest[(path[, options]) - Параметры подробнее](https://github.com/gulpjs/gulp/blob/v3.9.1/docs/API.md#path)
***gulp.dest*** - Передает результатирующие данные в `path`, после применения различных плагинов(sass, minify и тд). Передача через `.pipe`:
```js
gulp.src('./client/templates/*.jade')
  .pipe(gulp.dest('./build/templates'))
```
Повторно выдает все данные, переданные в него. Можно передавать для нескольких путей(папок). Несуществующие папки будут созданы.
```js
gulp.src('./client/templates/*.jade')
  .pipe(jade())
  .pipe(gulp.dest('./build/templates'))
  .pipe(minify())
  .pipe(gulp.dest('./build/minified_templates'));
```

Путь записи определяется добавлением относительного пути к заданному каталогу.

---
### gulp.task[(name [, deps, fn]) - Параметры подробнее](https://github.com/gulpjs/gulp/blob/v3.9.1/docs/API.md#name)
***gulp.task*** - Выполняет задачу(task) при помощи [Orchestrator](https://github.com/robrich/orchestrator)  
***Orchestrator*** - Модуль для последовательных и исполняемых задач и зависимостей в максимальной параллельности.

***name*** - Type: `String` - Название задачи(task)

***deps*** - Type: `Array` - Массив задач которые будут запущены и выполнены перед запуском текущей задачи.
```js
gulp.task('mytask', ['array', 'of', 'task', 'names'], function() {
  // Do stuff
});
```
Также можно опустить параметр функции если нужно просто запустить последовательность задач через одну команду:
```js
gulp.task('build', ['array', 'of', 'task', 'names']);
```

***fn*** - Type: `Function` - Функция выполняющая основную лоигку задачи.
```js
gulp.task('buildStuff', function() {
  // Do something that "builds stuff"
  var stream = gulp.src(/*some source path*/)
  .pipe(somePlugin())
  .pipe(someOtherPlugin())
  .pipe(gulp.dest(/*some destination*/));
  
  return stream;
  });
```

---
### gulp.watch(glob [, opts], tasks) or gulp.watch(glob [, opts, cb])
***gulp.watch*** - Следит за файлами из glob и выполняет свою основную логику, если файлы наблюдения меняются.  
Всегда возвращает EventEmitter, который говорит о событиях изменений.

***glob*** - Type: `String` or `Array` - Один или несколько glob определяющих файлы за которыми идёт наблюдение.

***opts*** - Type: `Object` - Опции которые передаются в gaze  
[gaze](https://github.com/shama/gaze) - glob обертка над методом node.js [fs.watch](https://nodejs.org/api/fs.html#fs_fs_watch_filename_options_listener) отвечающим за наблюдения.

***cb*** - Type: `Function` - Callback(обратный вызов) реагирующий на изменения отслеживаемых файлов.
```js
gulp.watch('js/**/*.js', function(event) {
  console.log('File ' + event.path + ' was ' + event.type + ', running tasks...');
});
```

---
### Gulp CLI docs - Основной список консольных gulp команд
```
* -v & --version - покажет глобальные и локальные версии gulp
* --require `<module path>` - потребует модуль перед запуском gulpfile. Полезно для транспайлеров(transpilers)
* --gulpfile `<gulpfile path>` - ручное задание пути для gulpfile. Полезно, если у вас есть несколько gulpfiles. Это позволит установить CWD(текущий рабочий каталог) на каталог gulpfile.
* --cwd `<path dir>` - установить CWD(текущая рабочая директория) вручную. Поиск gulpfile и всех зависимостей также меняется.
* -T & --tasks покажет дерево зависимостей задач для загруженного gulpfile
* --tasks-simple покажет текстовый список задач для загруженного gulpfile
* --color заставит gulp и gulp plugins отображать цвета, даже если поддержка цвета не обнаружена
* --no-color обратная команда предыдущей
* --silent отключает все протоколирование в gulp
```

---
### Создание инструкции (task)
```js
gulp.task("<task>", function() {
    console.log("Hello i'm task");
  });
```

Далее можем вызывать инструкции из консоли:
```console
gulp <task> <othertask>
```
