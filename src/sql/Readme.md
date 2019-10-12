# SQL

* [MySQL](mysql.md)

## Основы

* База данных - совокупность связанных данных, организованных по опр. правилам.

* SQL - структурированный язык запросов
  * является стандартом ANSI и ISO
  * не чувствителен к регистру
  * текст заключается в одинарные кавычки `City = 'New York'`
  * любые манипуляции с БД, таблицами и данными из таблиц

* СУБД - система управления базами данных
  * быстрый поиск
  * взаимосвязь данных между собой
  * получение данных из сторонних программ
  * одновременный доступ для нескольких пользователей 

* Реляционные СУБД: MySQL, PostgreSQL

## Индексирование
* Нумерация каждой записи в таблице БД
* ***MySQL*** - три вида индексов:
  * ***PRIMARY*** - уникальный индекс(ключ)
    * **NOT NULL**
    * На таблицу только **один** PK
    * Может состоять из нескольких полей
  * ***UNIQUE*** - поля, имеющие только уникальные значения
  * ***INDEX*** - обычный индекс

## Первичный ключ (primary key, PK)
* Минимальный набор полей, уникально идентифицирущий запись в таблице.
  * Каждый ключ уникален - не может быть повторного значения
  * id - суррогатный, искусственный PK

## Основные операторы языка SQL [подробно](operator/Readme.md)

### Именование
```sql
SELECT City FROM customers            # Стандарт
SELECT customers.City FROM customers  # Полное имя
SELECT City AS my_city FROM customers # Изменение имени
```

### Дополнительные конструкции
```sql
[WHERE condition]             /*Условие*/                           SELECT * FROM table WHERE id = 5
[WHERE .. LIKE pattern]       /*Поиск по шаблону - подробнее ниже*/
[ORDER BY column [ASC|DESC]]  /*Сортировка asc-возрастание desc-убывание*/ .. table ORDER BY id
[LIMIT numb]                  /*Количество отображаемых записей*/   SELECT * FROM table LIMIT 5
[BETWEEN val1 AND val2]       /*Выборка внутри диапазона*/
IN                            /*Сравнение с несколькими значениями*/.. table WHERE City IN (val1, val2)
NOT IN                        /*Исключение значений из выборки*/    .. NOT IN (val1, val2)
SHOW                          /*Отображение какой либо информации
DISTINCT                      /*Только уникальные записи*/          SELECT DISTINCT col FROM table
CONCAT                        /*Соединение нескольких строк в одну*/SELECT CONCAT(col1, , , col2)...
UPPER                         /*Верхний регистр*/                   SELECT UPPER(col1) FROM table
LOWER                         /*Нижний регистр*/                    SELECT LOWER(col1) FROM table
SQRT                          /*Квадратный корень*/                 SELECT SQRT(col1) FROM table
AVG                           /*Среднее значение*/                  SELECT AVG(col1) FROM table
SUM                           /*Сумма столбцов*/                    SELECT SUM(col1) FROM table
MIN                           /*Возврат минимального значения*/     SELECT MIN(col1) FROM table 
UNION                         /*Из наборов данных один без дублей - подробнее ниже*/ 
UNION ALL                     /*Из наборов данных один + дубли    - подробнее ниже*/
```

### Основные конструкции
```sql
SHOW DATABASES                                                    # Показать базы данных
SHOW TABLES                                                       # Показать таблицы одной БД
SHOW COLUMNS FROM table_name                                      # Показать столбцы таблицы

CREATE TABLE table_name                                           # Создание таблицы
DROP TABLE table_name [, table_name2]                             # Удаление одной[нескольких] таблицы
ALTER TABLE table_name alter_specification                        # Изменение структуры таблицы
SELECT val [FROM table [WHERE] [ORDER BY]]                        # Выборка строк из таблицы
INSERT INTO table [(col_name,...)] VALUES(value,...),(...)        # Вставка новых строк
UPDATE table SET col1=val1[, col2=val2...][WHERE][LIMIT]          # Обновляет значения существующих столбцов
DELETE FROM table [WHERE][LIMIT rows]                             # Удаляет строки
```

### Поиск по шаблону (LIKE)
```sql
# "_" - любой один символ
# "%" - любое количество любых символов (включая нулевое количество)
SELECT * FROM table WHERE col1 LIKE 'A%'; # Все строки где col1 начинается с буквы А
SELECT * FROM table WHERE col1 LIKE '%s'; # Все строки где col1 заканчивается буквой s
```

### Подзапросы (запрос внутри другого запроса)
```sql
SELECT col1 FROM table WHERE col1 > (SELECT AVG(col1) FROM table) ORDER BY col1 DESC;
```

### Соединение таблиц
```sql
# В примере каждая таблица содержит ID и Name
SELECT tabl1.ID, tabl1.Name, tabl2.Name, tabl2.Amount
FROM tabl1, tabl2
WHERE tabl1.ID = tabl2.tabl1_id
ORDER BY tabl1.ID
```

### Объединения (JOIN)
![bc0c8ba4d12051502a68bade9bba4bc5](https://user-images.githubusercontent.com/33727234/66696351-7b393480-ecf5-11e9-943d-868406bae79a.png)
```sql
# Внутреннее объединение (нижний ряд)

# Inner join
- INNER JOIN === JOIN   # Возвращает строки, если они совпадают в таблицах
# Пример
SELECT cols FROM tabl1 INNER JOIN tabl2 ON tabl1.col_name = tabl2.col_name

# [Inclusive] Left Join
- LEFT JOIN             # Возвращает все строки из левой, даже если их нет в правой
# Пример
SELECT tabl1.col1, tabl2.col1, FROM tabl1 LEFT OUTER JOIN tabl2 ON tabl1.col_name = tabl2.col_name
# Слово OUTER может быть опущено 

# [Inclusive] Right Join
- RIGHT JOIN            # Возвращает все строки из правой, даже если их нет в левой
# Пример
SELECT tabl1.col1, tabl2.col1, FROM tabl1 RIGHT OUTER JOIN tabl2 ON tabl1.col_name = tabl2.col_name
# Слово OUTER может быть опущено 

# [Inclusive] Full Join
- FULL JOIN             # Возвращает все строки из правой и левой таблиц
# Пример
SELECT * FROM A FULL JOIN B ON A.key = B.key

```

### Объединение (UNION & UNION ALL)
```sql
# Комбинация информации из нескольких таблиц в один набор данных
UNION
  # Комбинирование наборов результатов двух и более SELECT Без дублей
  # ВАЖНО все SELECT должны иметь одинаковое количество столбцов
  # ВАЖНО столбцы должны иметь одинаковые типы данных и быть в одинаковом порядке
# Пример
SELECT ID, Name, City FROM First
UNION
SELECT ID, Name, City FROM Second

# Пример(если столбцы не совпадают)
SELECT ID, Name, City, Time FROM First
UNION
SELECT ID, Name, City, NULL FROM Second


UNION ALL
  # Выбирает все строки из каждой таблицы и комбинирует в одну
# Пример
SELECT ID, Name, City FROM First
UNION ALL
SELECT ID, Name, City FROM Second
```

### Представления (VIEW)
```sql
VIEW
  # - Виртуальная таблица = результат набора SQL выражений
  # - Структурирование информации
  # - Ограничение доступа
  # - Суммирование информации
# Пример
CREATE VIEW List AS 
SELECT Name, Salary FROM Employees;
# После этого можно сделать запрос:
SELECT * FROM List;

# Обновление представлений
CREATE OR REPLACE VIEW
view_name AS
SELECT cols FROM table
WHERE condition;

# Удаление представлений
DROP VIEW view_name;
```
