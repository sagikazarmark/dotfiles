let $VIM_CONFIG_DIR=system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim"')
let $VIM_DATA_DIR=system('echo -n "${XDG_DATA_HOME:-$HOME/.local/share}/nvim"')

if ! filereadable($VIM_DATA_DIR."/autoload/plug.vim")
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p $VIM_DATA_DIR/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > $VIM_DATA_DIR/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif


" General

syntax enable
set nocompatible
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"
set wrap linebreak nolist

set history=500

call plug#begin($VIM_DATA_DIR."/plugged")
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'easymotion/vim-easymotion'
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'aklt/plantuml-syntax'
Plug 'tyru/open-browser.vim'
Plug 'weirongxu/plantuml-previewer.vim'
Plug 'kaicataldo/material.vim'
call plug#end()

set number
set relativenumber

set backspace=indent,eol,start

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = "material"

" airline symbols
let g:airline_left_sep = "\uE0B4"
let g:airline_left_alt_sep = "\uE0B5"
let g:airline_right_sep = "\uE0B6"
let g:airline_right_alt_sep = "\uE0B7"

set ruler

vmap <C-M-f>  <Plug>(coc-format-selected)
nmap <C-M-f>  <Plug>(coc-format-selected)
nnoremap <C-f> :NERDTreeToggle<cr>
nnoremap <C-p> :FZF<cr>
noremap <C-M-p> :Buffers<cr>

" Colour stuff
if (has("termguicolors"))
  set termguicolors
endif
set background=dark
colorscheme material
let g:material_terminal_italics=1
