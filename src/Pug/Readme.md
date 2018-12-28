# Pug (Jade)

Pug - это препроцессор HTML и шаблонизатор написанный на JavaScript для Node.js

## Ссылки

* [***Документация***](https://pugjs.org/api/getting-started.html)
* [GitHub page](https://github.com/pugjs/pug)
---
## Основы

### Простые теги
Pug
```
div
  p Hello!
  p World!
```
HTML
```html
<div>
  <p>Hello!</p>
  <p>World!</p>
</div>
```

### Добавление атрибутов в теги
Pug
```
div.movie-card#oceans-11
  h1.movie-title Ocean's 11
  img.movie-poster(src="/img/oceans-11.png")
  ul.genre-list
```
HTML
```html
<div class="movie-card" id="oceans-11">
  <h1 class="movie-title">Ocean's 11</h1>
  <img src="/img/oceans-11.png" class="movie-poster">
  <ul class="genre-list">
```

### Блоки текста
Pug
```
div
  p How are you?
  p.
    I'm fine thank you.
    And you? I heard you fell into a lake?
    That's rather unfortunate. I hate it when my shoes get wet.
```

### JavaScript в Pug

Начав строку с дефиса (-) компилятор pug использует javascript

Pug
```
- var x = 5;
div
  ul
    - for (var i=1; i<=x; i++) {
      li Hello
    - }
```
HTML
```html
<div>
  <ul>
    <li>Hello</li>
    <li>Hello</li>
    <li>Hello</li>
    <li>Hello</li>
    <li>Hello</li>
  </ul>
</div>
```

При использовании дефиса код js не попадает на прямую в поток. Для вывода в поток используется знак равенства (=)

Pug
```
- var x = 5;
div
  ul
    - for (var i=1; i<=x; i++) {
      li= i + ". Hello"
    - }
```
HTML
```html
<div>
  <ul>
    <li>1. Hello</li>
    <li>2. Hello</li>
    <li>3. Hello</li>
    <li>4. Hello</li>
    <li>5. Hello</li>
  </ul>
</div>
```

### Циклы в Pug

Pug имеет свой синтаксис для циклов (for, while)
```
- var droids = ["R2D2", "C3PO", "BB8"];
div
  h1 Famous Droids from Star Wars
  for name in droids
    div.card
      h2= name
```
HTML
```html
<div>
  <h1>Famous Droids from Star Wars</h1>
  <div class="card">
    <h2>R2D2</h2>
  </div>
  <div class="card">
    <h2>C3PO</h2>
  </div>
  <div class="card">
    <h2>BB8</h2>
  </div>
</div>
```

### Интерполирование

Вместо такого

Pug
```
- var profileName = "Danny Ocean";
div
  p= «Hi there, » + profileName + ". How are you doing?"
```
Можно писать так

Pug 
```
- var profileName = "Danny Ocean";
div
  p Hi there, #{profileName}. How are you doing?
```

### Миксины

Работают как функции, принимают параметры и генерируют разметку

Миксин :

Pug
````pug
mixin thumbnail(imageName, caption)
  div.thumbnail
    img(src="/img/#{imageName}.jpg")
    h4.image-caption= caption
````
Вызов Миксина через +

Pug
```
+thumbnail("oceans-eleven", "Danny Ocean makes an elevator pitch.")
+thumbnail("pirates", "Introducing Captain Jack Sparrow!")
```
HTML
```html
<div class="thumbnail">
  <img src="/img/oceans-eleven.jpg">
  <h4 class="image-caption">
    Danny Ocean makes an elevator pitch.
  </h4>
</div>
<div class="thumbnail">
  <img src="/img/pirates.jpg">
  <h4 class="image-caption">
    Introducing Captain Jack Sparrow!
  </h4>
</div>
```