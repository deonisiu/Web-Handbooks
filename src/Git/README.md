# Справочник Git и GitHub

* [Оформление сообщения коммита](commit.md)

## Список файлов
* [Git.md](Git.md) - Основная собранная информация про Git
* [.gitconfig](.gitconfig) - Глобальные настройки Git-a в Windows/users/user
* [github-manual](github-manual.md) - Справочник по использованию GitHub
* [github-markdown](github-markdown.md) - Справочник по использованию синтаксиса markdown

## Полезные ссылки

* [Работа с Git через консоль (htmlAcademy)](https://htmlacademy.ru/blog/useful/git/git-console)
* [Как установить Git и работать в консоли YouTube](https://www.youtube.com/watch?v=dnrcpHcJyVo&t=149s)
* [Ежедневная работа с Git](https://m.habrahabr.ru/post/174467/)
* [Статья про Бейджики](https://stfalcon.com/ru/blog/post/improve-your-code-with-badges)
* [Бейджи - img.shields.io](https://img.shields.io/#/)

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

## Справочник основных команд Git-a (могут повторяться в разных разделах)

``` php
КРАТКИЙ СПИСОК ОСНОВНЫХ КОМАНД (must have)
$ git config --global user.name john (имя пользователя в файле .gitconfig)
$ git config --global user.email john@mail.com (email пользователя)
$ git config -l (посмотреть значения списка настроек)
$ git <comand> -help (посмотреть краткую справку по команде <comand>)
$ git init (создание локального репозитория в текущей директории)
$ git add <files> (добавить этот контент в следующий коммит "index zone")
$ git add -A (добавить весь контент в след. коммит "индекс зону")
$ git commit (коммит индексной зоны + комментарий в редакторе $EDITOR)
$ git commit -m "comment" (коммит индексной зоны + комментарий в строке 
$ git rm <file> (полное удаление непроиндексированного файла)
$ git mv <file-from> <file-to> (переименование, либо перемещение файла)
$ git status (определение состояния файлов (untracked, add, modified))
$ git diff (просмотр всех неиндексированных изменений)
$ git difftool [target] (сравнение через допол. программу 'Araxis')
$ touch .gitignore (создание игнор файла в папке проекта)
$ git log (просмотр истории коммитов сверху последние)
$ git show [target] (подробный просмотр последнего коммита)
$ git commit --amend [-m "text"] (переделать последний коммит add + coment)
$ git revert <hash> (новый комми который удаляет коммит по <hash>)
$ git reset (Перемещение указателя + отмена изменений индекса)
$ git clone <path> [directory] (клонирование существующего репозитория)
$ git remote (просмотр списка настроенных удаленных репозиториев)
$ git remote add <remote> <url> (добавление удаленного репозитория)
$ git remote rm <remote> (удаление удаленного репозитория)
$ git pull (получение и попытка слияния изменений с удаленного репозитория)
$ git push [remote] [branch]  (запись текущих изменений на удаленный репозиторий)
$ git tag (просмотр меток)
$ git branch -a (посмотреть список всех веток + с удаленного сервера)
$ git branch -u <remote> (настройка текущей ветки на отслеж. удаленной)
$ git checkout <branch> (переключиться на ветку branch)
$ git merge <branch> (слияние указанной ветки в текущую)
$ git mergetool (разрешение конфликта слияния через допол. программу 'Araxis')
$ git stash (спрятать в хран. все отслеживаемые изменения текущей ветки)
$ git stash apply (восстановить последнее спрятанное изменение)
$ git stash drop (удаление последнего спрятанного изменения из хранилища)
$ git stash pop (применить спрятанное изменение и удалить из хранилища)
$ git clean (очистка рабочей директории от untracked файлов ПОЛНОЕ УДАЛЕНИЕ)
$ git grep -n <text> (поиск строки где -n показывает номер найденных строк)
$ git blame <file> (показывает аннотацию всех строк файла)


НАСТРОЙКИ
$ git config --global user.name "John Doe" (имя пользователя в файле .gitconfig)
$ git config --global user.email johndoe@example.com (email пользователя)
$ git conifg --global core.editor <redactor> (задать текстовый редактор)
$ git config -l (посмотреть значения списка настроек)
$ git config <parametr> (посмотреть значение конкретного параметра)
$ git help <comand> (посмотреть краткую справку по команде <comand>)
$ git <comand> --help (другой вариант краткой справки)


БАЗОВЫЕ КОМАНДЫ
$ git init (создание локального репозитория в текущей директории)
$ git add <files> (добавить этот контент в следующий коммит "index zone")
$ git add -A (добавить весь контент в след. коммит "индекс зону")
$ git add -i (интерактивное индексирование [не изученная тема])
$ git commit (коммит индексной зоны + комментарий в редакторе $EDITOR)
$ git commit -m "comment" (коммит индексной зоны + комментарий в строке команды)
$ git commit -a -m "comment" (коммит всех измененных файлов до индекс зоны)
$ git grep -n <line-text> (поиск строки в истории коммитов -n:показывает номер найденой строки)
$ git rm <file> (полное удаление непроиндексированного файла)
$ git rm -f <file> (полное удаление даже индексированного файла)
$ git rm --cached <file> (перевод из индекса, или удаление файла в untracked)
$ git rm \*.log (удаление всех файлов с .log типом \:символ экранирования)
$ git mv <file-from> <file-to> (переименование, либо перемещение файла)


СТАТУС ФАЙЛОВ РЕПОЗИТОРИЯ
$ git status (определение состояния файлов (untracked, add, modified))
$ git status -s (сокращенный вывод статусов ('M', ' M', 'AM', 'MM', '??'))
$ git diff (просмотр всех неиндексированных изменений)
$ git diff [branch] (просмотр изменений конкретной ветки)
$ git diff [file] (просмотр изменений конкретного файла)
$ git diff --check (проверка измененных файлов на лишние пробелы)
$ git diff --cached (просмотр индексированных изменений)
$ git diff --staged (сравнение индексированных изменений с последним коммитом)
$ git difftool [target] (сравнение через допол. программу 'Araxis')


ИГНОРИРОВАНИЕ ФАЙЛОВ Git-ом
$ touch .gitignore (создание игнор файла в папке проекта)
$ cat .gitignore (просмотр файла)
--- Записи в файле(строки) ---
'# Игнорируемая строка' (пустые строки и строки начинающиеся с # игнорируются)
'test.txt' (игнорирование файла test.txt)
'*.css' (игнорирование всех файлов с расширением .css)
'!main.css' (но не игнорировать файл main.css)
'image/' (игнорировать все файлы из папки image)
'doc/*.txt' (игнорировать все файлы с типом txt в папке doc)
'*.gitignore' (игнорирование всех файлов с расширением .gitignore)


ПРОСМОТР ИСТОРИИ КОММИТОВ
$ git log (просмотр истории коммитов сверху последние)
$ git log -p (просмотр истории коммитов + разница внесенная в каждый коммит)
$ git log -p -[number] (number:количество отображаемых коммитов)
$ git log --stat (история + краткая разница + количество измененных строк)
$ git log --pretty=oneline (просмотр истории коммитов в одну строку 'full hash')
$ git log --oneline (просмотр истории коммитов в одну строку '7 numbers hash')
$ git log --pretty=format:"view format" (история коммитов в формате)
$ git log --graph (история коммитов в виде графа)
$ git log --status (история + список добав/измен/удален файлов)
$ git log -[n] (последние n записей)
$ git log --author="author" (фильтр коммитов по автору)
$ git log --grep="comment-text" (фильтр коммитов по тексту в комментарии)
$ git log -S"text" (коммиты в которых была изменена строка text)
$ git log [ref1]..[ref2] (посмотреть коммиты из указателя ref1 но не из ref2)
$ git log ^[ref1] [ref2] (тоже что и выше)
$ git log [ref1] --not [ref2] (тоже что и выше)
$ git log [ref1] [ref2] ^[ref3] (тоже что и выше только с тремя указателями)
$ git log [ref1]...[ref2] (коммиты которые есть либо в 1 либо во 2 но не в обоих сразу)
$ git log [remote]..HEAD (посмотреть все коммиты подготовленные для удаленного репозитория)
$ git show (подробный просмотр последнего коммита)
$ git show [branch] (последний коммит в ветке branch)
$ git show [hash] (определенный коммит по хеш сумме)
$ git show HEAD[~|^] (просмотр коммита предка для указателя HEAD)
$ git show [tag|hash|branch][~|^] (просмотр коммита предка)
$ git reflog (просмотр истории журнала ссылок)


ОПЕРАЦИИ ОТМЕНЫ
$ git commit --amend [-m "text"] (переделать последний коммит add + coment)
$ git revert HEAD (новый коммит удаляющий изменения коммита с указателем HEAD)
$ git revert <hash> (новый комми который удаляет коммит по <hash>)
$ git reset --soft [ref] (перемещение указателя HEAD на [ref])
$ git reset (Перемещение указателя + отмена изменений индекса)
$ git reset --hard [ref] (переводит HEAD на [ref] и удаляет все коммиты после)
$ git reset HEAD <file> (перенос из индекса в рабочую область = 'git unstage')
$ git checkout -- <file> (отмена изменений файла, откат к последней его версии в Git)


УДАЛЕННЫЙ РЕПОЗИТОРИЙ
$ git clone <path> [directory] (клонирование существующего репозитория)
$ git clone --bare <old-rep> <new-rep>.git (клонирование только папки .git)
$ git remote (просмотр списка настроенных удаленных репозиториев)
$ git remote -v (просмотр списка адресов репозиториев для чтения и записи)
$ git remote add <remote> <url> (добавление удаленного репозитория)
$ git remote show <remote> (просмотр удаленного репозитория больше инфо)
$ git remote rename <remote> <newname> (переименование удаленного репозитория)
$ git remote rm <remote> (удаление удаленного репозитория)
$ git fetch <remote> (получение изменений из удаленного репозитория)
$ git fetch --all (получить изменения со всех удаленных репозиториев)
$ git pull (получение и попытка слияния изменений с удаленного репозитория)
$ git push [remote] [branch]  (запись текущих изменений на удаленный репозиторий)
$ git push -u [remote] [branch] (установить автоматическую связь для pull)
$ git push <remote> --delete <server-branch> (удаление ветки на удаленном сервере)


РАБОТА С МЕТКАМИ
$ git tag (просмотр меток)
$ git tag -l "text" (поиск меток по шаблону "text")
$ git tag <tag> (создание легковесной метки для последнего коммита)
$ git tag -a <tag> (создание аннотированной метки с комментарием в Vim)
$ git tag -a <tag> -m "text" (создание аннот. метки с комментарем в text)
$ git tag -a <tag> [hash] (создание аннот. метки коммиту по hash)
$ git tag <tag> [hash] (создание легкой метки коммиту по hash)
$ git tag -d <tag> (удаление метки tag)
$ git show <tag> (просмотр конкретного коммита по метке tag)
$ git push [remote] [tag] (отправка метки на удаленный сервер)
$ git push [remote] --tags (отправка всех меток на удаленный сервер)


ПСЕВДОНИМЫ (alias)
$ git config --global alias.<alname> <git-command> (создание алиаса 'alname')

--- Либо запись алиаса в файл .gitconfig ---
'ci = commit' (git commit = git ci)
'difs = diff --stat' (git diff --stat = git difs)

------ Мои алиасы ------
unstage = reset HEAD --
back = checkout --
all = log --oneline --graph --all
hist = log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short
difs = diff --stat
dift = difftool -y
ci = commit
st = status
br = branch
type = cat-file -t
dump = cat-file -p
index = ls-files -s


ВЕТВЛЕНИЕ В GIT
$ git branch (посмотреть список всех созднных веток)
$ git branch -m master main (смена названия ветки с master на main)
$ git branch -a (посмотреть список всех веток + с удаленного сервера)
$ git branch -v (посмотреть последний коммит на каждой из веток)
$ git branch --merged (посмотреть список веток которые слиты в текущую ветку)
$ git branch <branch> (создание новой ветки)
$ git branch --track <branch> <remote> (создание локальной ветки, которая отслеживает удаленную)
$ git branch -u <remote> (настройка текущей ветки на отслеж. удаленной)
$ git branch -d <branch> (удаление ветки, не удаляется если изменения не слиты)
$ git branch -vv (посмотреть привязку всех локальных веток к удаленным веткам)
$ git branch -D <branch> (удаление ветки сразу)
$ git checkout <branch> (переключиться на ветку branch)
$ git checkout -b <branch> (создать новую ветку branch и переключиться на неё)
$ git checkout <hash> (переключиться на коммит с hash)
$ git checkout <tag> (переключиться на коммит с tag)
$ git checkout --track <remote> (создание локальной ветки, которая отслеживает удаленную)
$ git merge <branch> (слияние указанной ветки в текущую)
$ git mergetool (разрешение конфликта слияния через допол. программу 'Araxis')

--- Перебазирование ---
Не перемещайте коммиты, уже отправленные в публичный репозиторий!
$ git rebase <branch> (применить все изменения выбранной ветки к текущей)
$ git rebase <branch1> <branch2> (применить изменения из branch2 в branch1)
$ git rebase --onto <branch1> <branch2> <branch3> (перемещение branch3 из branch2 в branch1)


ПРИБЕРЕЖЕНИЕ И ОЧИСТКА
$ git stash (спрятать в хран. все отслеживаемые изменения текущей ветки)
$ git stash --keep-index (спрятать только то что не добавлено через add в индекс)
$ git stash -u (спрятать все отслеживаемые и неотслеживаемые файлы)
$ git stash --path (спрятать изменения в интерактивном режиме)
$ git stash list (просмотр списка спрятанных изменений)
$ git stash apply (восстановить последнее спрятанное изменение)
$ git stash apply stash@{n} (применить n-ое по счету спрятанное изменение)
$ git stash apply --index (применить спрятанное изменение с добавлением в индекс)
$ git stash drop (удаление последнего спрятанного изменения из хранилища)
$ git stash drop stash@{n} (удаление n-ного изменения из хранилища)
$ git stash pop (применить спрятанное изменение и удалить из хранилища)
$ git stash pop stash@{n} (применить и удалить n-ое изменение)
$ git stash branch <branch> (создание новой ветки из спрятанных изменений)
$ git clean (очистка рабочей директории от untracked файлов ПОЛНОЕ УДАЛЕНИЕ)
$ git clean -d (-d удаление директории)
$ git clean -n (-n не удаляет, а показывает то что будет удалено)
$ git clean -i (-i удаление в интерактивном режиме)
$ git clean -f (-f заставить удалить)


ПОИСК В GIT
$ git grep -n <text> (поиск строки где -n показывает номер найденных строк)
$ git grep --count <text> (файлы с найденной строкой + количество совпадений)
$ git grep -p <text> (увидеть метод или функцию в которой находится text)
$ git grep --break --heading (выводит результат в более читабельном виде)
$ git grep <text1> --and <text2> (поиск строк с несколькими совпадениями)


ОБНАРУЖЕНИЕ ОШИБОК С ПОМОЩЬЮ GIT 
$ git blame <file> (показывает аннотацию всех строк файла)
$ git blame -L n1, n2 <file> (показывает строки с n1 по n2 в файле)

--- Бинарный поиск ---
$ git bisect start (запуск бинарного поиска)
$ git bisect bad (команда указывающая что текущий коммит сломан)
$ git bisect good [ref] (указываем коммит ref который работает как надо)
$ git bisect reset (возврат HEAD в исходное состояние после поиска)
```
