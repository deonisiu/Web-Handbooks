# Шаблон проектирования MVC
* Построен на основе сохранения представления данных отдельно от методов, взаимодействующих с ними.
* M - model
  * Обработка и предоставление данных "Представлению"
  * Обеспечивает доступ к данным для просмотра, отбора или записи
* V - view
  * Перехватывает действия пользователя, передавая их "Контроллеру"
  * Выводит полученные данные от "Модели" пользователю (в HTML)
  * Между "Представлением" и "Контроллером" нет прямой связи — они соединяются с помощью "Модели".
* C - controller
  * Сборщик информации, которая передается в "Модель"
  * Подключается только к одному "Представлению" и одной "Модели"
  * Создает систему с односторонним потоком данных с одним входом и одним выходом в точках обмена данными
  * "Контроллер" получает задачи только когда пользователь взаимодействует с "Представлением"

* Простой пример на PHP:
```php
// Файл index.php
<?Php

class Model {
  public $string;
  public function __construct() {
    $this->string = "MVC + PHP = Awesome";
  }
}
?>

<?Php

class View {
  private $model;
  private $controller;
  public function __construct($controller, $model) {
    $this->controller = $controller;
    $this->model = $model;
  }
  public function output() {
    return '<p><a href="index.php?action=clicked">' . $this->model->string . "</a></p>";
  }
}
?>

<?php

class Controller {
  private $model;
  public function __construct($model) {
    $this->model = $model;
  }
  public function clicked() {
    $this->model->string = "Updated Data, thanks to MVC and PHP!";
  }
}
?>

<?php
$model = new Model();
$controller = new Controller($model);
$view = new View($controller, $model);

if (isset($_GET['action']) && !empty($_GET['action'])) {
  $controller->{$_GET['action']}();
}
echo $view->output();
?>
```