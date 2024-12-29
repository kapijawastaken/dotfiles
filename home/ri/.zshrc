export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH:$HOME/.cargo/bin:$HOME/.dotnet:/home/ri/Applications/opentabletdriver/usr/local/bin
export DOTNET_ROOT="/home/ri/.dotnet"
export SUDO_EDITOR=/usr/bin/vim
export MANPAGER=/usr/bin/vim
export EDITOR=/usr/bin/vim
export ZSH="$HOME/.oh-my-zsh"
export PF_INFO="ascii title os kernel de pkgs uptime"
export PF_COL1=1
export PF_COL3=COL1

ZSH_THEME="darkblood"
DISABLE_LS_COLORS="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

alias v="vim"
alias zshrc="vim ~/.zshrc"
alias se="sudoedit"
alias :q="exit"

zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' frequency 13	# update every 13 days
unsetopt BEEP	# turns off the stupid bell

plugins=(

git 
zsh-lsd
	
)	

source $ZSH/oh-my-zsh.sh	# oh-my-zsh
source <(fzf --zsh)	# fzf

pfetch
echo "  Welcome!"
