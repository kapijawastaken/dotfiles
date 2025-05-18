colorscheme redish                                                            
let &t_SI = "\e[6 q"                                                          
let &t_EI = "\e[2 q"                                                          
let g:redish_transparent = 1                                                  
let g:NERDTreeWinPos = "right"                                                
let g:NERDTreeShowHidden = 1                                                  
let g:nerdtree_vis_confirm_open = 0                                           
let g:nerdtree_vis_confirm_delete = 0                                         
let g:nerdtree_vis_confirm_copy = 0                                           
let g:nerdtree_vis_confirm_move = 0                                           
nmap <silent> <A-Up> :wincmd k<CR>                                            
nmap <silent> <A-Down> :wincmd j<CR>                                          
nmap <silent> <A-Left> :wincmd h<CR>                                          
nmap <silent> <A-Right> :wincmd l<CR>                                         
autocmd VimEnter * NERDTree | wincmd p                                        
autocmd FileType nerdtree nmap <buffer> <Space> <CR>                          
cnoremap x wqa                                                                
set encoding=UTF-8                                                            
set autoindent expandtab tabstop=2 shiftwidth=2                               
call plug#begin()                                                             
Plug 'jiangmiao/auto-pairs'                                                   
Plug 'stevearc/vim-arduino'                                                   
Plug 'preservim/nerdtree'                                                     
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'                                
Plug 'PhilRunninger/nerdtree-visual-selection'                                
Plug 'ryanoasis/vim-devicons'                                                 
call plug#end()
