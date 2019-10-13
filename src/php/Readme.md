# PHP

## Полезные ссылки

* [Установка PHP 7.1 в Windows. Командная строка](http://iantonov.me/page/ustanovka-php-71-v-windows-komandnaja-stroka)
* [Установка PHP 7 в картинках и с подробным описанием](https://sebweo.com/ru/ustanovka-php-7-v-kartinkah-i-s-podrobnym-opisaniem/)
* [PhpStorm – как подключить интерпретатор PHP и отладчик Xdebug](http://bogdanov-blog.ru/phpstorm-kak-podklyuchit-interpretator-php-i-otladchik-xdebug/)

---
## Магические методы

### Краткий список
```php
__construct()   -> Конструктор - инициализирует свойства объекта
__destruct()    -> Деструктор - закрывает файлы, разрывает соединения и т.п.
__call()        -> Запускается при вызове недоступных методов в контексте объект
__callStatic()  -> Запускается при вызове недоступных методов в статическом контексте
__get()         -> при записи данных в недоступные или несуществующие свойства
__set()         -> при чтении данных из недоступных или несуществующих свойств
__isset()       -> isset() или empty() на недоступных или несуществующих свойствах
__unset()       -> при вызове unset() на недоступном или несуществующем свойстве
__sleep()       -> когда объект подвергается сериализации при помощи функции serialize()
__wakeup()      -> при восстановлении объекта при помощи функции unserialize()
__toString()    -> при неявном преобразовании ссылки на объект в строку
__invoke()      -> вызывается, когда скрипт пытается выполнить объект как функцию
__set_state()   -> вызывается для тех классов, которые экспортируются функцией var_export()
__clone()       -> если определен, вызывается после завершения клонирования
__debugInfo()   -> вызывается функцией var_dump(), для вывода списка свойств объекта
```

---
## Операторы
```php
if($obj instanceof ClassName) // -> определяет, является ли текущий объект экземпляром указанного класса
```

# PHP ООП

## Основы

### Создание класса
```php
class ClassName {
  private $numb;          // Не может быть без модификатора доступа
  function method() {...} // По умолчанию public
}
```

### Создание объекта класса
```php
$object1 = new ClassName;     
$object2 = new ClassName();
```

### Доступ к свойствам и методам объекта
```php
$object->param1 = 5;
$object->param2 = "Hello";

$param = $object->getName();
$object->print("Hi");
```

### Константы в классах
```php
class ClassName {
  const NAME = "cls";
  const COUNT = 0;

  function test() {         // По умолчанию public
    //echo $this->NAME;     // Ошибка
    echo self::NAME;        // Верно
    echo ClassName::COUNT;  // Верно
  }
}
```

### Обращение к внутреннему содержимому
* Класса(static) -> ***self*** 
  * `self::method()` - внутри
  * `className::method()` - снаружи
* Объекта -> ***$this*** 
  * `$this->method()` - внутри
  * `$objectName->method()` - снаружи
* Константы -> ***const***
  * `self::constName` - внутри
  * `className::constName` - снаружи

### Неявное объявление свойств
* Не вызывает ошибку даже, если свойство $property в классе не объявлено:
```php
$this->property = 101;  // верно
$obj->property = 101;   // верно

$key = "test";
$obj->$key = 101; // верно создание свойства с именем test

File_Logger::$pass = "ZION10I"; // Fatal error - статические переменные нельзя так создать
```

### Клонирование объектов (clone)
* Копирует данные объекта побитно.
* После операции ***clone*** если переопределен вызывается метод `__clone()`
* Но если объявить метод `__clone()` закрытым (private) клонирование будет запрещено
```php
$x = new ClassName();
$y = clone $x;        // создание КОПИИ объекта $x
```

### Сериализация объектов
* Сериализация имеет ***каскадный*** характер
* Функции ***serialize()*** и ***unserialize()*** - работают с массивами и объектами
  * ***serialize()*** - упаковывает объект в строку
    * Метод `__sleep()` возвращает список имен свойств, подлежащих сериализации
    * Вызывается перед упаковкой объекта
    * Модификатор `public, protected, private` - при сериализации не имеет, значения
    * Все свойства не указанные в списке `__sleep()` игнорируются при упаковке
  * ***unserialize()*** - распаковка из строки в объект
    * Метод `__wakeup()` вызывается ***после распаковки***
* Если в свойстве объекта хранится другой объект
  * Будут вызваны методы `__sleep()` и `__wakeup()` внутреннего объекта
  * Даже если дочерние объекты хранятся в свойстве-массиве 

* Пример метода `__sleep()`
```php
public function __sleep() {
  return ['id', 'name', 'time'];
}
```

---
## Алгоритм сбора мусора
* Объекты ***без ссылок, немедленно*** вызывают свой деструктор и удаляются из памяти
* Любой объект имеет скрытое поле, хранящее ***счетчик ссылок***
* Удаление объекта или массива:
  1. Удалить все ссылки (содержит сам объект)
  2. Вызвать деструктор
  3. Освободить занимаемую память

### Циклические(кольцевые) ссылки
* ***Проблема*** - Когда родительский объект хранит ссылки на всех своих потомков, а потомки на своего родителя
  * После уничтожения ссылок на такие объекты, сборщик мусора их не удаляет
  * Аналогия: "ключи от машины в квартире, ключи от квартиры в сейфе, ключи от сейфа - в машине"
```php
class Father {}
```
* ***Проблема*** - Когда объект ссылается сам на себя
  * После уничтожения ссылки продолжает существовать в памяти
```php
class Station { public $exit; }
$object = new Station;
$object->exit = $object;  // ссылается сам на себя
unset($object);           // объект не будет удален
```
* ***ИТОГ*** - Сборщик мусора и деструктор ***"не срабатывают"***, когда в программе имеются ***кольцевые ссылки***

---
## Наследование

### Расширение класса (extends)
* Добавление новых методов и свойств в уже существующий класс
```php
class Base {
  public $numb;
  public $string;
  function __construct($name) {...}
  function method1() {...}
}

class Child extends Base {
  // Сразу имеет $numb, $string, method1()
  public $boolean;          // Добавление нового свойства
  function method2() {...}  // Добавление нового метода
}
```

### Доступ к методам базового класса (`parent::method_name()`)
```php
// Родитель
class Base {
  function __construct($name) {...}
  function method1() {...}
  function final method2() {...}      // Финальный метод (не наследуется)
}

final class Base2 {...}               // Финальный класс (не наследуется)

// Наследник
class Child extends Base {
  function __construct($name, $id) {  // Переопределение конструктора базового класса
    parent::__construct($name);       // Вызов конструктора базового класса
  }
  function method1() {                // Переопределение метода базового класса
    parent::method1();                // Вызов метода базового класса
  }
  function method2() {...}            // Ошибка! Нельзя переопределить final метод
}
```

### Позднее статическое связывание
* У конструкций `self` и константы `__CLASS__` имеется ограничение:
  * Они не позволяют переопределять статический метод в произвольных классах
```php
class Base {
  public static function title() { echo __CLASS__; }
  public static function test1() { self::title(); }
  public static function test2() { static::title(); }
}
class Child extends Base {
  public static function title() { echo __CLASS__; }
}
Child::test1(); // Выведет: Base
Child::test2(); // Выведет: Child
```

### Анонимные классы
* Позволяет создавать объекты "на лету"
```php
class Dumper {
  public static function print($obj) {
    print_r($obj);
  }
}

Dumper::print(new class {
  public $title;
  public function __construct() {
    $this->title = "Hello world";
  }
});
// Выведет: class@anonymous Object( [title] => Hellow world! )
```

### Полиморфизм
* Объект использует методы не собственного а производного класса, даже если производный еще не существует.
* Однотипная работа с различными классами
* Предоставляет единый программный интерфейс при различной реализации

### Абстрактные классы/методы
* Созданы для переопределения в производных классах
* Требует дальнейшего уточнения (реализации) в дочерних классах/методах
* Классы:
  * Запрещено создавать объекты `abstract` класса
* Методы:
  * Могут быть созданы только в `abstract` классе
```php
// Абстрактный класс
abstract class Base() {           // Нельзя создать объект класса
  // Абстрактный метод
  abstract public function id() {
    die("Абстрактный метод");     // Необходимо переопределить в производном классе
  }
}
```

### Виртуальные методы
* Методы переопределенные в производном классе.
```php
// Виртуальный метод
public function show() {
  echo "Виртуальный метод";   // Переопределен в производном классе
}
```

### Совместимость типов
* Объекты производных классов допустимо использовать в том же контексте, что и объекты базовых
```php
// Базовый абстрактный класс
abstract class Page {
  abstract public function render();
}
// Производный класс
class StaticPage extends Page {
  // Виртуальный метод от базового
  public function render() { echo "StaticPage Render"; }  
}
// Метод получающий объект базового типа
function test(Page $obj) { $obj->render(); }  

$staticPage = new StaticPage(); // Создание объекта производного класса            
test($staticPage);              // Верно! Вместо аргумента типа Page можно подставлять объект StaticPage
```

## Интерфейсы и трейты

### Множественное наследование в PHP запрещено

### Интерфейсы (interface)
* Представляет из себя по сути абстрактный класс
* ***Не имеет свойств***
* ***Не имеет тел у методов***
* Допускается описание констант ***const***
* Указывает список методов, их аргументы и модификаторы доступа
* Класс от интерфейса 
  * Содержит в себе ***все его методы***
  * Может реализовать сразу ***несколько*** интерфейсов
```php
interface Seo {
  public function keywords();     // Тело не указывается
  public function description();  // Тело не указывается
}
interface Tag {
  public function tags();         // Тело не указывается
}
class StaticPage extends Page implements Seo, Tag {
  public function keywords() {...}      // Обязательная реализация метода от интерфейса
  public function description() {...}   // Обязательная реализация метода от интерфейса
  public function tags() {...}          // Обязательная реализация метода от интерфейса
}
```

### Наследование интерфейсов
```php
interface Seo {
  public function keywords();     // Тело не указывается
  public function description();  // Тело не указывается
}
interface Tag {
  public function tags();         // Тело не указывается
}
interface Author extends Tag {
  public function info();         // Тело не указывается
}
// class News implements Seo, Author, Tag {  // ОШИБКА! Нельзя наследовать интерфейс дважды
class News implements Seo, Author {
  public function keywords() {...}      // Обязательная реализация метода от интерфейса
  public function description() {...}   // Обязательная реализация метода от интерфейса
  public function tags() {...}          // Обязательная реализация метода от интерфейса
  public function info() {...}          // Обязательная реализация метода от интерфейса
}
```

### Трейты (***trait***) - повторное использование кода в классах
* Содержат общие фрагменты классов
* Помогают уменьшить количество повторяемого кода от интерфейсов
* Можно "подмешивать" в любой класс
* Для включения в класс `use traitName1, traitName2;`
```php
trait Seo {
  private $ogs;
  public function keywords() { echo "keywords"; }
}
trait Tag {
  public function tags() { echo "tags"; }
}
class News {
  use Seo, Tag;     // Подключаем 2 трейта
}
$news = new News();
$news->keywords();  // Вызов метода трейта
$news->tags();      // Вызов метода трейта
```

### Трейты и наследование
* Трейты перегружают методы базового класса
* Методы текущего класса перегружают методы трейтов
```php
class Page {
  public function tags() { echo "tag1"; }
  public function authors() { echo "auth1"; }
}
trait Author {
  public function tags() { echo "tag2"; }     // Перегружает метод базового класса Page
  public function authors() { echo "auth2"; }
}
class News extends Page {
  use Author;
  public function authors() { echo "auth3"; } // Перегружает метод трейта Author
}

$news = new News();
$news->authors();   // Result: auth3
$news->tags();      // Result: tag2
```

### Конфликт трейтов
* Возникает если в двух трейтах определен метод с одним и тем же именем
* Решения:
  * Ключевое слово ***insteadof***
  * Ключевое слово ***as***
```php
trait Tag {
  public function tags() { echo "Tag::tags"; }
  public function authors() { echo "Tag::authors"; }
}
trait Author {
  public function tags() { echo "Author: :tags"; }
  public function authors() { echo "Author::authors"; }
}

class News {
  use Author, Tag {
    Tag::tags insteadof Author;
    Author::authors insteadof Tag;
    Author::tags as list;
  }
}

$news = new News();
$news->authors();   // Author::authors
$news->tags();      // Tag::tags
$news->list();      // Author::tags
```

---
## Пространства имен (ПИ*)
* ***Имеющий имя фрагмент программы, содержащий в себе функции, переменные, константы и другие именованные сущности.***
* Ещё один способ организации проекта
* Виртуальная иерархия, напоминающая файловую систему
* Позволяет избегать конфликтов со сторонними библиотеками
* При уникальном пространстве имен код не будет конфликтовать ни с каким другим
* ***Пространства имен `PHP` и `php` являются зарезервированными и не могут использоваться***

### Объявление ПИ*
* ***Оператор `namespace` должен располагаться в файле первым, до любых объявлений***
* Не рекомедуется использовать больше одного ПИ* в файле
* Действие ПИ* распространяется только на:
  * Классы
  * Интерфейсы
  * Трейты
  * Фукнции
  * Константы
```php
// файл namespace.php
<?php
namespace PHP7;

function show() { echo "show"; }

class Page {
  private $title;
  public function __construct($title = '') { $this->title = $title; }
}
?>

// файл use_namespace.php
<?php
require_once 'namespace.php';

$page = new PHP7\Page("Title"); // обращение к классу Page из namespace PHP7
PHP7\show();                    // обращение к функции show из namespace PHP7

?>
```

### Несколько ПИ* в одном файле
```php
// файл few.php
<?php
namespace PHP7\functions {
  function show() { echo "show"; }
}
namespace PHP7\classes {
  class Page {
    private $title;
    public function __construct($title = '') { $this->title = $title; }
  }
}

// файл use_few.php
<?php
require_once 'few.php';
$page = new PHP7\classes\Page("Title");   // обращение к классу Page из namespace PHP7\classes
PHP7\functions\show();                    // обращение к функции show из namespace PHP7\functions
```

### Иерархия ПИ*
* Относительные ссылки на элементы:
```php
// файл use_few.php
<?php
namespace PHP7;

require_once 'few.php';
$page = new classes\Page("Title");
functions\show();
```

* Доступ к глобальному ПИ*
```php
<?php
namespace PHP7;

function strlen($str) { return count(str_split($str)); }

// Это PHP7\strlen
echo strlen("Hello world");
// Это стандартная функция strlen()
echo \strlen("Hello world");
```

### Ключевое слово `namespace`
* В файле где объявлено ПИ* можно использовать `namespace` для ссылки на текущее ПИ*
```php
namespace PHP7;

// Две строки полностью эквивалентны
echo PHP7\strlen("Hello world");
echo namespace\strlen("Hello world");
```

### Импортирование
* Для работы с несколькими пространствами
* Создание псевдонимов через `use`
* Если имя после `as` совпадает с элементом, то можно его не указывать
```php
<?php
require_once 'few.php';

// Строки:
use PHP7\classes\Page as Page;    // Импортирование. Имя совпадает с элементом
use PHP7\functions as functions;  // Импортирование. Имя совпадает с элементом
// Можно заменить на:
use PHP7\classes\Page;            // Импортирование. Сокращенная запись
use PHP7\functions;               // Импортирование. Сокращенная запись

$page = new Page("Title");    // Более сокращенное обращение
functions\show();             // Более сокращенное обращение
```

### Автозагрузка классов ***__autoload()***
* Задает путь к каталогу с классами
* Автоматически подключает классы при обращении к ним в теле программы
```php
// Файл Seo.php
<?php
namespace PHP7;
trait Seo {...}
?>

// Файл Tag.php
<?php
namespace PHP7;
trait Tag {
  public function tags() { echo "tags"; }
}
?>

// Файл Page.php
<?php
namespace PHP7;
use \PHP7\Seo as Seo;   // Импортирование трейта Seo
use \PHP7\Tag as Tag;   // Импортирование трейта Tag

class Page {
  use Seo, Tag;         // Используем трейты в классе Page
  ...
}
?>

// Файл autoload.php
<?php
function __autoload($classname) {
  require_once(__DIR__ . "/$classname.php");
}
// Использование классов
$page = new PHP7\Page("Title");   // __autoload вызывается автоматически для подгрузки файла
$page->tags();                    // __autoload вызывается автоматически для подгрузки файла
?>
```

### Функция ***spl_autoload_register()***
* Из стандартной библиотеки классов SPL
* Позволяет зарегистрировать цепочку из функций автозагрузки
* Перебирает все функции пока не найдет класс, либо завершит выполнение программы с ошибкой
```php
// Файл autoload.php 2 вариант
<?php
spl_autoload_register();
// Использование классов
$page = new PHP7\Page("Title");   
$page->tags();                    
?>

// Файл autoload.php 3 вариант
<?php
// spl_autoload_register + анонимная функция
spl_autoload_register(function($classname) {
  require_once(__DIR__ . "/$classname.php");
});
// Использование классов
$page = new PHP7\Page("Title");   
$page->tags();                    
?>
```