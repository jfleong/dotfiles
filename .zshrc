# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="Agnoster"
# ZSH_THEME="amuse" - cool but multiline... i guess i can be okay with that
# ZSH_THEME="ys" - a nice multiline one
# ZSH_THEME="pmcgee" # - cool multine line one again, don't like it has a weird auto complete thing

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

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
plugins=(git colorize)

source $ZSH/oh-my-zsh.sh

# User configuration

### XXX: zshrc doesn't have the existing path appended adding it for pleasure
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
export EDITOR="/usr/bin/vim"
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

# Activate scm breeze
[ -s "$HOME/.scm_breeze/scm_breeze.sh" ] && source "$HOME/.scm_breeze/scm_breeze.sh"

# aliases
if [ -f ~/.aliases ]; then
  source ~/.aliases
fi
if [ -f ~/.work_aliases ]; then
  source ~/.work_aliases
fi

# make one big ssh config file
if [ -d ~/.ssh/config_dir ]; then
  cat ~/.ssh/config_dir/* > ~/.ssh/config
fi
[ -s "/Users/jason/.scm_breeze/scm_breeze.sh" ] && source "/Users/jason/.scm_breeze/scm_breeze.sh"
export PATH=$PATH":/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH=$(pyenv root)/shims:$PATH
