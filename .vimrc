set nocompatible              " be iMproved, required
filetype on                   " required
filetype off                  " required

" =================================================
" Plugins
" Some things to know about each including a summary and shortcuts you need to
" know
" =================================================
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" You know what it is
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'Yggdroot/indentLine'
Plugin 'hashivim/vim-terraform'

" Git outta here
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

call vundle#end()            " required

filetype plugin indent on    " required

" =================================================
" General
" =================================================
" No swap files
set noswapfile
set nobackup
set nowb
set noswapfile

" teh ruler
set ruler
set colorcolumn=80,100

set number

" bracket matching
set showmatch
set mat=2

""" Tab shit
set expandtab
set smartindent
set shiftwidth=4
set tabstop=4
au FileType python setl sw=4 sts=4 et
au FileType ruby setl sw=2 sts=2 et

""" f*ck word wrapping
set wrap
set linebreak
set nolist " disables linebreak

" =================================================
" Color/Font
" =================================================
syntax enable
set background=dark
colorscheme solarized

if has('gui_running')
    set guifont=Hack:h16
endif

" =================================================
" VIM user interface
" =================================================
set showcmd

" Highlight search results and Ignore case when searching
set hlsearch
set incsearch
set ignorecase


" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Don't redraw while executing macros (good performance config)
set lazyredraw

" =================================================
" Moving around, tabs, windows and buffers
" =================================================

" NERD TREE shortcuts
" Toggle nerdtree with ctrl+t
map <C-t> :NERDTreeToggle<CR>
" C- change current working directory to current selection
" i - open in a horizontal split pane
" s - open in a horizontal split pane
" I - toggle hidden files
" m - open menu (ie for creating new files

" quit escape key'ing
imap jj <Esc>
imap kj <Esc>

let g:multi_cursor_start_key='g<C-n>'
let g:multi_cursor_start_word_key='<C-n>'

" just map Ctrl+b to ctrl+w like tmux
nnoremap <C-b> <C-W>

" allow for ctrl+h|j|k|l
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>
" Window Manipulation
" close window
nnoremap <C-X> <C-W><C-C>

" window height
nnoremap <silent> + :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> - :exe "resize " . (winheight(0) * 2/3)<CR>
" =================================================
" Auto Commands
" =================================================
"
" auto open nerdtree
let NERDTreeShowHidden=1 " If you wanna show hidden, if not 'I' toggles it
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close vim if only nerdTree is open
function! s:CloseIfOnlyControlWinLeft()
  if winnr("$") != 1
    return
  endif
  if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
        \ || &buftype == 'quickfix'
    q
  endif
endfunction
augroup CloseIfOnlyControlWinLeft
  au!
  au BufEnter * call s:CloseIfOnlyControlWinLeft()
augroup END

au VimLeave * :!clear

" =================================================
" Shit (shortcuts) I always Forget
" =================================================
" good to know commands
" ciw - change inner word
" ci( or ci{ - changes the contents of that paren or bracket block
" di( or di{ - deletes the contents of that paren or bracket block

" NAVIGATION
" % - jump to matching brace
