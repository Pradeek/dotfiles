set nocompatible " Forget vi. 
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
"  " required! 
Bundle 'gmarik/vundle'

Bundle 'ctrlp.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'mattn/zencoding-vim'
Bundle 'majutsushi/tagbar'
Bundle 'Valloric/YouCompleteMe'
Bundle 'goldfeld/vim-seek'

Bundle 'nono/vim-handlebars'

" Powerline setup. 
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
set laststatus=2 " Always display status line in all windows
set noshowmode " Don't show the current mode at the bottom (since powerline does it)

set  t_Co=256
syntax enable
syntax on 
filetype on
filetype plugin indent on
 
set background=light
" Keep the buffer around when switching between buffers
set hidden
 
" Show line numbers
set number
 
" Basic editing stuff
set wrap " Don't wrap lines
set tabstop=2 " Set tab as 4 spaces
set shiftwidth=2 " No of spaces for autoindent
set backspace=indent,eol,start " Allow backspace for everything in insert mode
set autoindent " Auto indent everything
set copyindent " Copy previous indentation on autoindenting
set shiftround " Use multiple of shiftwidth when indenting with stuff like <

set showmatch " Show matching parenthesis
set ignorecase " Ignore case when searching
set smartcase " ignore case if search pattern is lowercase, case sensitive otherwise
set hlsearch " Hightlight search terms
" <leader>ll to clear highlighted text
nnoremap <silent> <leader>ll :nohlsearch<CR> 
set incsearch " Show search matches as you type

set history=1000 " More history!
set undolevels=1000 " More undo levels!

set title " Show title
set ruler " Display cursor position in lower right corner
set showcmd " Display the command in lower right corner
set wildmenu " Better command-line completion
set wildmode=full " Auto-complete menu

set splitright " Split window below/to the right
set pastetoggle=<F2>
set linespace=1 " Sets linespace (px between lines)

set clipboard=unnamed " Use the OS clipboard by default

set foldmethod=indent " Fold based on indentation
set foldnestmax=1 " Don't go crazy
set nofoldenable " Don't fold unless I tell you to
 
" Make cursor move as expected with wrapped lines
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk
 
" Don't backup files.
set nobackup
set noswapfile
 
" Shows the current command
set showcmd
 
" Set leader to , instead of \
let mapleader=","
 
" Quick edit for the vimrc files
nmap <silent> <leader>ev :e $MYVIMRC<CR>

" automatically reload vimrc when it's saved
au BufWritePost .vimrc so ~/.vimrc
 
" Map <leader>o to go to the previous line (since O is too hard to type)
inoremap <leader>o <ESC>O
nnoremap <leader>o <ESC>O

" Map F1 key to ESC key in all modes
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
 
" Map <leader>e to ESC in insert and visual mode
imap <leader>e <ESC>
vmap <leader>e <ESC>

" Map <leader>n/p to go to next/previous buffer
nmap <leader>n :bn<CR>
nmap <leader>p :bp<CR>
 
" Customize navigation in splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
 
" Make vim look pretty
colorscheme desert

set guifont=Droid\ Sans\ Mono\ For\ Powerline:h14
set guioptions-=m
set guioptions-=T
 
" Map spacebar to colon
" nmap <space> :
 
" Map <leader>s to save file
imap <leader>s <ESC> :w <CR>
nmap <leader>s :w <CR>
vmap <leader>s <ESC> :w <CR>
 
" Bubble single lines
nmap <C-Up> ddkP
nmap <C-Down> ddp
" Bubble multiple lines
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]
 
" Copy paste the normal way 
nmap <C-V> "+gP
vmap <C-X> "+x
vmap <C-C> "+y 
 
" Save when you lose focus (don't warn about unsaved files)
au FocusLost * silent! wa
" Do it when i change buffers as well
set autowrite
 
" Make cursor to always stay in the middle of the window
set scrolloff=999
 
" Yank(Copy) entire file
nmap <leader>cc :%y+ <CR>

" Shortcuts for easier editing
inoremap <leader>u <ESC>u
inoremap <leader>w <ESC>bcw

" Better shortcuts for incrementing/decrementing numbers
nnoremap + <C-a>
nnoremap - <C-x>

" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Automatic commands
if has("autocmd")
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
endif


" Set shortcut for NERDTree
inoremap <leader>nt :NERDTreeToggle <CR>
nnoremap <leader>nt :NERDTreeToggle <CR>
vnoremap <leader>nt :NERDTreeToggle <CR>
 
" Zencoding plugin options
" Changing expansion to Ctrl-e and enabling tag name completion
let g:user_zen_expandabbr_key = '<c-e>'
let g:use_zen_complete_tag = 1

" TagBar view
nmap <leader>t :TagbarToggle<CR>

" Disable syntastic plugin for html files since it complains about templates
" in script tags
let g:syntastic_mode_map={ 'mode': 'active',
                     \ 'active_filetypes': [],
                     \ 'passive_filetypes': ['html'] }

" CtrlP settings
let g:ctrlp_map = '<leader>f'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.yardoc\|node_modules$',
  \ 'file': '\.exe$\|\.so$\|\.dat|tags|*.pyc|\.DS_Store$'
  \ }

" Load local matchit.vim if not loaded
" Enables % to match open/close parens, blocks, etc
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
	runtime! macros/matchit.vim
endif

" Tell YouCompleteMe to take identifiers from tags
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.'],
  \   'objc' : ['->', '.'],
  \   'ocaml' : ['.', '#'],
  \   'cpp,objcpp' : ['->', '.', '::'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,vim,python,perl6,scala,vb,elixir,go' : ['.'],
  \   'ruby' : ['.', '::'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \ }
