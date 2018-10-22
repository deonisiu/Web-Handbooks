# Пакетный менеджер NPM

---
## Полезные ссылки

* [Npm home page](https://www.npmjs.com)
* [Npm intro](http://prgssr.ru/development/vvedenie-v-paketnyj-menedzher-npm-dlya-nachinayushih.html#heading-section-1)

---
## Сокращение команд
- install = -i
- --global = -g
- --save = -S
- --save-dev = -D

---
## Разница между --save(-S) & --save-dev(-D)

Все модули, которые необходимо использовать на production ставятся как --save, те что не должны попасть туда, а используются только в процессе разработки ставятся как --save-dev.

Компиляторы-транспиляторы-трансляторы (типа Coffee, LESS, Jade), тест-раннеры, стайл-чекеры и линтеры (mocha, chai, karma, (js|es)lint, jscs), плагины для таск-раннеров (grunt-contrib-watch, gulp-jade) — все это обычно ставится как --save-dev, потому что нужно только тем, кто контрибьютит в этот проект, работает с его кодом.

Библиотеки и фреймворки (expressjs, jquery, backbone), на основе которых работает ваш код, без которых ваш код не запустится у его потребителя — ставятся как --save.

---
## Краткий список команд
```console
npm config
npm config get prefix
npm --version
npm init                      // Создание файла package.json для управления зависимостями
npm init --yes                // Автоматический ответ да на все вопросы
npm -i packageName --global   // Глобальная установка пакетов
npm -i packageName            // Локальная установка пакетов
npm -i packageeName@1.8.2     // Установка определенной версии после @
npm install                   // Установка пакетов из package.json
npm install pakcageName --save// Сохранение пакета в package.json при установке
npm update packageName        // Обновление пакета
npm list -g                   // Вывод списка глобально установленных пакетов
npm list                      // Вывод списка локально
npm list -g --depth=0         // Список пакетов без зависимостей
npm uninstall packageName     // Удаление пакета
npm cache clean               // Очистка npm кэша
```

---
## Список полезных пакетов
```console
npm -i uglify-js    // Минификация JavaScript
```

---
## Установка

Npm включен в установку Node.js

---
## Пакеты Node

Npm устанавливает пакеты локально или глобально в папку ***node_modules*** родительского каталога.

---
## Управление зависимостями

Для управления зависимостями, а также для установки пакетов в новый проект используется файл ***package.json***, распологающийся в корне проекта.

***Package.json*** является файлом манифеста проекта, который описывает информацию об используемых пакетах в нашем проекте + некоторые настройки(version, author, name, description..).

Генерируется командой `npm init`
```console
$ npm init
This utility will walk you through creating a package.json file.
Press ^C at any time to quit.
name: (project) demo
version: (1.0.0)
description: Demo of package.json
entry point: (index.js)
test command:
git repository:
keywords:
author: Sitepoint
license: (ISC)
```

В результате получаем файл:
```json
{
  "name": "demo",
  "version": "1.0.0",
  "description": "Demo package.json",
  "main": "main.js",
  "dependencies": {
    "mkdirp": "^0.5.1",
    "underscore": "^1.8.3"
  },
  "devDependencies": {},
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "author": "Sitepoint",
  "license": "ISC"
}
```

---
## Установка пакетов с помощью package.json
```console
$ mkdir ~/demo && cd ~/demo
$ cp ~/project/package.json ~/demo
$ npm install
$ npm list
demo@1.0.0 /home/sitepoint/demo
├─┬ mkdirp@0.5.1
│ └── minimist@0.0.8
└── underscore@1.8.3
```

---
## Добавление новых пакетов в файл package.json при их установке в проект

Для добавления новых пакетов в ***package.json*** используется флаг `--save`
```console
$ npm install request --save
$ npm list --depth=0
demo@1.0.0 /home/sitepoint/demo
├── mkdirp@0.5.1
├── request@2.53.0
└── underscore@1.8.3
```