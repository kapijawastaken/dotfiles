if status is-interactive
    # Commands to run in interactive sessions can go here
end
# Set up fzf key bindings
fzf --fish | source
alias m="sudo micro"
alias fishconf="sudo micro ~/.config/fish/config.fish"
fish_add_path -P ~/.cargo/bin
pfetch
