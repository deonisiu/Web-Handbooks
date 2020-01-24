# Учебные материалы

## Примерный план
0. Модули (архитектура модулей)
1. ORM (учимся работать с БД с помощью ORM классов: создание своих таблиц, операции с записями, выборка данных)
2. Компоненты (создание простых и комплексных)
3. События (перехват обработчика и создание своих)
4. Бизнес-процессы (создание самих БП и действий для них) 
5. Модули (правила написания модулей)
6. JS модули (использование системных и создание своих)

## 0. Модули (архитектура модулей)

* [Теория](https://dev.1c-bitrix.ru/learning/course/index.php?COURSE_ID=43&CHAPTER_ID=04609&LESSON_PATH=3913.4609)
* [Список штатных модулей](https://dev.1c-bitrix.ru/api_help/main/general/modules/identifiers.php)
* [Структура штатных модулей](https://dev.1c-bitrix.ru/learning/course/index.php?COURSE_ID=43&LESSON_ID=2823&LESSON_PATH=3913.4609.2823)

### Основы

<details>
  <summary><b>Content</b></summary>

* ***Управление штатными модулями*** - (***Настройки*** > ***Настройки продукта*** > ***Модули***) в административном разделе системы
* ***ВАЖНО*** - В партнерских модулях, в названии которых содержится точка (**bizon.main**) в имени переменной точка будет заменена на символ подчеркивания.
```php
use \Bizon.Main; // ошибка
use \Bizon\Main; // верно
```
* Перед использованием модуля необходимо проверить установлен ли он и подключить его
```php
<?
use Bitrix\Main\Loader;

if (Loader::includeModule('MODULE_NAME')) {
    // здесь можно использовать функции и классы модуля
}?>
```
* Основным файлом, используемым системой для манипуляции модулем, является `/bitrix/modules/ID_модуля/install/index.php`
```php
/install/index.php

Метод DoInstall   - при нажатии Установить на странице Модулей. (Установка)
Метод DoUninstall - при нажатии Удалить на странице Модулей.    (Удаление)

Обязательные свойства объекта этого класса:

MODULE_ID           - хранит ID модуля (полный код партнерского модуля);
MODULE_NAME         - имя модуля;
MODULE_VERSION      - текущая версия модуля в формате XX.XX.XX;
MODULE_VERSION_DATE - строка содержащая дату версии модуля; дата должна быть задана в формате YYYY-MM-DD HH:MI:SS;
MODULE_DESCRIPTION  - описание модуля;
MODULE_GROUP_RIGHTS - если задан метод GetModuleRightList, то данное свойство должно содержать Y.
```

<details>
  <summary><b>/install/index.php</b></summary>

```php
Class mymodule extends CModule
{
  public $MODULE_ID = "mymodule";
  public $MODULE_NAME;
  public $MODULE_VERSION;
  public $MODULE_VERSION_DATE;
  public $MODULE_DESCRIPTION;
  public $MODULE_CSS;

  public function __construct()
  {
    $arModuleVersion = [];
    include(__DIR__.'/version.php');    
    if(is_array($arModuleVersion) && array_key_exists('VERSION', $arModuleVersion))
    {
      $this->MODULE_VERSION      = $arModuleVersion['VERSION'];
      $this->MODULE_VERSION_DATE = $arModuleVersion['VERSION_DATE'];
    }   
    $this->MODULE_NAME        = 'module_name';
    $this->MODULE_DESCRIPTION = 'module_description';
  }

  public function DoInstall()
  {
    if(!IsModuleInstalled($this->MODULE_ID))
    {
        $this->InstallFiles();
        $this->InstallDB();
        CAdminMessage::ShowNote('Модуль успешно установлен');
    }
    else
    {
        RegisterModule($this->MODULE_ID);
        CAdminMessage::ShowNote('Модуль уже установлен');
    }
    RegisterModule($this->MODULE_ID);
  }

  public function DoUninstall()
  {
    if(IsModuleInstalled($this->MODULE_ID))
    {
        $this->UnInstallFiles();
        $this->UnInstallDB();
        CAdminMessage::ShowNote('Модуль успешно удален');
    }
    else
    {
        CAdminMessage::ShowNote('Модуль уже удален');
    }
    UnRegisterModule($this->MODULE_ID);
  }
}
```

</details>

</details>

### Параметры модулей (хранятся в БД)
* (***Админ.Раздел*** > ***Настройки*** > ***Настройки продукта*** > ***Настройки модулей***)
* При выборе система подключает файл `/bitrix/modules/ID_модуля/options.php`
* При получении параметров, может использоваться файд по умолчанию `/bitrix/modules/ID модуля/default_option.php`
<details>
  <summary><b>default_option.ph</b></summary>

```php
// Example: default_option.php
$support_default_option = array(
    "SUPPORT_DIR"                => "#SITE_DIR#support/",
    "SUPPORT_MAX_FILESIZE"       => "100",
    "ONLINE_INTERVAL"            => "900",
    "DEFAULT_VALUE_HIDDEN"       => "N",
    "NOT_IMAGE_EXTENSION_SUFFIX" => "_",
    "NOT_IMAGE_UPLOAD_DIR"       => "support/not_image",
    "DEFAULT_AUTO_CLOSE_DAYS"    => "7"
    );

// Использование
// установим строковый параметр
COption::SetOptionString("my_module_id", "MY_PARAMETER_ID", "VALUE");

// получим строковый параметр
$value = COption::GetOptionString("my_module_id", "MY_PARAMETER_ID", "DEFAULT_VALUE");
```

</details>

* Для работы с параметрами модуля предназначен класс [COption](https://dev.1c-bitrix.ru/api_help/main/reference/coption/index.php)
```php
SetOptionString - установка строковых параметров
SetOptionInt    - установка числовых параметров
GetOptionString - получение строковых параметров
GetOptionInt    - получение числовых параметров
RemoveOption    - удаление параметра
```