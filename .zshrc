ZSH_THEMES=$HOME/.zsh/themes
ZSH_PLUGIN=$HOME/.zsh/plugins

autoload -Uz compinit promptinit
compinit

##########
# Prompt #
##########
autoload -Uz vcs_info
precmd() { vcs_info }
# zstyle ':vcs_info:git:*' formats '%b'
# Solarized color scheme refernce https://github.com/altercation/vim-colors-solarized
# 256 colors: https://jonasjacek.github.io/colors/
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '!'
zstyle ':vcs_info:*' stagedstr '+'
zstyle ':vcs_info:*' formats "%F{160}%u%f%c %b"

# Updates editor information when the keymap changes.
setopt PROMPT_SUBST
PS1='%B%K{166}work%k%b:%F{245}%1~%f >'
RPS1='%F{245}${vcs_info_msg_0_}%f'

###########
# Plugins #
###########
source $ZSH_PLUGIN/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH_PLUGIN/zsh-syntax-highlighting-filetypes.zsh
source $ZSH_PLUGIN/git.zsh

##############
# Completion #
##############
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

#####################
# Vim mode bindings #
#####################
bindkey -v
# allow ctrl-p, ctrl-n for navigate history (standard behaviour)
bindkey '^P' up-history
bindkey '^N' down-history
# allow ctrl-h, ctrl-w, ctrl-? for char and word deletion (standard behaviour)
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
# reverse history search
bindkey '^r' history-incremental-search-backward

###########
# Aliases #
###########
# amzn aliases
alias cxh='cd ~/workplace/javacart/src/CartExperienceHorizonteWebapp/'
alias bb=brazil-build
alias bba='brazil-build apollo-pkg'
alias bre='brazil-runtime-exec'
alias brc='brazil-recursive-cmd'
alias bws='brazil ws'
alias bwsuse='bws use --gitMode -p'
alias bwscreate='bws create -n'
alias brc=brazil-recursive-cmd
alias bbr='brc brazil-build'
alias bball='brc --allPackages'
alias bbb='brc --allPackages brazil-build'
alias bbra='bbr apollo-pkg'
alias cdesk="ssh clouddesk"

alias selenium-server3='java -Dwebdriver.chrome.driver=/Users/alanjos/Documents/cartqa_files/chromedriver -jar ~/Documents/cartqa_files/selenium-server-standalone-3.141.59.jar -port 5555'
alias selenium-server='java -Dwebdriver.chrome.driver=/Users/alanjos/Downloads/chromedriver -jar ~/Downloads/selenium-server-standalone-2.53.1.jar -port 5555'
alias odin="ssh -fNL 2009:127.0.0.1:2009 alanjos.aka.corp.amazon.com"
alias jcd="ssh -fNL 13001:localhost:13001 dev-dsk-alanjos-1b-34afe678.eu-west-1.amazon.com"
alias bpath="echo RCXQA_CONFIG_OVERRIDE && brazil-path testbuild.configfarm.brazil-config,config,webapps,ApolloCmd && echo CORAL_CONFIG_PATH && brazil-path run.coralconfig"
# my aliasies
alias ctags="`brew --prefix`/bin/ctags"
alias tmux-reload='tmux source-file ~/.tmux.conf'
alias mrdp="ssh -fNL 13390:localhost:3389 dev-dsk-alanjos-1b-34afe678.eu-west-1.amazon.com"
###########
# History #
###########
# number of lines kept in history
export HISTSIZE=1000
# number of lines saved in the history after logout
export SAVEHIST=1000
# location of history
export HISTFILE=~/.zsh_history
# append command to history file once executed
setopt inc_append_history
# only show past commands that include the current input
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

########
# Misc #
########
# Automatically use cd when paths are entered without cd
setopt autocd

#############
# Variables #
#############
# Default applications
export EDITOR=vim
export BROWSER=firefox
# more colors
export TERM=xterm-256color
# path variable
export PATH=$HOME/bin:$HOME/.toolbox/bin:$PATH
# to fix Warning: Failed to set locale category * to *.
export LC_ALL=en_US.UTF-8