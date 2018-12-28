# Руководство по использованию портала GitHub

## Полезные ссылки

* [Как пользоваться GitHub-ом](https://losst.ru/kak-polzovatsya-github)

## Создание репозитория на GitHub-e через консоль

Сначала создадим новый репозиторий на портале GitHub, затем:

Сreate a new repository on the command line
```
echo "# Test2" >> README.md
git init
git add README.md
git commit -m "first commit"
git remote add origin https://github.com/username/repos-name.git
git push -u origin master
```
…or push an existing repository from the command line
```
git remote add origin https://github.com/username/repos-name.git
git push -u origin master
```