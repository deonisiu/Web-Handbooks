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

1. 'int'=>Array('byte'=>4, 'min'=>-2147483648, 'max'=>2147483647, 'umin'=>0, 'umax'=>4294967295)
2. 'smallint'=>Array('byte'=>2, 'min'=>-32768, 'max'=>32767, 'umin'=>0, 'umax'=>65535)
3. 'mediumint'=>Array('byte'=>3, 'min'=>-8388608, 'max'=>8388607, 'umin'=>0, 'umax'=>16777215)
```

### Десятичные
```php
# DECIMAL DECIMAL(M, D) m — кол-во цифр (max 65 цифр), d — сколько из них могут быть после запятой
# min_byte/max_byte — краевые значения размера поля в байтах,
# byte_formula — формула вычисления размерности
# length — максимальное кол-во цифр

4. 'decimal'=>Array('min_byte'=>2, 'max_byte'=>67, 'byte_formula'=>'(D==0?(M+1):(M+2)', 'length'=>65)
5. 'dec'=>Array('min_byte'=>2, 'max_byte'=>67, 'byte_formula'=>'D==0?(M+1):(M+2)', 'length'=>65)
6. 'numeric'=>Array('min_byte'=>2, 'max_byte'=>67, 'byte_formula'=>'D==0?(M+1):(M+2)', 'length'=>65)

# byte — кол-во байт для хранения поля (по-умолчанию)
# max_byte — максимальное кол-во байт для хранения
# negative_min/negative_max — минмаксы для отрицательных чисел
# positive_min/positive_max — минмаксы для положительных чисел
# FLOAT ТОЧНОСТЬ ТОЛЬКО 7 ЦИФР (все остальные цифры «смазываются»)

7. 'float'=>Array('byte'=>4, 'max_byte'=>8, 'negative_min'=>-3.402823466E+38, 'negative_max'=>-1.175494351E-38, 'positive_min'=>1.175494351E-38, 'positive_max'=>3.402823466E+38)

# byte — кол-во байт для хранения поля (по-умолчанию)
# max_byte — максимальное кол-во байт для хранения
# negative_min/negative_max — минмаксы для отрицательных чисел
# positive_min/positive_max — минмаксы для положительных чисел
# DOUBLE ТОЧНОСТЬ ТОЛЬКО 15 ЦИФР (все остальные цифры «смазываются»)

8. 'double'=>Array('byte'=>8, 'negative_min'=>-1.7976931348623157E+308, 'negative_max'=>-2.2250738585072014E-308, 'positive_min'=>2.2250738585072014E-308, 'positive_max'=>1.7976931348623157E+308)

# ВНИМАНИЕ!
# Не храните денежные значения в этих полях! Деньги надо хранить — в DECIMAL
```

### Логический
```php
9. 'bool'=>Array('byte'=>1, 'true'=>1, 'false'=>0),
10. 'boolean'=>Array('byte'=>1, 'true'=>1, 'false'=>0),
```

### Символьные типы
```php
# byte — кол-во байт отведенных для хранения (можно задать меньше)
# min_byte — минимальное кол-во байт в которых может храниться поле (если длина равна 1)
# В MYSQL 5.0.3 и выше, VARCHAR может быть до 65,535 символов!
# length — максимальная длина символов в поле

11. 'varchar'=>Array('byte'=>256, 'min_byte'=>2, 'length'=>255),
12. 'char'=>Array('byte'=>256, 'min_byte'=>2, 'length'=>255),

```