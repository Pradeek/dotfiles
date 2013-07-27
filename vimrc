" Super standard stuff
set nocompatible " Forget vi.
filetype off

" Set up Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" Plugins
" Window manager
Bundle 'spolu/dwm.vim'
" Undo management
Bundle 'sjl/gundo.vim'
" VCS
Bundle 'Lawrencium'
Bundle 'tpope/vim-fugitive'
" Tmux integration
Bundle 'benmills/vimux'
" Make FocusLost work in vim -> tmux -> iTerm2
Bundle 'sjl/vitality.vim'
" Align stuff
Bundle 'godlygeek/tabular'
" Repeat plugin commands
Bundle 'tpope/vim-repeat'
" Add comments faster
Bundle 'tpope/vim-commentary'
" vimproc
Bundle 'Shougo/vimproc.vim'
" outline
Bundle 'Shougo/unite-outline'
" vimshell
Bundle 'Shougo/vimshell.vim'
" vimfiler
Bundle 'Shougo/vimfiler.vim'
" Unite.vim
Bundle 'Shougo/unite.vim'
" Unite-ssh
Bundle 'Shougo/unite-ssh'
" Bunch of color schemes
Bundle 'Colour-Sampler-Pack'
" Status bar
Bundle 'bling/vim-airline'
" Bindings for ack (using ag in the back)
Bundle 'mileszs/ack.vim'
" Syntax checker
Bundle 'scrooloose/syntastic'
" File explorer
Bundle 'scrooloose/nerdtree'
" Zencoding for HTML
Bundle 'mattn/zencoding-vim'
" Tagbar / Autocomplete / Go to symbol
Bundle 'majutsushi/tagbar'
Bundle 'Valloric/YouCompleteMe'
Bundle 'travisjeffery/vim-gotosymbol'
" Go to character
Bundle 'goldfeld/vim-seek'
" Change surrounding text
Bundle 'tpope/vim-surround'
" Snippets
Bundle 'SirVer/ultisnips'
" Adds closing tags automatically
Bundle 'Raimondi/delimitMate'
" Allows selection of multiple occurances of a patterns for faster changes
Bundle 'terryma/vim-multiple-cursors'
" Javascript intelligence
Bundle 'marijnh/tern_for_vim'
" Python awesomeness
Bundle 'klen/python-mode'
" Better syntax
Bundle 'jelera/vim-javascript-syntax'
Bundle 'django.vim'
Bundle 'nono/vim-handlebars'

" Status bar config
" Powerline setup.
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
set laststatus=2 " Always display status line in all windows
set noshowmode " Don't show the current mode at the bottom (since powerline does it)
" Vim-airline setup
let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'

" General settings
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
" set wrap " Wrap lines
" set textwidth=80 " Cut down anything > 80 chars
" Wrapping is being really annoying.
set nowrap
set tabstop=4 " Set tab as 4 spaces
set shiftwidth=4 " No of spaces for autoindent
set expandtab " Expand tabs to spaces
set backspace=indent,eol,start " Allow backspace for everything in insert mode
set autoindent " Auto indent everything
set copyindent " Copy previous indentation on autoindenting
set shiftround " Use multiple of shiftwidth when indenting with stuff like <
set linespace=1 " Sets linespace (px between lines)
set wildmenu " Better command-line completion
set wildmode=full " Auto-complete menu
" Make cursor move as expected with wrapped lines
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk
" Automatically save files when i switch buffers
set autowrite
" Enable mouse in normal mode
set mouse=n

" Don't backup files.
set nobackup
set noswapfile

" Undo across sessions
set undodir=~/.vim-undo
set undofile
set undolevels=1000 "max number of changes that can be undone
set undoreload=10000 "max number lines to save for undo on buffer reload

" Search
set showmatch " Show matching parenthesis
set ignorecase " Ignore case when searching
set smartcase " ignore case if search pattern is lowercase, case sensitive otherwise
set hlsearch " Hightlight search terms
" <leader>ll to clear highlighted text
nnoremap <silent> <leader>ll :nohlsearch<CR>
set incsearch " Show search matches as you type

" History
set history=1000 " More history!
set undolevels=1000 " More undo levels!

" Window settings
set title " Show title
set ruler " Display cursor position in lower right corner
set showcmd " Display the command in lower right corner
set splitright " Split window below/to the right
" Make cursor to always stay in the middle of the window
set scrolloff=999

" Clipboard settings
set clipboard=unnamed " Use the OS clipboard by default
set pastetoggle=<leader>pp
nnoremap Y bv$hd

" Set leader to , instead of \
let mapleader=","

" Annoyances
command! -bang -range=% -complete=file -nargs=* W <line1>,<line2>write<bang> <args>
command! -bang -range=% -complete=file -nargs=* E <line1>,<line2>write<bang> <args>
command! -bang Q quit<bang>

