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
doctype html
div
  p Hello!
  p World!
```
HTML
```html
<!DOCTYPE html>
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

### Текст
Pug
```
div
  p How are you?
  p.
    I'm fine thank you.
    And you? I heard you fell into a lake?
    That's rather unfortunate. I hate it when my shoes get wet.
```

Непосредственно в Pug можно вставлять элементы в HTML синтаксисе
```
p This is plain old <em>text</em> content.
```

### Комментарии

Существуют различные комментариев: те, которые будут отображаться после компиляции, и те, которые пропадут.

Pug
```pug
// just some paragraphs
//- will not output within markup
p foo
p bar
```
HTML
```
<!-- just some paragraphs-->
<p>foo</p>
<p>bar</p>
```

### JavaScript в Pug

Начав строку с дефиса (-) компилятор pug использует javascript

Pug
```pug
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

---

При использовании дефиса код js не попадает на прямую в поток. Для вывода в поток используется знак равенства (=)

Pug
```pug
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

---
Pug
```pug
- var authenticated = true
body(class=authenticated ? 'authed' : 'anon')
```
HTML
```html
<body class="authed"></body>
```

---
Pug
```pug
- var classes = ['foo', 'bar', 'baz']
a(class=classes)

//- the class attribute may also be repeated to merge arrays
a.bang(class=classes class=['bing'])
```
HTML
```html
<a class="foo bar baz"></a>
<a class="bang foo bar baz bing"></a>
```

### Условия

Pug
```pug
- var user = { description: 'foo bar baz' }
- var authorised = false
#user
  if user.description
    h2.green Description
    p.description= user.description
  else if authorised
    h2.blue Description
    p.description.
      User has no description,
      why not add one...
  else
    h2.red Description
    p.description User has no description
```
HTML
```html
<div id="user">
  <h2 class="green">Description</h2>
  <p class="description">foo bar baz</p>
</div>
```

### Switch case
Pug
```pug
- var friends = 10
case friends
  when 0
    p you have no friends
  when 1
    p you have a friend
  default
    p you have #{friends} friends
```
HTML
```html
<p>you have 10 friends</p>
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

---
Pug
```pug
ul
  each val, index in ['zero', 'one', 'two']
    li= index + ': ' + val
```
HTML
```html
<ul>
  <li>0: zero</li>
  <li>1: one</li>
  <li>2: two</li>
</ul>
```

---
Pug
```pug
- var values = [];
ul
  each val in values
    li= val
  else
    li There are no values
```
HTML
```html
<ul>
  <li>There are no values</li>
</ul>
```

---
Pug
```pug
- var n = 0;
ul
  while n < 4
    li= n++
```
HTML
```html
<ul>
  <li>0</li>
  <li>1</li>
  <li>2</li>
  <li>3</li>
</ul>
```

###  Инклюды (Includes)

Pug имеет возможность вставки содержимого одного файла в другой файл Pug.

Pug
```pug
//- index.pug
doctype html
html
  head
    style
      include style.css
  body
    h1 My Site
    p Welcome to my super lame site.
    script
      include script.js
```

### Интерполирование

Pug
```pug
- var title = "On Dogs: Man's Best Friend";
- var author = "enlore";
- var theGreat = "<span>escape!</span>";

h1= title
p Written with love by #{author}
p This will be safe: !{theGreat}
```
HTML
```html
<h1>On Dogs: Man's Best Friend</h1>
<p>Written with love by enlore</p>
<p>This will be safe: <span>escape!</span></p>
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

---
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

---
Pug
```pug
mixin article(title)
  .article
    .article-wrapper
      h1= title
      if block
        block
      else
        p No content provided

+article('Hello world')

+article('Hello world')
  p This is my
  p Amazing article
```
HTML
```html
<div class="article">
  <div class="article-wrapper">
    <h1>Hello world</h1>
    <p>No content provided</p>
  </div>
</div>
<div class="article">
  <div class="article-wrapper">
    <h1>Hello world</h1>
    <p>This is my</p>
    <p>Amazing article</p>
  </div>
</div>
```