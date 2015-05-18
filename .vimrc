set guifont=DejaVu\ Sans\ Mono\ 9
colorscheme torte
set nocompatible
set ruler
set autochdir

syntax on
set number
set nofoldenable
" Save when running external command
set autowrite
" Show matching bracket
set showmatch
" Indentation
set autoindent
set smartindent
set backupdir=~/.vim/tmp
set directory=~/.vim/swap

let mapleader = ","

" uložení aktuálně editovaného souboru
map <F2> :w<cr>

" skok na předchozí chybové hlášení
map <F3> :cp<cr>

" skok na následující chybové hlášení
map <F4> :cn<cr>

" uložení aktuálně editovaného souboru a spuštění překladu
map m :w<CR> :!clear; make<CR> :!./%<<CR>

" výpis všech chybových hlášení překladače
map <F10> :cl<cr><cr>

" NERDtree konfigurace
" autostart
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"width
 let g:NERDTreeWinSize = 30 

map <F12> :NERDTree<CR>

"Ignorovani velkych a malych pismen pri vyhledavani
set ignorecase
set incsearch
set hlsearch
set smartcase
"hide highlight when enter is pressed
nnoremap <CR> :nohlsearch<CR><CR>

"Delete whitespace on save
"http://vim.wikia.com/wiki/Remove_unwanted_spaces#Automatically_removing_all_trailing_whitespace
autocmd BufWritePre * :%s/\s\+$//e

"GUI specific settings
if has("gui_running")
	set guioptions-=m  "remove menu bar
	set guioptions-=T  "remove toolbar
	set guioptions-=r  "remove right-hand scroll bar
	set guioptions-=L  "remove left-hand scroll bar
	"Invisible characters - http://vimcasts.org/episodes/show-invisibles/
	set list "Show invisible characters
	set listchars=tab:▸\ ,eol:¬,trail:· "Specify what display instead of invisible space
	highlight NonText guifg=#4a4a59 "EOL character color
	highlight SpecialKey guifg=#4a4a59 "Tab and space character color
end

" If I forgot to sudo vim a file, do that with :w!!
cmap w!! %!sudo tee > /dev/null %