" Trim trailing spaces
function! TrimTrailingWhitespace()
  execute "normal mz"
  %s/\s\+$//ge
  execute"normal `z"
endfunction

" Load all auto commands only once
if !exists("autocommands_loaded")
    let autocommands_loaded = 1
    " Automatically reload .vimrc on save
    autocmd BufWritePost .vimrc source %
    " Save when you lose focus (don't warn about unsaved files)
    autocmd FocusLost * silent! wa
    " Treat .json files as .js
    autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
    " Trim trialing whitespace always
    autocmd BufWrite * :call TrimTrailingWhitespace()
    " Jump to the last position when reopening a file
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" vimrc shortcut and fold expression
nmap <silent> <leader>ev :e $MYVIMRC<CR>
autocmd FileType vim call s:vimrc_settings()
function! s:vimrc_settings()
    setlocal foldmethod=expr
    setlocal foldexpr=GetVimScriptFold(v:lnum)
    function! GetVimScriptFold(line_number)
        let current_line = getline(a:line_number)
        if current_line =~? '\v^\"'
            return '1'
        elseif current_line =~? '\v^\s*$'
            return '0'
        else
            return 1
        endif
    endfunction
endfunction

" indent and keep selection so that I can do it again
vnoremap < <gv
vnoremap > >gv

" Map <leader>o to go to the previous line (since O is too hard to type)
inoremap <leader>o <ESC>O
nnoremap <leader>o <ESC>O

" Map jj to ESC key in insert mode
inoremap jj <ESC>

" Map <leader>e to ESC in insert and visual mode
inoremap <leader>e <ESC>
vnoremap <leader>e <ESC>

" Emacs key-binding in vim!
inoremap <C-a> <C-o>0
inoremap <C-e> <C-o>$
nnoremap <C-e> $
nnoremap <C-a> 0

" Fast switching between files
nnoremap ,; <C-^>

" Make vim look pretty
colorscheme desert

" Convinent save/delete
" Using noremap for the mappings below screws up insert mode
" Map <leader>s to save file
inoremap <leader>s <ESC> :w <CR>
nnoremap <leader>s <ESC> :w <CR>
vnoremap <leader>s <ESC> :w <CR>
" Map <leader>d to delete the buffer
inoremap <leader>d <ESC> :bd <CR>
nnoremap <leader>d <ESC> :bd <CR>
vnoremap <leader>d <ESC> :bd <CR>

" Bubble text
" Bubble single lines
"nnoremap <C-k> ddkP
nnoremap <C-j> ddp
" Bubble multiple lines
vnoremap <C-k> xkP`[V`]
vnoremap <C-j> xp`[V`]

" Easier shortcuts for cursor nav
nnoremap ww 10k
nnoremap ss 10j

" Shortcuts for easier editing
inoremap <leader>u <ESC>u
inoremap <leader>w <ESC>ciw

" Better shortcuts for incrementing/decrementing numbers
nnoremap + <C-a>
nnoremap - <C-x>

" Operator mappings
onoremap p i(

" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" markdown helpers
nnoremap <leader>h1 yyp^v$r=
nnoremap <leader>h2 yyp^v$r-

" Remote file editing goodness
if !exists("g:remote_edit_session_host")
    let g:remote_edit_session_host = ''
endif
function! RemoteEditOpen(host)
    let g:remote_edit_session_host = a:host
    echo 'Opening ssh session to ' . a:host
    silent execute '!ssh -f -N ' . a:host | redraw!
    echo 'Opened ssh session to ' . a:host
    echo 'Do not forget to call RemoteEditEnd once you are done'
endfunction
function! RemoteEditClose()
    silent execute '!ps -ef | grep ' . g:remote_edit_session_host . ' | grep -v grep | awk ' . "'{print $2'}" .' | xargs kill -9' | redraw!
    echo 'Closed connection to ' . g:remote_edit_session_host
    let g:remote_edit_session_host = ''
endfunction
command! -nargs=1 RemoteEdit call RemoteEditOpen("<args>")
command! RemoteEditEnd call RemoteEditClose()

" Vimux
nnoremap <leader>r :VimuxPromptCommand <CR>
nnoremap <leader>r. :VimuxRunLastCommand <CR>

" Set shortcut for NERDTree
nnoremap <leader>nt :NERDTreeToggle <CR>
vnoremap <leader>nt :NERDTreeToggle <CR>

" Gundo mapping
nnoremap <leader>u :GundoToggle <CR>

" Tabular mappings
let mapleader=','

" Tabularize
if exists(":Tabularize")
  nnoremap <Leader>a= :Tabularize /=<CR>
  vnoremap <Leader>a= :Tabularize /=<CR>
  nnoremap <Leader>a: :Tabularize /:\zs<CR>
  vnoremap <Leader>a: :Tabularize /:\zs<CR>
endif

" Zencoding plugin options
" Changing expansion to Ctrl-e and enabling tag name completion
let g:user_zen_expandabbr_key = '<c-e>'
let g:use_zen_complete_tag = 1

" Disable syntastic plugin for html files since it complains about templates
" in script tags
let g:syntastic_mode_map={ 'mode': 'active',
                \ 'active_filetypes': [],
                \ 'passive_filetypes': ['html'] }

" Replaced by Unite.vim - Leaving it here in case I come back
" CtrlP settings
" let g:ctrlp_map = '<leader>f'
" set wildignore+=*.pyc,*.orig,*.rej,*.git/*,*.hg/*

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
\   'cs,java,vim,python,javascript,perl6,scala,vb,elixir,go' : ['.'],
\   'ruby' : ['.', '::'],
\   'lua' : ['.', ':'],
\   'erlang' : [':'],
\ }

