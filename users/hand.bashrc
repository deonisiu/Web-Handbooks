PROMPT_COMMAND='ConEmuC -StoreCWD'
alias c='clear'
alias ll='ls -l'
alias x='exit'
alias ls='ls -S -1 --color'
alias cd1='cd ' $1 && 'ls'
alias vib='vi ~/.bashrc'
PATH=$PATH:'/c/Program Files/Sublime Text 3' $*

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