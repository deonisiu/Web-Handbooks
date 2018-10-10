# Справочник по CSS

---
## Интересные темы (для изучения)

* Responsive Font Size
* Box-sizing: content-box(default) | border-box;
* CSS Icons
* CSS Links - right order for a propertys :
1. a:link
2. a:visited
3. a:hover
4. a:active

* CSS Lists propertys :
1. [list-style-type](https://webref.ru/css/list-style-type)
2. [list-style-position](https://webref.ru/css/list-style-position)
3. [list-style-image](https://webref.ru/css/list-style-image)

* [CSS Media Queries](https://www.w3schools.com/css/css3_mediaqueries.asp)


---
## Полезные ссылки

* [Web Developer Site (w3schools)](https://www.w3schools.com/default.asp)
* [Комбинация селекторов (WebRef.ru)](https://webref.ru/course/css-tutorial/selector-combine)
* [Справочник CSS (WebRef.ru)](https://webref.ru/css)
* [Автопрефиксер CSS онлайн](https://autoprefixer.github.io/ru/)

---
## Правило @import
Правило @import работает медленнее, чем тег <link>. В стилях @import не должен использоваться.
```css
<!-- Хорошо: подключение тегом link -->
<link rel="stylesheet" href="module.css">

<!-- Плохо -->
<style>
  @import url("module.css");
</style>
```

---
## Порядок свойств

1. Позиционирование
2. Блочная модель
3. Типографика
4. Оформление
5. Анимация
6. Разное

```css 
.declaration-order {
  /* Позиционирование */
  position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  z-index: 100;

  /* Блочная модель */
  display: block;
  float: right;
  width: 100px;
  height: 100px;
  margin: 10px;
  padding: 10px;

  /* Типографика */
  font: normal 13px/1.5 "Arial", sans-serif;
  font-style: normal;
  font-size: 13px;
  line-height: 1.5;
  font-family: "Arial", sans-serif;
  text-align: center;
  color: #333333;

  /* Оформление */
  background-color: #f5f5f5;
  border: 1px solid #e5e5e5;
  border-radius: 3px;
  opacity: 1;

  /* Анимация */
  transition: color 1s;

  /* Разное */
  will-change: auto;
}
```

---
## Комбинация селекторов [WebRef.ru](https://webref.ru/course/css-tutorial/selector-combine)

* Группирование селекторов (A, B) - применяет один и тот же стиль сразу к нескольким селекторам
``` css
a, h1, h2, p {
  ...
}
```
* Селекторы потомка (A B) - Селекторы потомка выбирают всех заданных потомков указанного элемента, независимо от их уровня вложенности.
``` css
div p {
  ... (стили для всех p внутри всех div)
}
```
* Дочерние селекторы (A > B) - Выбираются только дочернии элементы
``` css
div > p {
  ... (стили только для дочерних p внутри всех div)
}
```
* Смежные селекторы (A + B) - Выбирает элемент B, который идёт в коде сразу же после A
``` css
h1 + p {
  ... (стили для первого p идущего после h1)
}
```
* Братские селекторы (A ~ B) - Выбирает все братские элементы B, которые идут в коде после элемента A (направление слева направо)
``` css
h1 ~ p {
  ... (стили для всех p идущих после h1)
}
```

---
## Селекторы атрибутов

* Селектор [attribute] - Устанавливает стиль для элементов, у которых присутствует указанный атрибут. Значение атрибута при этом не учитывается
``` css
[title] { 
	border-bottom: 1px dotted blue; 
}
```
* Селектор [attribute="value"] - Устанавливает стиль для элемента, когда задано указанное значение атрибута
``` css
input[type="checkbox"] { 
	width: 20px; height: 20px; 
}
```
* Селектор [attribute^="value"] - Устанавливает стиль для элемента, когда значение атрибута начинается с указанного текста
``` css
[class^="view"] { 
	color: red; 
}
```
* Селектор [attribute\*="value"] - Позволяет выбрать элементы, у которых значение атрибута содержит указанный текст. При этом текст может быть в начале, в середине или в конце
``` css
[class*="view"] { 
	color: red; 
}
```
* Селектор [attribute$="value"] - Устанавливает стиль для элемента, когда значение атрибута оканчивается указанным текстом
``` css
[class$="view"] { 
	color: red; 
}
```
* Селектор [attribute|="value"] - Стиль применяется к элементам, у которых атрибут начинается с указанного значения или с фрагмента значения, после которого идёт дефис
``` css
[class|="view"] { 
	color: red; 
}
```

---
## Основные псевдо классы и элементы[WebRef.ru](https://webref.ru/css/type/pseudoclass)

<table>
	<tr>
		<th>Selector</th>
		<th>Example</th>
		<th>Example description</th>
	</tr>
	<tr>
		<th colspan="3">Pseudo Class</th>
	</tr>
	<tr>	 	
		<td>:active</td>
		<td>a:active</td>
		<td>Selects the active link</td>
	</tr>
	<tr>		
		<td>:hover</td>
		<td>a:hover</td>
		<td>Selects links on mouse over</td>
	</tr>
	<tr>		
		<td>:link</td>
		<td>a:link</td>
		<td>Selects all unvisited links</td>
	</tr>
	<tr>		
		<td>:visited</td>
		<td>a:visited</td>
		<td>Selects all visited links</td>
	</tr>
	<tr>
		<th colspan="3"></th>
	</tr>
	<tr>
		<th colspan="3">Pseudo Elements</th>
	</tr>
	<tr>		
		<td>::after</td>
		<td>p::after</td>
		<td>Insert content after every <p> element</td>
	</tr>
	<tr>		
		<td>::before</td>
		<td>p::before</td>
		<td>Insert content before every <p> element</td>
	</tr>
	<tr>		
		<td>::first-letter</td>
		<td>p::first-letter</td>
		<td>Selects the first letter of every <p> element</td>
	</tr>
	<tr>		
		<td>::first-line</td>
		<td>p::first-line</td>
		<td>Selects the first line of every <p> element</td>
	</tr>
	<tr>		
		<td>::selection</td>
		<td>p::selection</td>
		<td>Selects the portion of an element that is selected by a user</td>
	</tr>
</table>

---
## Создание пользовательского шрифта [(@font-face)](https://www.w3schools.com/css/css3_fonts.asp)

Example:
``` css
@font-face {
    font-family: myFirstFont;
    src: url(sansation_light.woff);
}

div {
    font-family: myFirstFont;
}
```

---
## CSS 2D Трансформации [(transform)](https://www.w3schools.com/css/css3_2dtransforms.asp)

Методы : 
* translate() - ``transform: translate(50px, 100px);``
* rotate() - ``transform: rotate(20deg);``
* scale() - ``transform: scale(2, 3);``
* skewX() - ``transform: skewX(20deg);``
* skewY() - ``transform: skewY(20deg);``
* matrix() - ``transform: matrix(1, -0.3, 0, 1, 0, 0);``

---
## CSS 3D Трансформации [(transform)](https://www.w3schools.com/css/css3_3dtransforms.asp)

Методы :
* rotateX() - ``transform: rotateX(150deg);``
* rotateY() - ``transform: rotateY(130deg);``
* rotateZ() - ``transform: rotateZ(90deg);``

---
## CSS Переходы [(transition)](https://www.w3schools.com/css/css3_transitions.asp)

Example:
``` css
div {
	transition: width 2s, height 4s;
}
```

---
## CSS Анимации [(animation)](https://www.w3schools.com/css/css3_animations.asp)

Example:
``` css
@keyframes example {
    0%   {background-color:red; left:0px; top:0px;}
    25%  {background-color:yellow; left:200px; top:0px;}
    50%  {background-color:blue; left:200px; top:200px;}
    75%  {background-color:green; left:0px; top:200px;}
    100% {background-color:red; left:0px; top:0px;}
}

div {
    width: 100px;
    height: 100px;
    background-color: red;
    position: relative;
    -webkit-animation-name: example; /* Safari 4.0 - 8.0 */
    -webkit-animation-duration: 4s; /* Safari 4.0 - 8.0 */
    -webkit-animation-delay: 2s; /* Safari 4.0 - 8.0 */
    animation-name: example;
    animation-duration: 4s;
    animation-delay: 2s;
}
```

---
## CSS Flexbox

### Алгоритм раскладки во флексах
1. Определение базовых размеров
2. Перераспределение свободного места
3. Применение ограничений размеров(min-width, max-width, min-heigth, max-height)

### Определение базовых размеров - размер элемента вдоль главной оси

1. flex-basis (переопределяет width или height)
2. width (flex-basis: auto)
3. height (flex-basis: auto, width: auto)
4. размер содержимого (all: auto)

### Перераспределение свободного места

1. Изменение размеров гибких элементов (после этапа определения базовых размеров)  
* flex-grow: 0 - значение по умолчанию. Если больше 0 может поглотить свободное пространство.
Используется для резиновых раскладок и адаптивности без медиа выражений.
* flex-shrink: 1 - значение по умолчанию. Если больше 0 и есть отрицательное пространство, то элемент его поглощает и уменьшается.

2. Автоматические отступы ***margin: auto***
* Работает во всех направлениях
* Съедает свободное место
* Если у нескольких элементов есть автоматические отступы, то свободное место делится поровну
* Свободное место съедается до работы выравниваний - выравнивания ломаются

3. Выравнивание элементов. (вдоль главной оси и вдоль поперечной оси)
* Вдоль главной оси (justify-content: flex-start | flex-end | center | space-between | space-around)
* Вдоль поперечной оси (align-items | [align-self]: stretch | flex-start | flex-end | center | baseline)

### Ограничение размеров
* Минимальные и максимальные размеры не влияют на базовый размер.
* Применяются в самом конце расчета размеров и свободного пространства
* Возможны эффекты выпадения из потока

### Построение сеток на флексбоксах
* Всегда явно задавать размер колонок: width или flex-basis
* Если количество колонок может меняться то лучше использовать margin
* Не использовать псевдоэлементы у flex-контейнера
* flex-grow не подходит для точного соответствия макету
* Порядок элементов - order: 1
