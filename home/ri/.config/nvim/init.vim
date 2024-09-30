call plug#begin('~/local/share/nvim/plugged')
Plug 'stevearc/vim-arduino'
call plug#end()
let g:arduino_cli_path = '/usr/bin/arduino-cli'
let g:arduino_board = 'arduino:avr:uno'
