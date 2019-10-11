# Основные операторы языка SQL

---
### CREATE TABLE - Создание таблицы `CREATE TABLE table_name`

```sql
# Mysql 3.22+ - имя_базы_данных.имя_таблицы
# Mysql 3.23+ - ключевые слова IF NOT EXISTS, не возникает ошибка если уже есть таблица
# Mysql 3.23+ - TEMPORARY - временная таблица(удаляется после сеанса)
# Mysql 4.0.2+ - для временных таблиц необходима привилегия CREATE TEMPORARY TABLES

CREATE [TEMPORARY] TABLE [IF NOT EXISTS] 
имя_таблицы [(определение_столбца,...)] 
[опции_таблицы] [select_выражение]

# [(определение_столбца,...)] - какие столбцы должны быть созданы
имя_столбца тип [NOT NULL | NULL]
[DEFAULT значение_по_умолчанию]
[AUTO_INCREMENT][PRIMARY KEY]
[reference_definition]

# тип столбца
* целый: INT[(length)] [UNSIGNED] [ZEROFILL]
* действительный: REAL[(length,decimals)] [UNSIGNED] [ZEROFILL]
* символьный: CHAR(length) [BINARY] и VARCHAR(length) [BINARY]
* дата и время: DATE и TIME
* для работы с большими объектами: BLOB
* текстовый: TEXT
* перечислимое множество: ENUM(value1,value2,value3,...) и SET(value1,value2,value3,...)

# можно указать свойства
* тип таблицы: TYPE = {BDB | HEAP | ISAM | Inno DB? | MERGE | MRG_MYISAM | MYISAM }
* начальное значение счетчика автоинкремента: AUTO_INCREMENT = число
* средняя длина строк в таблице: AVG_ROW_LENGTH = число
* комментарии к таблице (строка из 60 символов): COMMENT = «строка» максимальное и минимальное предполагаемое число строк: MAX_ROWS = число и MIN_ROWS = число
```

---
### DROP TABLE - Удаление одной[нескольких] таблицы `DROP TABLE table_name [, table_name2]`

---
### ALTER TABLE - Изменение структуры таблицы `ALTER TABLE table_name alter_specification`

```sql
# Добавление поля 
ADD [COLUMN] определение_столбца
[FIRST | AFTER имя_столбца ]
или
ADD [COLUMN] (определение_столбца,
определение_столбца,...)

# Добавление индексов
ADD INDEX [имя_индекса] (имя_индексируемого_столбца,...) или ADD
PRIMARY KEY (имя_индексируемого_столбца,...) или ADD UNIQUE
[имя_индекса] (имя_индексируемого_столбца,...) или ADD FULLTEXT
[имя_индекса] (имя_индексируемого_столбца,...)

# Изменение поля
ALTER [COLUMN] имя_столбца {SET DEFAULT literal | DROP DEFAULT} или
CHANGE [COLUMN] старое_имя_столбца определение_столбца или
MODIFY [COLUMN] определение_столбца

# Удаление поля, индекса, ключа
DROP [COLUMN] имя_столбца
DROP PRIMARY KEY
DROP INDEX имя_индекса

# Переименование таблицы
RENAME [TO] новое_имя_таблицы

# Переупорядочение полей таблицы:
ORDER BY поле
или
опции_таблицы

```

---
### DROP TABLE - Удаление одной[нескольких] таблицы `DROP TABLE table_name [, table_name2]`