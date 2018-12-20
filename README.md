# Handbooks
Справочники по изучению web программирования.

---
## Полезные ссылки

* [HTTP/1.1 Semantic and Content](https://tools.ietf.org/html/rfc7231#page-3)
* [BrowserSync](https://browsersync.io)

---
## Навигация по странице
* [Visually-hidden](https://github.com/deonisiu/Web-Handbooks#visually-hidden)

___
## Разделы

### Среда
* [PhpStorm 2017.1.4](PhpStorm/)
* [Sublime text 3](Sublime/)
* [Console, Bash, Vim](Console/)
* [Git, markdown](Git/)

---

### Основы
* [HTML](HTML/)
* [CSS](CSS/)
* [JavaScript](JavaScript/)
---

### Технологии
* [БЭМ методология](BEM/)
* [Bootstrap](Bootstrap/)
* [Sass/scss](Sass/)
* [PostCSS](PostCSS/)
---

### Автоматизация
* [NPM](Npm/)
* [Gulp](Gulp/)
* [Bower(deprecated)](Bower/)
* [EditorConfig](EditorConfig/)

### Unsorted
* [HTTP-REST - пустой](HTTP-REST/)
* [CDN - пустой](CDN/)

---
## Дополнительные инструменты

* [notepad++](notepad++/)

---
## Общая структура проекта

![project-template](project-template.jpg)

---
## Visually hidden
``` css
.visually-hidden:not(:focus):not(:active),
input[type="checkbox"].visually-hidden,
input[type="radio"].visually-hidden {
	position: absolute;

	width: 1px;
	height: 1px;
	margin: -1px;
	border: 0;
	padding: 0;

	white-space: nowrap;

	clip-path: inset(100%);
	clip: rect(0 0 0 0);
	overflow: hidden;
}
```