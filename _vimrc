set nocompatible
set nowrap
filetype off
" VUNDLE SETUP
" run this command before first use :
" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
if has("win32")
	set rtp+=$HOME/_vim/bundle/Vundle.vim
else
	set rtp+=~/.vim/bundle/Vundle.vim
endif
if has("mouse")
	set mouse=a
endif
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

Plugin 'The-NERD-tree'
Plugin 'bling/vim-airline'
Plugin 'FuzzyFinder'
Plugin 'L9'
Plugin 'molokai'
Plugin 'cespare/vim-golang'
Plugin 'majutsushi/tagbar'
Plugin 'wesleyche/SrcExpl'
Plugin 'OmniCppComplete'
Plugin 'AutoComplPop'
Plugin 'taglist.vim'
call vundle#end()
filetype plugin indent on

" GLOBAL SETUP
set fileencodings=ucs-bom,utf-8,cp936
set nu
set autoindent
set smartindent
set showmatch
set ruler
set tabstop=4
set shiftwidth=4
set softtabstop=4
set cindent
set incsearch
set cursorline
syntax on
if has("CTAGS_PATH")
	let g:tagbar_ctags_bin = $CTAGS_PATH/ctags
else
	let g:tagbar_ctags_bin = "ctags"
endif
let g:tagbar_right = 1

set t_Co=256
color molokai 
highlight Pmenu ctermfg=0 ctermbg=6 gui=none
highlight PmenuSel ctermfg=7 ctermbg=4 gui=none
highlight PmenuSbar ctermfg=0 ctermbg=9 gui=none

" OmniCppComplete Setup
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au BufNewFile,BufRead,BufEnter *.cpp,*.hpp set omnifunc=omni#cpp#complete#Main
set completeopt=menuone,menu,longest,preview

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

" AIRLINE CONFIG
set laststatus=2
let g:airline#extensions#tabline#enabled=1

" KEY MAPPING
nnoremap <C-Y> :NERDTreeToggle<CR>
nnoremap <F1> :tabn 1<CR>
nnoremap <F2> :tabn 2<CR>
nnoremap <F3> :tabn 3<CR>
nnoremap <F4> :tabn 4<CR>
nnoremap <F5> :tabn 5<CR>
nnoremap <F6> :tabn 6<CR>
nnoremap <F7> :tabn 7<CR>
nnoremap <F8> :tabn 8<CR>
nnoremap <F9> :tabn 9<CR>
nnoremap <F10> :tabn 10<CR>
nnoremap <F11> :tabn 11<CR>
nnoremap <F12> :tabn 12<CR>
nnoremap <C-J> :tabnext<CR>
nnoremap <C-K> :tabprev<CR>
nnoremap <S-L> :TagbarToggle<CR>
nmap <S-M> :SrcExplToggle<CR>
nnoremap <S-C> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

set guifont=Consolas:h11
set fdm=syntax

" CHANGE FILEFORMAT TO UNIX
nnoremap <C-F> :set fileformat=unix<CR>

" GLOBAL QUIT & SAVE
nnoremap <C-X> :q<CR>
nnoremap <C-S> :w<CR>

" FOLD & UNFLOD
nnoremap <C-O> zA
nnoremap <2-LeftMouse> zA

" FOR FUZZYFINDER
nnoremap <leader>ff :FufFile<CR>
nnoremap <leader>fb :FufBuffer<CR>

" SWITCH WINDOW
nnoremap <TAB> <C-W>w

" QUICKFIX WINDOW
command -bang -nargs=? QFix call QFixToggle(<bang>0)
function! QFixToggle(forced)
if exists("g:qfix_win") && a:forced == 0
cclose
unlet g:qfix_win
else
copen 10
let g:qfix_win = bufnr("$")
endif
endfunction
nnoremap <S-Q> :QFix<CR>

nnoremap <C-N> :cn<CR>
nnoremap <C-P> :cp<CR>

" VIMGREP command
map gr :vimgrep <cword> **/*.lua **/*.c **/*.cpp **/*.h<CR>
