# Bootstrap 3

---
## Основы

### Подключение Bootstrap 3 CDN

```html
<!-- in head Bootstrap -->

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- in body for JS -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

```

### Сетка

В сетке всего 12 колонок в ряду (row)

Имеет 4 класса:
* `col-xs-` (Для телефонов - экран меньше 768px)
* `col-sm-` (Для планшетов - экран 768px или больше)
* `col-md-` (Для ноутбуков - экран 992px или больше)
* `col-lg-` (Для ноутбуков и настольных - экран 1200px или больше)

#### Базовая структура сетки
```html
<div class="row">
	<div class="col-*-*"></div>
	<div class="col-*-*"></div>
	<div class="col-*-*"></div>
</div>
```
Где первая * класс(xs,sm,md,lg), вторая * размер колонки (1-12)
```html
<div class="col-md-4"></div>
```
Если какой-либо класс не задан, используются размеры предыдущего.

<table class="table table-bordered table-striped"><thead><tr><th></th>
          <th>
            Очень маленькие устройство <small>Телефоны  (&lt;768px)</small>         </th>
          <th>
            Малые устройства
         <small>Планшеты (≥768px)</small>
          </th>
          <th>
            Средние устройства
        <small>Настольные (≥992px)</small>
          </th>
          <th>
            Большие устройства
       <small>Настольные (≥1200px)</small>
          </th>
        </tr></thead><tbody><tr><th class="text-nowrap" scope="row">Поведение разметки</th>
          <td>Horizontal at all times</td>
          <td colspan="3">Collapsed to start, horizontal above breakpoints</td>
        </tr><tr><th class="text-nowrap" scope="row">Ширина контейнера</th>
          <td>None (auto)</td>
          <td>750px</td>
          <td>970px</td>
          <td>1170px</td>
        </tr><tr><th class="text-nowrap" scope="row">Класс префикса</th>
          <td><code>.col-xs-</code></td>
          <td><code>.col-sm-</code></td>
          <td><code>.col-md-</code></td>
          <td><code>.col-lg-</code></td>
        </tr><tr><th class="text-nowrap" scope="row"># колонок</th>
          <td colspan="4">12</td>
        </tr><tr><th class="text-nowrap" scope="row">Ширина колонки</th>
          <td class="text-muted">Auto</td>
          <td>~62px</td>
          <td>~81px</td>
          <td>~97px</td>
        </tr><tr><th class="text-nowrap" scope="row">Промежуточная ширина</th>
          <td colspan="4">30px (15px on each side of a column)</td>
        </tr><tr><th class="text-nowrap" scope="row">Вкладка</th>
          <td colspan="4">Yes</td>
        </tr><tr><th class="text-nowrap" scope="row">Отступ</th>
          <td colspan="4">Yes</td>
        </tr><tr><th class="text-nowrap" scope="row">Выравнивание колонок</th>
          <td colspan="4">Yes</td>
        </tr></tbody></table>

### Текст - Глобальные настройки

```css
body, p {
	font-size: 14px;
	line-height: 1.428;
}

p {
	margin-bottom: 10px;
}
```