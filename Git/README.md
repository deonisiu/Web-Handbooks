# Справочник Git и GitHub
Здесь будет собираться информация для изучения Git-а

## Список файлов
* [Git.md](Git.md) - Основная собранная информация про Git
* [.gitconfig](.gitconfig) - Глобальные настройки Git-a в Windows/users/user
* [github-manual](github-manual.md) - Справочник по использованию GitHub
* [github-markdown](github-markdown.md) - Справочник по использованию синтаксиса markdown

## Git.md
### Оглавление разделов

1. Список определений
2. Общая информация про Git
3. Настройки (config, help)
4. Базовые команды (init, add, commit, grep, rm, mv)
5. Статус файлов репозитория (status, diff)
6. Игнорирование файлов (".gitignore")
7. Просмотр истории коммитов (log, show, reflog)
8. Операции отмены (commit --amend, reset, checkout, revert)
9. Удаленный репозиторий (clone, remote, fetch, pull, push)
10. Работа с метками (tag, show, push)
11. Псевдонимы (config --global alias) (Алиасы)
12. Ветвление в Git (checkout, branch, merge, rebase) (killer feature)
13. Сервер Git Глава 4 (Временно пропущена)
14. Участие в проекте Глава 5 (Общие советы по использованию Git)
15. Github Глава 6 (Временно пропущена)
16. Дополнительные инструменты Git Глава 7

## Справочник основных команд Git-a

``` php
$ git config --global user.name "John Doe" (задать имя пользователя глобально в файле .gitconfig)

```