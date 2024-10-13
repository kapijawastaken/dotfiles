if status is-interactive
fzf --fish | source
alias v="vim"
alias fishconf="vim ~/.config/fish/config.fish"
alias sv="sudoedit"
alias :q="exit"
fish_add_path -P ~/.cargo/bin
set SUDO_EDITOR /usr/bin/vim
export SUDO_EDITOR
set PF_INFO "ascii title os cpu de pkgs uptime"
export PF_INFO
set PF_COL1 1
export PF_COL1
set PF_COL3 COL1
export PF_COL3
set fish_color_cwd brred
set fish_color_user brred
function fish_greeting
    set_color brred
    echo "Welcome!"
end
pfetch
end
