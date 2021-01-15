let $VIM_DATA_DIR=stdpath('data')

if ! filereadable($VIM_DATA_DIR."/autoload/plug.vim")
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p $VIM_DATA_DIR/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > $VIM_DATA_DIR/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

" Plugins categorized following VimAwesome (https://vimawesome.com) categories
call plug#begin($VIM_DATA_DIR."/plugged")
" Language
Plug 'aklt/plantuml-syntax'
Plug 'cespare/vim-toml'
Plug 'ekalinin/Dockerfile.vim'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
" Plug 'jparise/vim-graphql'
Plug 'weirongxu/plantuml-previewer.vim'

" Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-surround'

" Code display
Plug 'kaicataldo/material.vim'

" Integrations
Plug 'airblade/vim-gitgutter'
Plug 'preservim/nerdtree'
Plug 'sebdah/vim-delve'
Plug 'tpope/vim-fugitive'
Plug 'tyru/open-browser.vim'

" Interface
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'voldikss/vim-floaterm'

" Commands
Plug 'dhruvasagar/vim-table-mode'
Plug 'easymotion/vim-easymotion'
Plug 'lambdalisue/suda.vim'
Plug 'tpope/vim-commentary'

" Other
Plug 'editorconfig/editorconfig-vim'
call plug#end()

" General
set nocompatible
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"
set wrap linebreak nolist
set history=500

" Appearance
syntax enable
set number
set relativenumber
set ruler

let g:material_terminal_italics = 1

colorscheme material

" For Neovim > 0.1.5 and Vim > patch 7.4.1799 - https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162
" Based on Vim patch 7.4.1770 (`guicolors` option) - https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd
" https://github.com/neovim/neovim/wiki/Following-HEAD#20160511
if (has("termguicolors"))
  set termguicolors
endif

"" Airline settings
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = "material"

""" Airline: Rounded corners
" let g:airline_left_sep = "\uE0B4"
" let g:airline_left_alt_sep = "\uE0B5"
" let g:airline_right_sep = "\uE0B6"
" let g:airline_right_alt_sep = "\uE0B7"

" let g:fzf_preview_window = 'right:50%'
" let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6  }  }
let g:fzf_command_prefix = 'Fzf'
let g:fzf_layout = { 'down': '~20%' }

" Behavior
set backspace=indent,eol,start

" Mapping
let mapleader = ","

autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)

vmap <C-M-f>  <Plug>(coc-format-selected)
nmap <C-M-f>  <Plug>(coc-format-selected)
nnoremap <C-o> :NERDTreeToggle<cr>
nnoremap <C-p> :FZF<cr>
noremap <C-M-p> :Buffers<cr>
