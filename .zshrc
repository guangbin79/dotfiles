# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.emacs.d/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="ys" #"robbyrussell"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  z
  zsh-syntax-highlighting
  zsh-completions
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# zsh-completions
autoload -U compinit && compinit

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob '!.git/*'"
export FZF_DEFAULT_OPTS="
    --ansi
    --layout reverse
    --color dark,hl:33,hl+:37,fg+:235,bg+:136,fg+:254
    --color info:254,prompt:37,spinner:108,pointer:235,marker:235
    --preview 'bat --color always --plain {} --line-range :300'
"
# bat & fzf.vim
export BAT_THEME="Nord"

# aliases
alias sudo="sudo "
alias vi="vim -u NONE"

# nord-theme
test -r ~/.dir_colors && eval $(dircolors ~/.dir_colors)

# default use tmux
if [ -z $TMUX_TERMINAL ]; then
    export TMUX_TERMINAL=true
    tmux attach-session -t "$USER" &> /dev/null || tmux new-session -s "$USER"
    exit
fi

# prompt
# ${hg_info}\
# ${git_info}\
# ${venv_info}\
export PROMPT="
%{$terminfo[bold]$fg[blue]%}#%{$reset_color%} \
%{$terminfo[bold]$fg[yellow]%}%~%{$reset_color%} \
%{$terminfo[bold]$fg[grey]%}%(!.#.$)%{$reset_color%} \
%{$fg[white]%}$exit_code
%{$terminfo[bold]$fg[white]%}> %{$reset_color%}"

#_fix_cursor() {
    #echo -ne '\e[3 q'
#}
#precmd_functions+=(_fix_cursor)

# shadowsocks
#setproxy() {
    #export all_proxy=socks5://127.0.0.1:7891
    #export socks5_proxy=socks5://127.0.0.1:7891
    #export http_proxy=http://127.0.0.1:7890
    #export https_proxy=http://127.0.0.1:7890
    #export ALL_PROXY=socks5://127.0.0.1:7891
    #export SOCKS5_PROXY=socks5://127.0.0.1:7891
    #export HTTP_PROXY=http://127.0.0.1:7890
    #export HTTPS_PROXY=http://127.0.0.1:7890
    #export NO_PROXY=localhost,127.0.0.0
#}
#unsetproxy() {
    #unset all_proxy
    #unset socks5_proxy
    #unset http_proxy
    #unset https_proxy
    #unset ALL_PROXY
    #unset SOCKS5_PROXY
    #unset HTTP_PROXY
    #unset HTTPS_PROXY
    #unset NO_PROXY
#}

# dev
#keynav daemonize
#setxkbmap -option altwin:swap_lalt_lwin
#setxkbmap -option ctrl:nocaps
