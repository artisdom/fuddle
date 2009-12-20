syntax on
set nocompatible
set number
set mouse=a
set wildmode=list:longest,full

"text format
set tabstop=4
set shiftwidth=4
set noexpandtab
set autoindent
set cindent

"encoding
set fencs=utf-8,gbk

"search
set ignorecase
set smartcase
set incsearch
set hlsearch

"autocmd
if has("autocmd")
  autocmd BufEnter,BufRead,BufNewFile,BufFilePost * :lcd %:p:h
endif

if has("win32")
	let $vimrcfile="$VIM/_vimrc"
	set guioptions-=m
	set guioptions-=T
    set columns=120
    set lines=40
	colorscheme evening
	"set guifont=Courier_New:h9:cANSI
	"set guifont=新宋体:h12:cANSI
	"map ,f :set guifont=新宋体:h12:cANSI<CR>
	"au GUIEnter * :simalt ~x
else
	let $vimrcfile="$HOME/.vimrc"
	if has("gui")
		set guioptions-=m
		set guioptions-=T
		colorscheme desert
	endif
endif

let Tlist_Show_One_File=1

nmap <Leader>s :source $vimrcfile<CR>
nmap <Leader>e :e $vimrcfile<CR>
nmap <Leader>g :e $HOME/.vim/GetLatest/GetLatestVimScripts.dat<CR>
nmap <Leader>n :NERDTreeToggle<CR>
nmap <Leader>t :TlistToggle<CR>
nmap <Leader>m :MRU<CR>
nmap <Leader>p :set spell!<CR>

map <F2> :bprevious<CR>
map <F3> :bnext<CR>
map <F4> :w<CR>
map <F5> :cnext<CR>
map <F8> :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
"map <F12> :ls<CR>

imap <C-F5> <C-R>=strftime("%Y-%m-%d %H:%M")<CR>

"vim:sw=4 ts=4
