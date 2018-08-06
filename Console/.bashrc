PROMPT_COMMAND="
	ConEmuC -StoreCWD;
	echo -en '\033[37;1;43m ------------ \033[0m\n';
	ls"

alias c='clear'
alias ll='ls -l'
alias x='exit'
alias ls='ls -S -1 --color -a'
alias t='touch'
alias vib='vi ~/.bashrc'

PATH=$PATH:'/c/Program Files/Sublime Text 3' $*
PATH=$PATH:'/c/Program Files/Notepad++' $*
PATH=$PATH:'/e/PHP/PhpStorm 2017.1.4/bin' $*

git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

PS1='\[\e[1;32m\]\D{%d.%m.%y} \t \[\e[36m\]\w\[\e[33m\]`git_branch`\n\$ \[\e[31m\]'
PS2='~ '

trap 'printf "\e[0m" "$_"' DEBUG

alias gs='git status'
alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gd='git diff'
alias go='git checkout'
alias gk='gitk --all&'
alias gx='gitx --all'

phpstorm() {
	phpstorm64.exe $* &
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
