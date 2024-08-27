if status is-interactive
    # Commands to run in interactive sessions can go here
end
# Set up fzf key bindings
fzf --fish | source
alias m="sudo micro"
alias fishconf="sudo micro ~/.config/fish/config.fish"
fish_add_path -P ~/.cargo/bin
set PF_INFO "ascii title os cpu de pkgs uptime"
export PF_INFO
set PF_COL1 1
export PF_COL1
set PF_COL3 COL1
export PF_COL3
set fish_color_cwd red
set fish_color_user red
function fish_greeting
    set_color red
    echo "Welcome, Ri!"
end
pfetch
