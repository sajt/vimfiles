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

set nowrap

set incsearch   "find the next match as we type the search
set hlsearch    "hilight searches by default
set ignorecase
set smartcase

set number      "add line numbers

"indent settings
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

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
set statusline=%f       "tail of the filename

"turn off needless toolbar on gvim/mvim
set guioptions-=T

set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing

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

let NERDTreeChDirMode = 2
let NERDTreeIgnore = ['\.git$', '\~$', '^tmp$', '^log$', '\.bundle$', '\.sass-cache', '\.swp$', '\.test-app-root$']
let NERDTreeQuitOnOpen = 0
let NERDTreeShowHidden = 1
nnoremap <silent> <leader>n :NERDTreeToggle<cr>
nnoremap <silent> <C-f> :call :FindInNERDTree()<cr>

"make <c-l> clear the highlight as well as redraw
nnoremap <C-L> :nohls<CR><C-L>
inoremap <C-L> <C-O>:nohls<CR>

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

let mapleader=","

"remove trailing whitespace when document is saved
autocmd BufWritePre * :%s/\s\+$//e

" Ack
noremap <leader>a  :Ack!
noremap <leader>A  :AckFromSearch<cr>


