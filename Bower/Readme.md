# Bower(deprecated) - пакетный менеджер для web

Информация для общего развития.

---
## Полезные ссылки

* [Bower home page](https://bower.io)

---
## Настройка Bower
* Изначально при установке все пакеты по умолчанию попадают в папку bower-components. Для указания нового пути в папке проекта создается файл ***.bowerrc*** и внутри файла:
```
{
  "directory" : "app/libs/"
}
```

---
## Работа с Bower

### Команды

```console
npm install -g bower      - Глобальная установка bower
bower -v                  - Проверка версии
bower search <lib>        - Поиск любой библиотеки/пакета
bower info <lib>          - Более детальная информация о библиотеки/пакете
bower install <lib>#1.5.4 - Установка библ/пакета с версией 1.5.4
bower list                - Список установленных библиотек
bower list --path         - Список путей на пакеты для index.html
bower uninstall <lib>     - Удаление библ/пакета
```

Пример установки jQuerry и Magnific Popup :
`bower i jquery magnific-popup`