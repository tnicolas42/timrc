# source colors
source "$TIMRC_ZSH/color.zsh"

# theme for zsh
# default theme "robbyrussell"
ZSH_THEME="fino"

# use oh-my-zsh
export ZSH=$HOME/.oh-my-zsh
plugins=(
		git
		zsh-autosuggestions
		z
		colored-man-pages
		zsh-syntax-highlighting # must be the last plugin
	)
source $ZSH/oh-my-zsh.sh

# use xterm-256color
export TERM=xterm-256color
# use vim in git (default editor for commit)
export GIT_EDITOR=vim

# alias
if [ ! -z $TIMRC ]; then
	alias timrc="cd $TIMRC"
fi
if [ ! -z $TIMRC_ZSH ]; then
	alias timrc_zsh="cd $TIMRC_ZSH"
fi
if [ ! -z $TIMRC_VIM ]; then
	alias timrc_vim="cd $TIMRC_VIM"
	alias vimrc="vim ~/.vimrc $TIMRC_VIM/timrc.vim $TIMRC_VIM/vimrc/*.vim"
else
	alias vimrc="vim ~/.vimrc"
fi
alias zshrc="vim ~/.zshrc ~/.timrc $TIMRC_ZSH/timrc.zsh && source ~/.zshrc"

# bindkey for use opt+right instead of ctrl+right
bindkey "^[^[[C" forward-word
bindkey "^[^[[D" backward-word

# tabs = 4 spaces
tabs -4

# alias for xclip if it's installed
if [ ! -z "`command -v xclip`" ]; then
	alias c="xclip -selection clipboard"
	alias v="xclip -o"
fi

# alias to open vim and disable error window
alias vimNoErr="vim '+let g:syntastic_auto_loc_list=0'"

# alias to shutdown
alias shutdown='echo "press enter twice to shutdown" && read && read && sudo shutdown -h now'

# alias for type errors
alias -g chekcout='checkout'
alias -g comit='commit'

# tmux
# open tmux splitted in 4
alias tmux4split='tmux new-session -s session -d && tmux split-window -t session:0.0 -h && tmux split-window -t session:0.0 -v && tmux split-window -t session:0.1 -v && tmux attach -t session'
# open tmux splitted in 2
alias tmux2split='tmux new-session -s session -d && tmux split-window -t session:0.0 -h && tmux attach -t session'

# alias to exit
alias :q='exit'
alias :wq='exit'
alias :wqa='exit'

# alias to open vscode -> code <folder>
alias code="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"

source "$TIMRC_ZSH/django.zsh"
