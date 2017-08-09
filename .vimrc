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
Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'Yggdroot/indentLine'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-surround'
Plugin 'hashivim/vim-terraform'

" Requires brew install ack
Plugin 'mileszs/ack.vim'
Plugin 'kien/ctrlp.vim'

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

set splitbelow
set splitright

" if you want textmate style past 80 chars
" let &colorcolumn=join(range(81,999),",")

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" Tab shit
set expandtab
set smartindent
set shiftwidth=4
set tabstop=4
au FileType python setl sw=4 sts=4 et
au FileType ruby setl sw=2 sts=2 et

" f*ck word wrapping
set wrap
set linebreak
set nolist " disables linebreak

set noerrorbells
set novisualbell
set t_vb=
autocmd! GUIEnter * set vb t_vb=

" =================================================
" Color/Font
" =================================================
syntax enable
set background=dark
colorscheme solarized
set guifont=Hack:h16

"# for shit in mvim
if has('gui_running')
endif

" =================================================
" VIM user interface
" =================================================
set number
set showcmd

" Crosshairs for your cursor
" set cursorline
" THIS DOESN'T WORK
" hi CursorLine ctermbg=8 ctermfg=15
" set cursorcolumn

" Highlight search results and Ignore case when searching
set hlsearch
set incsearch
set ignorecase


" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Don't redraw while executing macros (good performance config)
set lazyredraw

" for fuzzy searching, do this in NERDTree
map <C-p> ::CtrlP

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
"comment types overrides
autocmd FileType php set commentstring=//\ %s
autocmd FileType py set commentstring=#\ %s

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
" Also switch from nerdtree by default
autocmd VimEnter * wincmd w
let NERDTreeIgnore = ['\.pyc$']

" =================================================
" Shit (shortcuts) I always Forget
" =================================================
" good to know commands
" ciw - change inner word
" ci( or ci{ - changes the contents of that paren or bracket block
" di( or di{ - deletes the contents of that paren or bracket block

" NAVIGATION
" % - jump to matching brace
"
" for lining up tabs
" Plugin 'godlygeek/tabular'
" :Tab /= line up teh equals signs
" :Tab /:\zs keep the : near the word
"
" VIM-Surround
" cs'" - replace single quotes to double quotes
" cs"' - replace double quotes to single quotes
" ysiw( | [ - wrap inner word with paren or bracket
" yss( | [ - wrap entire line with paren or bracket
