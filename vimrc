"load pathogen managed plugins
call pathogen#runtime_append_all_bundles()

"Use Vim settings, rather then Vi settings (much better!).
"This must be first, because it changes other options as a side effect.
set nocompatible

set encoding=utf-8

"store lots of :cmdline history
set history=100

set showcmd     "show incomplete cmds down the bottom
set showmode    "show current mode down the bottom

set incsearch   "find the next match as we type the search
set hlsearch    "hilight searches by default
set ignorecase
set smartcase

set number      "add line numbers

"indent settings
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set list listchars=tab:\ \ ,trail:·
set autoindent

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*

" Status bar - always have a status displayed
set laststatus=2

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

set backspace=indent,eol,start "backspace through everything in insert mode

"set showbreak=...
"set wrap linebreak nolist

"add some line space for easy reading
set linespace=4

"disable visual bell
set visualbell t_vb=

"statusline setup
set statusline =%r%m%f\ %y
set statusline +=%=%l,%c

"turn off needless toolbar on gvim/mvim
set guioptions-=T

set formatoptions-=o "dont continue comments when pushing o/O

"load ftplugins and indent files
filetype plugin on
filetype indent on

"turn on syntax highlighting
syntax enable
syntax on

"some stuff to get the mouse going in term
set mouse=a
set ttymouse=xterm2

"hide buffers when not displayed
set hidden

""" Key mappings

"make <c-l> clear the highlight as well as redraw
nnoremap <C-L> :nohls<CR><C-L>
inoremap <C-L> <C-O>:nohls<CR>

" Switch to command mode without reaching up
inoremap kj <Esc>

"key mapping for window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"disable movement with arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

"key mapping for tab navigation
nmap <Tab> gt
nmap <S-Tab> gT

"make <c-l> clear the highlight as well as redraw
nnoremap <D-L> :nohls<CR><C-L>
inoremap <D-L> <C-O>:nohls<CR>

" Switch to command mode without reaching up
inoremap kj <Esc>

""" Auto commands

"remove trailing whitespace when document is saved
autocmd BufWritePre * :%s/\s\+$//e

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby
au BufRead,BufNewFile *.{cljs}    set ft=clojure

" md, markdown, and mk are markdown and define buffer-local preview
" au BufNewFile,BufRead *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()
au BufNewFile,BufRead *.{md,markdown,mdown,mkd,mkdn} set ft=markdown

" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

function s:setupWrapping()
  set wrap
  set wrapmargin=2
  set textwidth=72
endfunction

au BufRead,BufNewFile *.txt call s:setupWrapping()

let mapleader=","

" Color scheme and font
if has('gui_running')
  colorscheme molokai
  "set background=dark
  set guifont=DejaVu\ Sans\ Mono:h13
else
  colorscheme solarized
  "set background=light
endif

" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" % to bounce from do to end etc.
runtime! macros/matchit.vim

" To prevent CommandT from indexing those files
set wildignore+=*vendor*,tmp/*
""""" Plugin configuration

" Ack
noremap <leader>a  :Ack!
noremap <leader>A  :AckFromSearch<cr>

" Command-T configuration
let g:CommandTMaxHeight=20

" ZoomWin configuration
map <Leader><Leader> :ZoomWin<CR>

" NERDTree configuration
let NERDTreeChDirMode = 2
let NERDTreeIgnore = ['\.pyc$', '\.rbc$', '\.git$', '\~$', '^tmp$', '^log$', '\.bundle$', '\.sass-cache', '\.swp$', '\.test-app-root$']
let NERDTreeQuitOnOpen = 0
let NERDTreeShowHidden = 1
nnoremap <silent> <leader>n :NERDTreeToggle<cr>
nnoremap <silent> <C-f> :call :FindInNERDTree()<cr>

"map to bufexplorer
nnoremap <leader>b :BufExplorer<cr>

"jump to last cursor position when opening a file
"dont do it when writing a commit log entry
autocmd BufReadPost * call SetCursorPosition()
function! SetCursorPosition()
    if &filetype !~ 'commit\c'
        if line("'\"") > 0 && line("'\"") <= line("$")
            exe "normal! g`\""
            normal! zz
        endif
    end
endfunction


