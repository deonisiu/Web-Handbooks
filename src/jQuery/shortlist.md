# jQuery shortlist

## Краткий список основных команд
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

// События
event.preventDefault();           -> (JS-1) метод отмены стандартного события
event.stopPropagation();          -> (JS-2) метод остановки "всплытия событий"
event.stopImmediatePropagation(); -> (JS-3) метод запрещает след. обработчики этого же события

$("#menu li a").click(function(event){...})           -> событие нажатия (обертка для .on+.trigger)
$("#menu li a").click(function(event){return false;}) -> return false -> вызывает JS-1 и JS-2

$(obj).on('someEvent', function(){...});  -> создаем обработчик произвольного события
$(obj).trigger('someEvent');              -> инициируем произвольное событие
$('.class').off();                        -> удаляем все обработчики
$('.class').off('click.namespace');       -> удаляем обработчики в пространстве имен

// Анимация

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
```

## Селекторы
```js
$("article h2") & $("article").finde("h2") -> одинаковые 2 выборки: все h2 внутри article
$("*")                    -> выбор всех элементов
$("h1 + p")               -> все p перед которыми стоит h1
$("h1 ~ p")               -> все p после h1
$("article > h2")         -> все h2 что прямые потомки от article
$("article > *")          -> все элементы что прямые потомки от article
$("div:last-child")       -> последний потомок
$("div:nth-child(2n+1)")  -> каждый нечетный потомок 

// По атрибутам
$("a[href]")                -> все ссылки с атрибутом «href» 
$("a[href=#]")              -> все ссылки с «href=#» 
$("a[href~=#]")             -> все ссылки с «#» где-то в «href» 
$("a[hreflang|=en]")        -> все ссылки, для которых hreflang начинается с «en» и обрезается по символу «-» — «en», «en-US», «en-UK» 
$("a[href^=http]")          -> ссылки начинающиеся с «http» 
$("a[href*="google.com"]")  -> ссылки на погуглить 
$("a[href$=.pdf]")          -> ссылки на PDF файлы (по идее)
```

## События
```js
change      — изменение значения элемента 
click       — клик по элементу (порядок событий: «mousedown» → «mouseup» → «click») 
dblclick    — двойной щелчок мышки 
resize      — изменение размеров элементов 
scroll      — скроллинг элемента 
select      — выбор текста для «input[type=text]» и «textarea» 
submit      — отправка формы 
focus       — фокус на элементе
blur        — фокус ушёл с элемента, актуально только для элементов «input[type=text]»
focusin     — фокус на элементе, срабатывает на предке элемента, для события «focus» 
focusout    — фокус ушёл с элемента, срабатывает на предке элемента, для события «blur»
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