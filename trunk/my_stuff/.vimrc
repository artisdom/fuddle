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
nmap <Leader>i :SrcExplToggle<CR>


map <F2> :bprevious<CR>
map <F3> :bnext<CR>
map <F4> :w<CR>
map <F5> :cnext<CR>
"map <F8> :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
"map <F12> :ls<CR>

imap <C-F5> <C-R>=strftime("%Y-%m-%d %H:%M")<CR>
" // Set the height of Source Explorer window 
let g:SrcExpl_winHeight = 8 

" // Set 100 ms for refreshing the Source Explorer 
let g:SrcExpl_refreshTime = 100 

" // Set "Enter" key to jump into the exact definition context 
let g:SrcExpl_jumpKey = "<ENTER>" 

" // Set "Space" key for back from the definition context 
let g:SrcExpl_gobackKey = "<SPACE>" 

" // In order to Avoid conflicts, the Source Explorer should know what plugins 
" // are using buffers. And you need add their bufname into the list below 
" // according to the command ":buffers!" 
let g:SrcExpl_pluginList = [ 
        \ "__Tag_List__", 
        \ "_NERD_tree_", 
        \ "Source_Explorer" 
    \ ] 
" // Enable/Disable the local definition searching, and note that this is not 
" // guaranteed to work, the Source Explorer doesn't check the syntax for now. 
" // It only searches for a match with the keyword according to command 'gd' 
let g:SrcExpl_searchLocalDef = 1 

" // Let the Source Explorer update the tags file when opening 
let g:SrcExpl_isUpdateTags = 1 

" // Use program 'ctags' with argument '--sort=foldcase -R' to create or 
" // update a tags file 
let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ." 

" // Set "<F12>" key for updating the tags file artificially 
let g:SrcExpl_updateTagsKey = "<F8>" 

"vim:sw=4 ts=4
