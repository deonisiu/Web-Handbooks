# Sass/Scss

---
## Полезные ссылки

* [Sass documentation](https://sass-scss.ru/documentation/)

---
## Полезные заметки

---
## Основы Sass

Sass позволяет использовать переменные, вложенности, миксины, наследование.

### Синтаксис sass|scss

***.sass*** - основан на отступах и переходах на новую строку. Нет фигурных скобок

***.scss*** - похож на стандартный синтаксис CSS ***(предпочтительней чем .sass)***

***Все примеры далее на .scss***

### Фрагментирование
Фрагмент — это простой Sass-файл, имя которого начинается с нижнего подчеркивания, например, `_partial.scss`. Нижнее подчеркивание в имени Sass-файла говорит компилятору о том, что это только фрагмент и он не должен компилироваться в CSS. Фрагменты Sass подключаются при помощи директивы `@import`.

Sass импортирует указанный в директиве файл в тот, где он вызывается, т.е. на выходе получается один CSS-файл, скомпилированный из нескольких фрагментов.

`_reset.scss` + `base.scss` :
```scss
// _reset.scss
body, ul, ol {
  margin: 0;
  padding: 0;
}

// base.scss
@import 'reset';

body {
  font: 100% Helvetica, sans-serif;
  background-color: #efefef;
}

// base.css
body, ul, ol {
  margin: 0;
  padding: 0;
}

body {
  font: 100% Helvetica, sans-serif;
  background-color: #efefefe;
}
```

### Переменные 

Создание переменной $varName :
```sass
$var: red;
$font-stack: Helvetica, sans-serif;
$primary-color: #333;

body {
  font: 100% $font-color;
  color: $primary-color;
  background-color: $var;
}
```

### Интерполяция переменных (используется редко)

Частичная подстановка имен свойств с помощью переменных :

```sass
SASS                                CSS

$where: bottom;                     .no-bottom {
                                      border-bottom: none;
.no-#{$where} {                     }
  border-#{$where}: none;
}
```

### Математические операции

* Препроцессоры не могут использовать относительные еденицы : `%`, `em`, `vw`.

* Но есть возможность перевода `px` в `%`
```scss
// SCSS                                   // CSS

.container {                              .container {
  width: 100%;                              width: 100%;
}                                         }

article {                                 article {
  float: left;                              float: left;
  width: 600px / 960px * 100%;              width: 62.5%;
}                                         }
```

* Работают только с пикселями `px`

* Работают со всеми простыми операциями `+`, `-`, `*`, `/`, `%`

```sass
$body-font-size: 16px;

body {
  margin-left: -10px * 2;
  font-size: $body-font-size * 1.25;
}
```

### Цвета

Основные функции цвета :
```scss
adjust-hue($color, $degrees)  - изменение оттенка цвета hsl(h)
rgba($color, $alpha)          - изменение альфа канала
lighten($color, $amount)      - сделать цвет светлее hsl(l)
darken($color, $amount)       - сделать цвет темнее hsl(l)
saturate($color, $amount)     - более насыщенный цвет hsl(s)
desaturate($color, $amount)   - менее насыщенный цвет hsl(s)
```

Пример :
```scss
// Scss                                       // Css

body {                                        body {
  color: rgba(#302682, 0.5%);                   color: rgba(48, 38, 130, 0.5);
  color: desaturate(#302682, 30%);              color: #443f69;
  color: lighten(#302682, 20%);                 color: #5445c9;
}                                             }
```

### Вложенность

* Удобно использовать для псевдоклассов :
```scss
// Scss                     // Css

.link {                     .link {                        
  color: tomato;              color: tomato;
                            }
  &:hover,                  .link:hover,
  &:focus {                 .link:focus {
    color: plum;              color: plum;
  }                         }
}
```
* Удобно использовать для псевдоэлементов :
```scss
// Scss                     // Css

.item {                     .item {
  color: tomato;              color: tomato;
  &::before {               }
    content: "-";           .item::before {
  }                           content: "-";
}                           }
```
* Удобно использовать для модификаторов :
```scss
// Scss                     // Css

.button {                   .button {
  width: 100px;               width: 100px;
  &--wide {                 }
    width: 500px;           .button--wide {
  }                           width: 500px;
}                           }
```
* Не используется для элементов по BEM `&__icon`

* Максимальная вложенность не должна превышать 2 уровня

---
### Примеси (mixins)

Миксины позволяют определить стили, которые могут быть использованы повторно в любом месте документа. Они также могут принимать аргументы.

```scss
// Scss                         // Css

// simple mixin

@mixin large-text {
  font-size: 20px;
  color: white;
}

// using mixin

.page-title {                   .page-title {
  @include large-text;            font-size: 20px;
  padding: 4px;                   color: white;
  margin-top: 10px;               padding: 4px;
}                                 margin-top: 10px;
                                }
```

### Аргументы в миксинах

```scss
@mixin big-border($color, $width) { // два аргумента $color, $width
  border: {
    color: $color;
    width: $width;
    style: dashed;
  }
}

p { 
  @include big-border(blue, 5px); // передаем значения аргументов в миксин
}
```

Миксин со ***значениями по умолчанию*** :

```scss
@mixin big-border($color, $width: 5px) { // $width имеет значение по умолчанию = 5px
  border: {
    color: $color;
    width: $width;
    style: dashed;
  }
}
p { @include big-border(blue); }
```

### Переменные аргументы

Sass поддерживает возможность передачи ***"переменных аргументов"*** - это такие аргументы, которые передаются последними в функцию или миксин, получают все остальные переданные параметры и упаковывают их в список.

```scss
@mixin box-shadow($shadows...) {
  -moz-box-shadow: $shadows;
  -webkit-box-shadow: $shadows;
  box-shadow: $shadows;
}

.shadows {
  @include box-shadow(0px 4px 5px #666, 2px 6px 10px #999);
}

// css

.shadows {
  -moz-box-shadow: 0px 4px 5px #666, 2px 6px 10px #999;
  -webkit-box-shadow: 0px 4px 5px #666, 2px 6px 10px #999;
  box-shadow: 0px 4px 5px #666, 2px 6px 10px #999;
}
```

```scss
@mixin colors($text, $background, $border) {
  color: $text;
  background-color: $background;
  border-color: $border;
}

$values: #ff0000, #00ff00, #0000ff;
.primary {
  @include colors($values...);
}

$value-map: (text: #00ff00, background: #0000ff, border: #ff0000);
.secondary {
  @include colors($value-map...);
}


// css

.primary {
  color: #ff0000;
  background-color: #00ff00;
  border-color: #0000ff;
}

.secondary {
  color: #00ff00;
  background-color: #0000ff;
  border-color: #ff0000;
}
```