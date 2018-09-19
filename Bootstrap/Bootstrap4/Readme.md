# Bootstrap 4

---
## Основы

### Подключение Bootstrap 4 CDN

```html
<!-- in head Bootstrap -->

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<!-- in body for JS -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
```

### Сетка

В сетке всего 12 колонок в ряду (row)  

Имеет 5 классов:
* `col-*` 	 (Очень маленькие экраны - меньше 576px)
* `col-sm-*` (Маленькие экраны - 576px или больше)
* `col-md-*` (Средние экраны - 768px или больше)
* `col-lg-*` (Большие экраны - 992px или больше)
* `col-xl-*` (Очень большие экраны - 1200px или больше)

#### Базовая структура сетки
```html
<div class="row">
	<div class="col-*-*"></div>
	<div class="col-*-*"></div>
	<div class="col-*-*"></div>
</div>
```
Где первая * класс(sm,md,lg,xl), вторая * размер колонки (1-12)
```html
<div class="col-4"></div>
<div class="col-md-4"></div>
```
Если какой-либо класс не задан, используются размеры предыдущего.

<table class="table table-bordered table-striped">
  <thead>
    <tr>
      <th></th>
      <th class="text-center">
        Extra small<br>
        <small>&lt;576px</small>
      </th>
      <th class="text-center">
        Small<br>
        <small>≥576px</small>
      </th>
      <th class="text-center">
        Medium<br>
        <small>≥768px</small>
      </th>
      <th class="text-center">
        Large<br>
        <small>≥992px</small>
      </th>
      <th class="text-center">
        Extra large<br>
        <small>≥1200px</small>
      </th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th class="text-nowrap" scope="row">Максимальная<br>ширина контейнера</th>
      <td>None (auto)</td>
      <td>540px</td>
      <td>720px</td>
      <td>960px</td>
      <td>1140px</td>
    </tr>
    <tr>
      <th class="text-nowrap" scope="row">Префикс класса</th>
      <td><code>.col-</code></td>
      <td><code>.col-sm-</code></td>
      <td><code>.col-md-</code></td>
      <td><code>.col-lg-</code></td>
      <td><code>.col-xl-</code></td>
    </tr>
    <tr>
      <th class="text-nowrap" scope="row">Число колонок</th>
      <td colspan="5">12</td>
    </tr>
    <tr>
      <th class="text-nowrap" scope="row">Ширина отступа</th>
      <td colspan="5">30px (15px с каждой стороны столбца)</td>
    </tr>
    <tr>
      <th class="text-nowrap" scope="row">Может быть вложенным</th>
      <td colspan="5">Да</td>
    </tr>
    <tr>
      <th class="text-nowrap" scope="row">Упорядочивание колонок</th>
      <td colspan="5">Да</td>
    </tr>
  </tbody>
</table>

### Текст - Глобальные настройки

```css
body, p {
	font-size: 16px;
	line-height: 1.5;
	font-family: "Helvetica Neue", Helvetica, sans-serif;
}

p {
	margin-top: 0;
	margin-bottom: 1rem;
}
```