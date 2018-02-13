PROMPT_COMMAND='ConEmuC -StoreCWD'
alias c='clear'
alias ll='ls -l'
alias x='exit'
alias ls='ls -S -1 --color -a'
alias cd1='cd ' $1 && 'ls'
alias vib='vi ~/.bashrc'
PATH=$PATH:'/c/Program Files/Sublime Text 3' $*
PATH=$PATH:'/c/Program Files/Notepad++' $*

git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

PS1='\[\e[1;32m\]\D{%d.%m.%y} \t \[\e[36m\]\w\[\e[33m\]`git_branch`\n\$ \[\e[31m\]'

trap 'printf "\e[0m" "$_"' DEBUG

alias gs='git status'
alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gd='git diff'
alias go='git checkout'
alias gk='gitk --all&'
alias gx='gitx --all'

sd(){
  cd $1
  ls
}

.(){
  cd ..
  ls
}

nodepro(){
  cd /e/nodejs/projects
  ls
}

gitpro(){
  cd /e/GitHub/projects
  ls
}

phaserpro(){
  cd /e/Phaser/projects
  ls
}

xampro(){
  cd /e/XAMPP/htdocs/projects
  ls
}