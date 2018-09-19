PROMPT_COMMAND="
	ConEmuC -StoreCWD;
	echo -en '\033[37;1;41m ------------ \033[0m\n';
	ls"
#c;

alias c='clear'
alias ll='ls -l'
alias x='exit'
alias ls='ls -S -1 --color -a'
alias t='touch'

PATH=$PATH:'/c/Program Files/Sublime Text 3' $*
PATH=$PATH:'/c/Program Files/Notepad++' $*
PATH=$PATH:'/e/PHP/PhpStorm 2017.1.4/bin' $*
PATH=$PATH:'/e/JavaScript/WebStorm 2017.1/bin' $*
PATH=$PATH:'/c/Program Files/Opera' $*

git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

PS1='\[\e[1;32m\]\D{%d.%m.%y} \t \[\e[36m\]\w\[\e[33m\]`git_branch`\n\$ \[\e[31m\]'
PS2='~ '

trap 'printf "\e[0m" "$_"' DEBUG

alias server='browser-sync start --server --files "*/*.html, */*.css, */*.php, */*.js"'
alias gs='git status'
alias ga='git add'
alias gb='git branch -v'
alias gc='git commit'
alias gd='git diff'
alias go='git checkout'
alias gk='gitk --all&'
alias gr='git remote'
alias gp='git push'
alias gf='git fetch'
alias gl='git log'
alias gal='git all'
alias g_recommit='git commit --amend'
alias g_untr='git rm --cached'
alias g_res='git reset HEAD'
alias g_find='git grep'
alias g_rev='git revert'
alias g_space='git diff --check'
alias g_move='git reset'

add_branch() {
	gr add $1 $2
}

.bashrc() {
	subl ~/.bashrc
}

.gitconf() {
	subl ~/.gitconfig
}

opera() {
	opera.exe $* &
}

storm() {
	phpstorm64.exe $* &
}

web_storm() {
	webstorm64.exe $* &
}

t_subl() {
	t $*
	subl $*
}

t_pstorm() {
	t $*
	phpstorm64.exe $* &
}

sd(){
  cd $1
}

.(){
  cd ..
}

localhost(){
  cd /e/OpenServer/OSPanel/domains/localhost
}

download() {
	cd /d/downloadWORK
}

books() {
	cd /e/books
}

home() {
	cd /e/Projects
}

m_dir() {
	mkdir $*
}
.bashrc() {
	subl ~/.bashrc
}

.gitconf() {
	subl ~/.gitconfig
}

opera() {
	opera.exe $* &
}

storm() {
	phpstorm64.exe $* &
}

web_storm() {
	webstorm64.exe $* &
}

t_subl() {
	t $*
	subl $*
}

t_pstorm() {
	t $*
	phpstorm64.exe $* &
}

sd(){
  cd $1
}

.(){
  cd ..
}

localhost(){
  cd /e/OpenServer/OSPanel/domains/localhost
}

download() {
	cd /d/downloadWORK
}

home() {
	cd /e/Projects
}

m_dir() {
	mkdir $*
}
