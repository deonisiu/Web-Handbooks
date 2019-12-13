# jQuery - JavaScript Framework

* [jQuery shortlist](shortlist.md)
* [jQuery для начинающих](https://antonshevchuk.gitbooks.io/jquery-for-beginners/content/)
* [jQuery живые примеры](https://anton.shevchuk.name/book/code/)

---

<details>
  <summary><b>Основы</b></summary>

---

* jQuery - производит манипуляции с html-элементами, управляя их поведением и используя DOM, для изменения структуры веб-страницы.
* Выполнение различных сценариев возможно ***только после полной загрузки*** структуры документа `document`, когда браузер преобразует html-код страницы в дерево DOM.

### Создание нового элемента html
* `$("<div></div>")`
* Можно передать второй параметр с доп. атрибутами: - предпочтительный
```js
$("<img/>", {src: "images/flower.jpg"});

$("<img/>", 
{src: "images/flower.jpg",
title: "Rose_in_garden",
click: function() {...}
}).appendTo("body");
```

### Свойства элементов меняются только через `.prop`
```js
selectedIndex
tagName
nodeName
nodeType
ownerDocument
defaultChecked
defaultSelected
```

### Методы jQuery
* Общий вид: `$("селектор").имяМетода(параметры);`

* Функция `$()` возвращает объект jQuery, содержащий массив элементов DOM — так называемый ***обернутый набор***, соответствующих указанному селектору.
```js
$(function() {...});    -> func запускаемая после загрузке document
jQuery() or $()         -> поиск элементов на странице, создание новых элементов
$("tag")                -> выбор по tag
$("#id")                -> выбор по id
$(".class")             -> выбор по class
$("div.class tag #id")  -> доступна любая смешанная выборка

// Основные методы
.prev()                       -> выбор предыдущего элемента
.next()                       -> выбор следующего элемента
.children()                   -> все прямые потомки
.parent()                     -> все прямые предки
.css(property)                -> получение значения CSS свойства 
.css(property, value)         -> установка значения CSS свойства 
.css({key: value, key:value}) -> установка нескольких значений

.addClass(className)        -> добавление класса элементу
.hasClass(className)        -> проверка на причастность к определённому классу
.removeClass(className)     -> удаление класса
.toggleClass(className)     -> переключение класса (1-появляется, 2-удаляется)
.attr(attrName)             -> получение значения атрибута (href, src)
.attr(attrName, attrValue)  -> установка значения атрибута
.removeAttr(attrName)       -> удаление атрибута
.prop(propName)             -> получение значения свойства (checked, disabled)
.prop(propName, propValue)  -> установка значения свойства
.removeProp(propName)       -> удаление свойства 
```

</details>

---

<details>
  <summary><b>"best practices"</b></summary>

---

### Вся логика внутри функции `.ready`, отработает после загрузки документа 
```js
$(function() {
  // all logic here
  $("h2").css("color", "red");
});

// 2 вариант
$(document).ready(function() {
  // all logic here
});
```

### Выбор по идентификатору элемента — самый быстрый из возможных
```js
$("#content")
```

### Необходимо всегда сохранять результаты поиска в переменных
```js
// плохо 
$("a.button").addClass("active");
$("a.button").click(function(){ /* ... */ });

// хорошо 
var $button = $("a.button"); 
$button.addClass("active");
$button.click(function(){ /* ... */ });
```

### Использовать более простые селекторы
```js
// было 
$(".content div input:disabled");

// стало 
$(".content div").find("input:disabled");
```

### Про формы 
* Для отключения элементов формы, и для проверки/изменения состояния чекбоксов мы всегда используем метод ***.prop()***
```js
$('#check').prop('checked', true);
$('#check').prop('disabled', true);
```

</details>

---

<details>
  <summary><b>События</b></summary>

---

<details>
  <summary><b>Список</b></summary>

```js
change      — изменение значения элемента 
click       — клик по элементу (порядок событий: «mousedown» → «mouseup» → «click») 
dblclick    — двойной щелчок мышки 
resize      — изменение размеров элементов 
scroll      — скроллинг элемента 
select      — выбор текста для «input[type=text]» и «textarea» 
submit      — отправка формы 
focus       — фокус на элементе
focusin     — фокус на элементе, срабатывает на предке элемента, для события «focus» 
focusout    — фокус ушёл с элемента, срабатывает на предке элемента, для события «blur»
blur        — фокус ушёл с элемента, актуально только для элементов «input[type=text]»
keydown     — нажатие клавиши на клавиатуре 
keypress    — нажатие клавиши на клавиатуре, последовательность «keydown → keypress → keyup» 
keyup       — отжатие клавиши на клавиатуре 
mousedown   — нажатие клавиши мыши 
mouseup     — отжатие клавиши мыши 
mousemove   — движение курсора 
mouseenter  — наведение курсора, не срабатывает при переходе фокуса на дочерние элементы 
mouseleave  — вывод курсора из элемента, не срабатывает при переходе фокуса на дочерние элементы 
mouseover   — наведение курсора на элемент 
mouseout    — вывод курсора из элемента
touchstart  — событие схоже с «mousedown», происходит при касании пальцем экрана 
touchend    — убираем палец с экрана, ака «mouseup» 
touchmove   — водим пальцем по экрану — «mousemove» 
touchcancel — странное событие, отмена «touch» до того, как палец был убран
```

</details>

### Работа с событиями
```js
on(event, handler)  - добавление обработчика
trigger(event)      – инициация события из скрипта
off(event)          – отключение обработчика событий
```

```js
$("p").on("click", function() {
    $(this).css("color", "red");
});

// запуск события программно
$("p").trigger("click");

// отключить событие
$("p").off("click");
```

### Остановка действий по умолчанию
```js
$("a").click(function(event) {
    event.preventDefault(); // функция остановки действий по умолчанию
    alert("Hello!");
})

// 2 способ вызвать остановку + перехват
$("a").click(function(event) {
    return false; // event.preventDefault() + event.stopPropagation()
})
```

### Всплытие и перехват

***Всплытие*** - Когда на элементе происходит событие, обработчики сначала срабатывают на нём, потом на его родителе, затем выше и так далее, вверх по цепочке предков.
```js
// при клике на <p> метод onclick будет вызван 3 раза: p > div > form
<form onclick="alert('form')">FORM
  <div onclick="alert('div')">DIV
    <p onclick="alert('p')">P</p>
  </div>
</form>
```

***Перехват*** - прекращение всплытия
```js
$("p").on("click", function(event) {
  event.stopPropagation(); // прекращение всплытия
});
```

***Остановка*** - полностью остановить обработку
```js
$("p").on("click", function(event) {
  event.stopImmediatePropagation(); // полная остановка
});
```

### Пространства имён
```js
$("p").on("click.namespace", function(event){...}); // создание события в пространстве имен namespace
$("p").trigger("click.namespace");
$("p").trigger("click.other");
$("p").trigger("click"); // все (namespace, other)
$("p").trigger("click.$"); // все кроме namespace, other
$("p").off("click.namespace"); // удаляем все обработчики click в данном пространстве имён
$("p").off(".namespace"); // // удаляем все обработчики в данном пространстве имён
```

### Живые события
#### Добавление обработчиков событий для элементов, которые добавляются на страницу динамически
```js
$(document).on("click", "tag-name", function() {...});
$(document).on("click", "#tag-id", function() {...});
$(document).on("click", ".class-name", function() {...});
```

### Обработчик событий для объекта
```js
// объект проще некуда
var obj = {
    test:function() {
        console.log("obj.test");
    }
}

// создаём обработчик произвольного события someEvent
$(obj).on("someEvent", function(){
    console.log("obj.someEvent");
    this.test();
});

// полюбопытствуем результатом
console.log(obj);

// инициируем событие someEvent
$(obj).trigger("someEvent");
```

### Получить все обработчики событий
```js
$._data(element, "events");
```

</details>

<details>
  <summary><b>Анимация</b></summary>

---

<details>
  <summary><b>Список</b></summary>

```js
// (CSS:display)
$('img').show(); -> показать
$('img').show(400);
$('img').hide(); -> спрятать
$('img').hide('slow'); // **slow == 600**, **fast == 200**
$('img').toggle(); -> спрятать/показать

$('img').hide('slow', function(){alert("Images was hidden");});

// подобный эффект как у show/hide (CSS:высота блоков)
$('img').slideUp();   -> спрятать
$('img').slideDown(); -> показать
$('img').slideToggle();

// изменение прозрачности (CSS:opacity)
$('img').fadeIn()            –> изменяет «opacity» от 0 до предыдущего значения
$('img').fadeOut()           –> изменяет «opacity» от текущего до 0
$('img').fadeToggle()        –> переключатель между «In» и «Out»
$('img').fadeTo("slow", 0.5) –> изменяет значение «opacity» до требуемого значения

// основной метод анимаций ".animate()"
$('img').animate({'opacity': 'hide'})
$('img').animate({'opacity': 'show'})
$('img').animate({'opacity': 0.5,'height': '100px','width': '100px'})
$('img').animate({'opacity': '+=0.1','height': '+=12px','width': '+=20px'})

```

</details>

### [doc .animate()](https://api.jquery.com/animate/)
```js
.animate(properties [,duration=400] [,easing=swing] [,complete])
.animate(properties, options)
  options: duration=400, easing=swing, queue=true, specialEasing, step, progress, complete, start, done, fail, always

- duration – скорость анимации
- easing – функция («linear» или «swing»)
- queue – флаг/параметр очереди; чуть позже опишу подробнее
- specialEasing – хэш, в котором можно описать, какую именно easing-функцию следует использовать для изменения определённых параметров
- step – функция, которая будет вызвана на каждом шаге анимации для каждого CSS-свойства; о ней расскажу чуть ниже
- complete – функция, которая будет вызвана после окончания анимации
- start – функция, которая будет вызвана до начала анимации
- progress – функция, которая будет вызвана на каждом шаге, но только единождый для элемента, вне зависимости от количества CSS-свойств
- done – функция, которая будет вызвана после успешного окончания анимации
- fail – функция, которая будет вызвана после неудачного окончания анимации
- always – функция, которая будет вызвана после окончания анимации при любом исходе
```
* Примеры
```js
$('img').animate({'opacity': 'hide'})
$('img').animate({'opacity': 0.5,'height': '100px','width': '100px'})
$('img').animate({'height': '+=10px','width': '+=10px'}, {
  'start':    () => console.log('start'),
  'progress': () => console.log('progress'),
  'done':     () => console.log('done'),
  'fail':     () => console.log('fail'),
  'always':   () => console.log('always')
})
```

### Последовательная и параллельная анимация (queue)
```js
// последовательная 
$('#box').animate({left:'-=100'}).animate({top:'-=100'});                 // (queue:true) default

// параллельная 
$('#box').animate({left:'+=100'}).animate({top:'+=100'}, {queue:false});  // (queue:false)
```

### Остановка анимации [doc .stop](https://api.jquery.com/stop/)
```js
.stop([clearQueue] [,jumpToEnd])
.stop([queue] [,clearQueue] [,jumpToEnd])

queue — имя очереди; для работы с очередью анимации «fx» данный параметр опускаем («fx» – очередь по умолчанию)
clearQueue — флаг очистки очереди
jumpToEnd — применить результат анимации, али нет
```

### Отключить всю анимацию
```js
jQuery.fx.off = true;
```

</details>

<details>
  <summary><b>Манипуляция с DOM</b></summary>

---

<details>
  <summary><b>Список</b></summary>

```js
// Манипуляции над элементами
.after(content)         - вставляет контент `после` каждого элемента из выборки
.append(content)        - вставляет контент `в конец` каждого элемента из выборки
.appendTo(target)       - запись наоборот.insertAfter(target)   - запись наоборот
.before(content)        - вставляет контент `перед` каждым элементом из выборки
.clone(withDataAndEvents) - клонирует выбранные элементы, для дальнейшей вставки копий назад в DOM, позволяет так же копировать и обработчики событий
.detach()               - удаляет элемент из DOM, но при этом сохраняет все данные о нём в jQuery; следует использовать, если надо лишь временно удалить элемент
.empty()                - удаляет текст и дочерние DOM-элементы
.html()                 - возвращает HTML заданного элемента
.html(newHtml)          - заменяет HTML в заданном элементе
.insertBefore(target)   - запись наоборот
.prepend(content)       - вставляет контент `в начало` каждого элемента из выборки
.prependTo(target)      - запись наоборот
.replaceWith(content)   - заменяет найденные элементы новым
.replaceAll(target)     - запись наоборот
.remove()               - насовсем удаляет элемент из DOM
.text()                 - возвращает текст заданного элемента
.text(newText)          - заменяет текст внутри выбранных элементов
.unwrap()               - удаляет родительский элемент у найденных элементов
.wrap(element)          - оборачивает каждый найденный элемент новым элементом
.wrapAll(element)       - оборачивает все найденные элементы вместе новым элементом
.wrapInner(element)     - оборачивает контент каждого найденного элемента новым элементом

// Методы для работы с размерами и координатами
.offset()                 - возвращает позицию DOM-элемента относительно document, данные будут получены в виде объекта: «{ top: 10, left: 30 }»
.offset({top:10,left:30}) - устанавливает расположение DOM-элемента по указанным координатам
.position()               - возвращает позицию DOM-элемента относительно родительского элемента
.height()                 - возвращает высоту элемента за вычетом отступов и границ
.height(height)           - устанавливает высоту всех элементов в выборке, default: px
.width() и .width(width)  - ведут себя аналогично методу «.height()», но работают с шириной элемента
.innerHeight() и .innerWidth() – возвращают, соответственно, высоту и ширину элемента, включая «padding»
.outerHeight() и .outerWidth() – возвращают высоту и ширину элемента, включая «padding» и «border»
.outerHeight(true) и .outerWidth(true) – возвращают высоту и ширину элемента, включая «padding», «border» и «margin»
.scrollLeft()             – возвращает значение «проскролленности» по горизонтали для первого элемента из выборки
.scrollLeft(value)        – устанавливает значение горизонтального скролла для каждого элемента из выборки
.scrollTop()              – возвращает значение «проскролленности» по вертикали для первого элемента из выборки
.scrollTop(value)         – устанавливает значение вертикального скролла для каждого элемента из выборки
```

</details>

### Создание элементов
```js
// js faster
var myDiv = document.createElement('div');
myDiv.id = 'my';
myDiv.className = 'some';

// jquery
var $myDiv = $('<div>').attr({'id':'my', 'class':'some'});
```

</details>

<details>
  <summary><b>AJAX</b></summary>

* AJAX - Asynchronous Javascript and XML
* Суть - фоновый обмен данными браузера с веб-сервером

### Загрузка HTML-кода в DOM-элемент на странице (.load)
* **.load** - обертка над **$.ajax()**
```js
.load()
  - url       – запрашиваемой страницы
  - data      – передаваемые данные (необязательный параметр)
  - callback  – функция, которая будет вызвана при завершении запроса к серверу (необязательный параметр)

// пример: в id="content" будет вставлен HTML с указанной страницы
$("#content").load("../code/html.example.html");

// только выбранный по указанному селектору id="intro"
$("#content").load("../code/html.example.html #intro");

// обрабатываем полученные данные
$("#content").load("../code/html.example.html #intro", function(data) {...});

// передаём данные на сервер вторым параметром
$("#content").load("../code/html.example.html #intro", {id: 42});
```

### Основной метод $.ajax()
* Методы обёртки
```js
get(url, data, success, dataType)   — загружает данные методом GET
post(url, data, success, dataType)  — загружает данные методом POST
getScript(url, success)             — загружает JavaScript с сервера методом GET

// пример пост запроса
$.post(
    DIR+'/ajax.php',
    {
        cmd : $(this)[0].classList[1],
        data : $(this).data('table'),
    }
).done(function(answer) {
    if(answer.status === true)
    {
        popupWrapper.innerHTML = answer.data;
    } else {
        popupWrapper.innerHTML = '<div class="alert alert-danger" role="alert">' + answer.message + '</div>';
    }
}).fail(function(error){
    popupWrapper.innerHTML = '<div class="alert alert-danger" role="alert">' + error + '</div>';
});
```

```js
$.ajax({
    url: "/get-my-page.html", // указываем URL
    method: "GET",            // HTTP метод, по умолчанию GET
    data: {"id": 42},         // данные, которые отправляем на сервер
    dataType: "html",         // тип данных загружаемых с сервера
    success: function (data) {
        // вешаем свой обработчик события success
        $("#content").html(data);
    }
});
```

### AJAX события
```php
ajaxStart     — в случае, первого AJAX-запрос, и при этом нет других активных AJAX запросов
beforeSend    — до отправки запроса, и позволяет редактировать XMLHttpRequest, локальное событие
ajaxSend      — до отправки запроса, как и «beforeSend»
success       — по возвращении ответа, когда в нём нет ошибок, локальное событие
ajaxSuccess   — по возвращении ответа, аналогично событию «success»
error         — в случае ошибки, локальное событие
ajaxError     — в случае ошибки
complete      — по завершении текущего AJAX-запроса, локальное событие
ajaxComplete  — глобальное событие, аналогичное complete
ajaxStop      — в случае, когда больше нет активных AJAX-запросов

// примеры
$(document).on("ajaxSend", function() {
    $("#loading").show(); // показываем элемент
}).on("ajaxStop", function(){
    $("#loading").hide(); // скрываем элемент
});

$.ajax({
    beforeSend: function() {
        // данный обработчик будет вызван перед отправкой данного AJAX-запроса
    },
    success: function() {
        // а этот при удачном завершении
    },
    error: function() {
        // этот при возникновении ошибки
    },
    complete: function() {
        // и по завершении запроса (удачном или нет)
    }
});
```

</details>

<details>
  <summary><b>Объект Deferred</b></summary>

* Позволяет заставлять асинхронный JavaScript работать так, как нам хочется.
* Всё, что относится к Promise верно и для Deferred.
```js
// создание объекта Deferred
var D = $.Deferred();

// подключение +функций
D.then(function() { console.log("first") });
D.then(function() { console.log("second") });

// подключение -функций
D.catch(function() { console.log("fail") });

// метод always будет выполнен вне зависимости от выбранного статуса
// в действительности, внутри происходит вызов «.done(arguments)»
D.always(function() { console.log("always") });

// затем вызываем один из 2 статусов - fulfilled(+) или rejected(-)
// D.resolve(); || D.reject();

// изменяем статус на «fulfilled» - «выполнен успешно»
// для этого вызываем resolve()
// наши обработчики будут вызваны в порядке очереди, но они не ждут друг друга
D.resolve();

// данный обработчик подключён слишком поздно и будет вызван сразу
D.then(function() { console.log("third") });
```
* Блок-схема
![deferred](https://user-images.githubusercontent.com/33727234/70408381-8b159080-1a7a-11ea-9052-b8a924101239.jpg)

* Существуют ещё методы «.resolveWith()» и «.rejectWith()», они позволяют изменять контекст вызываемых callback-функций (т.е. внутри них «this» будет смотреть на указанный контекст).

### Цепочки вызовов
```js
var D = $.Deferred();

D.then(function() {
  // подождём окончания AJAX-запроса
  return $('article img').slideUp(2000).promise() // если убрать return то след. then наступит сразу же
})
.then(function(){
  // подождём, пока спрячутся картинки
  return $('article p').slideUp(2000).promise()   // если убрать return то след. then наступит сразу же
})
.then(function(){
  // подождём, пока спрячутся параграфы
  return $('article').hide(2000).promise()        // если убрать return то след. then наступит сразу же
})
.then(function(){
  // всё сделано
});

D.resolve();
```

### Методы .notify() & .progress()
* Первый(.notify) шлёт послания в callback-функции, которые зарегистрированы с помощью второго(.progress).
```js
var D = $.Deferred();

var money = 100; // наш бюджет

// съём денежки
D.progress(function($){
    console.log(money + " - " + $ + " = " + (money-$));
    money -= $;
    if (money < 0) { // деньги закончились
        D.reject();
    }
});

// тратим деньги
setTimeout(function(){ D.notify(40); }, 500);  // покупка 1
setTimeout(function(){ D.notify(50); }, 1000); // покупка 2
setTimeout(function(){ D.notify(30); }, 1500); // покупка 3

D.then(function(){ console.info("All Ok") });
D.catch(function(){ console.error("Insufficient Funds") });
```

</details>

<details>
  <summary><b>Объект Callbacks</b></summary>
* Позволяет составлять списки функций обратного вызова
* Нет разделения на позитивный и негативный сценарии
* Стек функций, который будет выполнен по команде .fire()

```js
var C = $.Callbacks();

C.add(function(msg) {
    console.log(msg + " first")
});

C.add(function(msg) {
    console.log(msg + " second")
});

C.fire("Go");
C.fire("Go2");

// result in console:
// Go first
// Go second
// Go2 first
// Go2 second
```
* Может принимать параметры:
```js
$.Callbacks('once')         - все функции будут вызваны единожды (аналогично как в объекте Deferred)
$.Callbacks('memory')       - сохранять значение с последнего вызова «.fire()», и скармливать его в ново-зарегистрированные функции обратного вызова, и лишь потом обрабатывает новое значение
$.Callbacks('unique')       - список функций обратного вызова фильтруется по уникальности
$.Callbacks('stopOnFalse')  - как только какая-нибудь функция вернёт «false», процесс запуска остановится
```

</details>