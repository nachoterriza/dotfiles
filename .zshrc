# If you come from bash you might have to change your $PATH.
#export PATH=/opt/anaconda/bin:$HOME/scripts:$PATH
export PATH=$HOME/scripts:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/nacho/.oh-my-zsh
export VISUAL="nvim"
export EDITOR="nvim"
export QT_QPA_PLATFORMTHEME="qt5ct"
export QT_STYLE_OVERRIDE="gtk2"
export GTK2_RC_FILES=/home/nacho/.gtkrc-2.0
export GTK_THEME=NumixSolarizedDarkGreen
export TERMINFO=/home/nacho/.terminfo/s/st-256color
export _JAVA_AWT_WM_NONREPARENTING=1
export MANPAGER="nvim -c 'set ft=man' -"
export CM_DIR="/tmp"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="nuevotema"

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
plugins=(git)

source $ZSH/oh-my-zsh.sh
unsetopt AUTO_CD
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
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias vim="nvim"
alias dmesg="dmesg --color=always"
alias sudo="sudo "

# Fix Inicio y Fin
bindkey "[7~" beginning-of-line
bindkey "[8~" end-of-line

source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# Pastebin client https://ptpb.pw
pb () {
    curl -F "c=@${1:--}" https://ptpb.pw/
}

# Generate random string from /dev/urandom: size is parameter
random_string () {
    cat /dev/urandom | tr -cd 'a-zA-Z0-9' | fold -w ${1:-32} | head -n 1
}

# Generate random string including special characters (for passwords)
random_passwd () {
        cat /dev/urandom | tr -cd 'a-zA-Z0-9 !"#$%&()*+,-./:;<=>?@[\]^_`{|}~' | fold -w ${1:-32} | head -n 1
}

# Start the gpg-agent if not already running
if ! pgrep -x -u "${USER}" gpg-agent >/dev/null 2>&1; then
  gpg-connect-agent /bye >/dev/null 2>&1
fi

# Set SSH to use gpg-agent
#unset SSH_AGENT_PID
#if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
#  export SSH_AUTH_SOCK="/run/user/$UID/gnupg/S.gpg-agent.ssh"
#fi

GPG_TTY=$(tty)
export GPG_TTY

# Refresh gpg-agent tty in case user switches into an X session
gpg-connect-agent updatestartuptty /bye >/dev/null

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# export PATH="$PATH:$HOME/.rvm/bin"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#exec fish
