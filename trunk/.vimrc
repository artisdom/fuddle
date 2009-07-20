"ui
syntax on
set number
set mouse=a

set wildmode=list:longest,full
set nocompatible

"text format
set tabstop=4
set shiftwidth=4
set autoindent
set cindent

"search
set ignorecase
set smartcase
set incsearch
set hlsearch
"colorscheme ron

"autocmd
if has("autocmd")
  autocmd BufEnter,BufRead,BufNewFile,BufFilePost * :lcd %:p:h
endif " has("autocmd")

"quick edit/source vimrc
if has("win32")
	let $vimrcfile="$VIM/_vimrc"
"    set columns=120
"    set lines=40
	"set guifont=新宋体:h12:cANSI
	"map ,f :set guifont=新宋体:h12:cANSI<CR>
	"au GUIEnter * :simalt ~x
else
	if has("gui")
		set guioptions-=m
		set guioptions-=T
		set columns=100
		set guifont=WenQuanYi\ Zen\ Hei\ Mono\ Medium
		colorscheme evening
	endif
	let $vimrcfile="$HOME/.vimrc"
	let Tlist_Show_One_File=1
endif


let g:xml_namespace_transparent=1
let g:xml_syntax_folding = 1
"set foldmethod=syntax


nmap ,s :source $vimrcfile<CR>
nmap ,e :e $vimrcfile<CR>

"map
map <F2> :bprevious<CR>
map <F3> :bnext<CR>
map <F4> :w<CR>

map <F5> :cnext<CR>

map <F8> :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

"imap <F5> <C-R>=strftime("%Y-%m-%d")<CR>
imap <F5> <C-R>=strftime("%Y-%m-%d %H:%M")<CR>