" Making Ultisnips work with Tab
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
function! g:UltiSnips_Complete()
call UltiSnips_ExpandSnippet()
if g:ulti_expand_res == 0
if pumvisible()
    return "\<C-n>"
else
    call UltiSnips_JumpForwards()
    if g:ulti_jump_forwards_res == 0
        return "\<TAB>"
    endif
endif
endif
return ""
endfunction
autocmd BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"

" Mapping for GotoSymbol
nnoremap <leader>t :GotoSymbol

" tern for javascript config
let g:tern_map_keys=1
set completeopt-=preview " Don't open the goddamn scratch buffer everytime

" Tell ack.vim to use ag instead.
let g:ackprg = 'ag --nogroup --nocolor --column'

" Vim python-mode
autocmd FileType python call s:python_mode_settings()
function! s:python_mode_settings()
    let g:pymode_lint_write = 0
    let g:pymode_lint = 0
    let g:pymode_rope = 1
    let g:pymode_rope_enable_autoimport = 0
    let g:pymode_folding = 1
    let g:pymode_motion = 1
    nnoremap <leader>gd :call RopeGotoDefinition()<CR>
endfunction

" DWM.vim
nnoremap <silent> <C-w> :call DWM_New()<CR>
nnoremap <silent> <leader>q :exec DWM_Close()<CR>
" The two commands below screw up arrow keys in normal mode
" nnoremap <silent> <C-]> :call DWM_GrowMaster()<CR>
" nnoremap <silent> <C-[> :call DWM_ShrinkMaster()<CR>
nnoremap <silent> <Tab> :call DWM_Rotate(0)<CR>
nnoremap <silent> <S-Tab> :call DWM_Rotate(1)<CR>
nnoremap <leader>w :wincmd w<CR>
nnoremap <leader>W :wincmd W<CR>
let g:dwm_master_pane_width=120

" Unite.vim
" Always go to insert mode
let g:unite_enable_start_insert = 1
" Yank history
let g:unite_source_history_yank_enable = 1
" Use ag for search.
let g:unite_source_grep_command="ag"
let g:unite_source_grep_default_opts="-i --nocolor --nogroup"
" Fancy prompts
let g:unite_prompt = '» '
" Fuzzy search ALL THE THINGS!
call unite#filters#matcher_default#use(['matcher_fuzzy'])
" Goodbye CtrlP
nnoremap <leader>f :Unite -no-split -buffer-name=files -start-insert file_mru file_rec/async <cr>
nnoremap <leader>fv :Unite -vertical -buffer-name=files -start-insert file_mru file_rec/async <cr>
" Buffer list
nnoremap <leader>b :Unite -no-split -buffer-name=buffer -start-insert buffer<cr>
nnoremap <leader>bv :Unite -vertical -buffer-name=buffer -start-insert buffer<cr>
" Tags!
nnoremap <leader>p :Unite -no-split -buffer-name=outline -start-insert outline<cr>
" Yank history!
nnoremap <leader>y :Unite -no-split -buffer-name=yank history/yank<cr>
" Go to directory
nnoremap <leader>cd :<C-u>Unite -no-split directory_mru directory_rec:. -start-insert -buffer-name=cd -default-action=cd<CR>
" Super search
nnoremap <leader>g :Unite -buffer-name=search -start-insert grep:.<cr>
" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  setlocal nolist nopaste
  " Do the right thing on ESC
  nmap <buffer> <nowait> q <Plug>(unite_exit)
  imap <buffer> <nowait> q <Plug>(unite_exit)
  " <Tab> to go to next line
  imap <buffer> <TAB>   <Plug>(unite_select_next_line)
  " refresh the cache
  nmap <buffer> <nowait> <F5>  <Plug>(unite_redraw)
  imap <buffer> <nowait> <F5>  <Plug>(unite_redraw)
  " change directories in unite
  nmap <buffer> <nowait> <leader>cd <Plug>(unite_restart)
endfunction

" vimfiler
let g:vimfiler_as_default_explorer = 1

" Folder specific vimrc
set exrc " enable per directory vimrc files
set secure " disable unsafe commands in those files
