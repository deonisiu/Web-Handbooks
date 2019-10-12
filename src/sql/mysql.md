# MySQL

## Основы

* ***MySQL*** – это реляционная система управления базами данных.
  * данные в ее базах хранятся в виде логически связанных между собой таблиц
  * доступ осуществляется с помощью языка запросов **SQL**
  * данные о пользователях в таблице **user**(доступ только для админа сервера)

---
## MySQL в командной строке
```sql
# Начальная настройка прав доступа
shell> Mysql -u root Mysql              # Запуск Mysql.exe + Получить все права администратора
Mysql> UPDATE user SET Password=PASSWORD('new_password') WHERE user='root'; # новый пароль
Mysql> DELETE FROM user WHERE user='';  # удаление всех пользователей с пустым логином
Mysql> FLUSH PRIVILEGES;                # применяет изменения в системной БД

# СОЗДАНИЕ НОВОГО ПОЛЬЗОВАТЕЛЯ
# GRANT наделяет пользователя denis(с localhost) с паролем "123" всеми правами на все таблицы БД book
Mysql> GRANT ALL PRIVILEGES ON book.* TO denis@localhost IDENTIFIED BY '123';

# вход за нового пользователя
shell>Mysql -u denis -p  

Mysql> create database book;  # Создание новой БД
Mysql> show tables;           # Показать все таблицы

```

## Типы данных MySQL

### Краткий список
```php
          # Целые числа
INTEGER
BIGINT
TINYINT
SMALLINT
MEDIUMINT
          # Десятичные
DECIMAL
FLOAT
DOUBLE
          # Логический
BOOLEAN
          # Символьные типы
VARCHAR
BLOB
TEXT
ENUM
SET
          # Дата и время
DATETIME
DATE
TIMESTAMP
TIME
YEAR
```

### Целые числа
```php
# byte - кол-во байт для хранения
# max/min - границы значений
# umax/umin - беззнаковые

1. 'tinyint'=>Array('byte'=>1, 'min'=>-128, 'max'=>127, 'umin'=>0, 'umax'=>255)
3. 'smallint'=>Array('byte'=>2, 'min'=>-32768, 'max'=>32767, 'umin'=>0, 'umax'=>65535)
4. 'mediumint'=>Array('byte'=>3, 'min'=>-8388608, 'max'=>8388607, 'umin'=>0, 'umax'=>16777215)
2. 'int'=>Array('byte'=>4, 'min'=>-2147483648, 'max'=>2147483647, 'umin'=>0, 'umax'=>4294967295)
5. 'bigint'=>Array('byte'=>8, 'min'=>-9223372036854775808, 'max'=>9223372036854775807, 'umin'=>0, 'umax'=>18446744073709551615)
```

### Десятичные
```php
# byte — кол-во байт для хранения поля (по-умолчанию)
# min_byte/max_byte — краевые значения размера поля в байтах,
# byte_formula — формула вычисления размерности
# length — максимальное кол-во цифр
# negative_min/negative_max — минмаксы для отрицательных чисел
# positive_min/positive_max — минмаксы для положительных чисел

# DECIMAL DECIMAL(M, D) m — кол-во цифр (max 65 цифр), d — сколько из них могут быть после запятой

1. 'decimal'=>Array('min_byte'=>2, 'max_byte'=>67, 'byte_formula'=>'(D==0?(M+1):(M+2)', 'length'=>65)
2. 'dec'=>Array('min_byte'=>2, 'max_byte'=>67, 'byte_formula'=>'D==0?(M+1):(M+2)', 'length'=>65)
3. 'numeric'=>Array('min_byte'=>2, 'max_byte'=>67, 'byte_formula'=>'D==0?(M+1):(M+2)', 'length'=>65)

# FLOAT ТОЧНОСТЬ ТОЛЬКО 7 ЦИФР (все остальные цифры «смазываются»)

4. 'float'=>Array('byte'=>4, 'max_byte'=>8, 'negative_min'=>-3.402823466E+38, 'negative_max'=>-1.175494351E-38, 'positive_min'=>1.175494351E-38, 'positive_max'=>3.402823466E+38)

# DOUBLE ТОЧНОСТЬ ТОЛЬКО 15 ЦИФР (все остальные цифры «смазываются»)

5. 'double'=>Array('byte'=>8, 'negative_min'=>-1.7976931348623157E+308, 'negative_max'=>-2.2250738585072014E-308, 'positive_min'=>2.2250738585072014E-308, 'positive_max'=>1.7976931348623157E+308)

# ВНИМАНИЕ!
# Не храните денежные значения в этих полях! Деньги надо хранить — в DECIMAL
```

### Логический
```php
1. 'bool'=>Array('byte'=>1, 'true'=>1, 'false'=>0),
2. 'boolean'=>Array('byte'=>1, 'true'=>1, 'false'=>0),
```

### Символьные типы
```php
# byte — кол-во байт отведенных для хранения (можно задать меньше)
# min_byte — минимальное кол-во байт в которых может храниться поле (если длина равна 1)
# max_byte — максимальное кол-во байт, которое можно достигнуть при максимальном кол-ве элементов
# max_number_of_element — кол-во элементов, которое может содержать поле
# length — максимальная длина символов в поле

# В MYSQL 5.0.3 и выше, VARCHAR может быть до 65,535 символов!

1. 'varchar'=>Array('byte'=>256, 'min_byte'=>2, 'length'=>255),
2. 'char'=>Array('byte'=>256, 'min_byte'=>2, 'length'=>255),


# Тип данных BLOB представляет собой двоичный объект большого размера, который может содержать переменное количество данных. 

3. 'tinyblob'=>Array('byte'=>256, 'min_byte'=>2, 'length'=>255)
4. 'blob'=>Array('byte'=>65537, 'min_byte'=>3, 'length'=>65535)
5. 'mediumblob'=>Array('byte'=>16777219, 'min_byte'=>4, 'length'=>16777215)
6. 'longblob'=>Array('byte'=>4294967300, 'min_byte'=>5, 'length'=>4294967296)

# TEXT – это независимый от регистра BLOB

7. 'tinytext'=>Array('byte'=>256, 'min_byte'=>2, 'length'=>255)
8. 'text'=>Array('byte'=>65537, 'min_byte'=>3, 'length'=>65535)
9. 'mediumtext'=>Array('byte'=>16777218, 'min_byte'=>4, 'length'=>16777215)
10. 'longtext'=>Array('byte'=>4294967300, 'min_byte'=>5, 'length'=>4294967296)

# ENUM (перечисление) – это столбец, который может принимать значение из списка допустимых значений, явно перечисленных в спецификации столбца в момент создания таблицы.

11. 'enum'=>Array('byte'=>1, 'max_byte'=>2, 'max_number_of_element'=>65535)

# SET – это строковый тип, который может принимать ноль или более значений, каждое из которых должно быть выбрано из списка допустимых значений, определенных при создании таблицы. Элементы множества SET разделяются запятыми. Как следствие, сами элементы множества не могут содержать запятых.

12. 'set'=>Array('byte'=>1, 'max_byte'=>8, 'max_number_of_element'=>64)
```

### Тип даты и времени
```php
# byte — кол-во байт для хранения значения поля
# mask — стандартная маска ввода значения
# min/max — минимальные максимальные значения дат которые сохраняют поля

# DATETIME информация о дате и времени. 
# MySQL формат 'YYYY-MM-DD HH:MM:SS'. 
# Диапазон от '1000–01–01 00:00:00' до '9999–12–31 23:59:59'.
1. 'datetime'=>Array('byte'=>8, 'mask'=>'YYYY-MM-DD HH: MM: SS', 'min'=>'1000-01-01 00:00:00', 'max'=>'9999-12-31 23:59:59')

# DATE информация только о дате. 
# MySQL формат 'YYYY-MM-DD'. 
# Диапазон от '1000–01–01' до '9999–12–31'.
2. 'date'=>Array('byte'=>3, 'mask'=>'YYYY-MM-DD', 'min'=>'1000-01-01', 'max'=>'9999-12-31')

# TIMESTAMP можно использовать для автоматической записи текущих даты и времени при INSERT или UPDATE. 
# При наличии нескольких столбцов типа TIMESTAMP только первый из них обновляется автоматически.
3. 'timestamp'=>Array('byte'=>4, 'mask'=>Array(14=>'YYYYMMDDHHMMSS',12=>'YYMMDDHHMMSS',10=>'YYMMDDHHMM',8=>'YYYYMMDD',6=>'YYMMDD',4=>'YYMM',2=>'YY'), 'min'=>1970, 'max'=>2036 )

# TIME формат 'HH:MM:SS' (или 'HHH:MM:SS' для больших значений часов). 
# Диапозон от '-838:59:59' до '838:59:59'.
4. 'time'=>Array('byte'=>3, 'min'=>'-838:59:59', 'max'=>'838:59:59')

# YEAR однобайтный тип данных для представления значений года.
# MySQL формат YYYY. 
# Диапазон от 1901 до 2155.
5. 'year'=>Array('byte'=>1, 'min'=>1901, 'max'=>2155)
```