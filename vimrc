" Super standard stuff
set nocompatible " Forget vi.
filetype off

" Shut up!
set visualbell

" Set up Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" Plugins
" Keep my god-damn splits
Bundle 'vim-scripts/bufkill.vim'
" Undo management
Bundle 'sjl/gundo.vim'
" VCS
Bundle 'tpope/vim-fugitive'
" Tmux integration
Bundle 'benmills/vimux'
" Make FocusLost work in vim -> tmux -> iTerm2
Bundle 'sjl/vitality.vim'
" Documentation
Bundle 'Keithbsmiley/investigate.vim'
" Move between Vim and tmux splits seamlessly
Bundle 'christoomey/vim-tmux-navigator'
" Add comments faster
Bundle 'tpope/vim-commentary'
" Bunch of color schemes
Bundle 'Colour-Sampler-Pack'
Bundle 'junegunn/seoul256.vim'
Bundle 'zenorocha/dracula-theme'
" Status bar
Bundle 'bling/vim-airline'
" Bindings for ack (using ag in the back)
Bundle 'mileszs/ack.vim'
" Syntax checker
Bundle 'scrooloose/syntastic'
" Shortcuts
Bundle '29decibel/vim-stringify'
" File explorer
Bundle 'kien/ctrlp.vim'
Bundle 'tacahiroy/ctrlp-funky'
Bundle 'scrooloose/nerdtree'
" Zencoding for HTML
Bundle 'mattn/emmet-vim'
" Autocomplete
Bundle 'Shougo/neocomplete.vim'
" Go to character
Bundle 'svermeulen/vim-extended-ft'
Bundle 'justinmk/vim-sneak'
" Change surrounding text
Bundle 'tpope/vim-surround'
" Snippets
Bundle 'Shougo/neosnippet.vim'
" Adds closing tags automatically
Bundle 'Raimondi/delimitMate'
" FuzzyFinder
Bundle 'vim-scripts/L9'
Bundle 'vim-scripts/FuzzyFinder'
" Allows selection of multiple occurances of a patterns for faster changes
Bundle 'joedicastro/vim-multiple-cursors'
" Better syntax
Bundle 'plasticboy/vim-markdown'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'django.vim'
Bundle 'mustache/vim-mode'

" Buffer movement
" Look for stuff here
set path=.,**

" Status bar config
" Powerline setup.
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
set laststatus=2 " Always display status line in all windows
set noshowmode " Don't show the current mode at the bottom (since powerline does it)
" Vim-airline setup
let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'
let g:airline#extensions#tabline#enabled = 1

" General settings
set  t_Co=256
syntax enable
syntax on
filetype on
filetype plugin indent on
" Keep the buffer around when switching between buffers
set hidden
" Show line numbers
" set relativenumber
set number
" Basic editing stuff
" set wrap " Wrap lines
" set textwidth=80 " Cut down anything > 80 chars
set nowrap
set virtualedit=block
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
set nofoldenable " I don't remember asking you to fold a goddamn thing
" Make cursor move as expected with wrapped lines
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk
" Automatically save files when i switch buffers
set autowrite
" Enable mouse in normal mode
set mouse=n
" Show spaces and tabs - Doesn't seem to be working for existing code
" set listchars=tab:>~,nbsp:.,trail:.
" set list
set shortmess=atI   " Don't show the Vim intro message
set autoread " Auto reload files changed outside
" Folder specific vimrc
set exrc " enable per directory vimrc files
set secure " disable unsafe commands in those files

" highlight last inserted text
nnoremap gV `[v`]

" Timeout settings
set ttimeout
set ttimeoutlen=100
set notimeout

" Testing some tweaks to make Vim faster
" let loaded_matchparen=1 " Don't load matchit.vim (paren/bracket matching)
" set noshowmatch         " Don't match parentheses/brackets
" set nocursorline        " Don't paint cursor line
" set nocursorcolumn      " Don't paint cursor column
" set lazyredraw          " Wait to redraw
" set scrolljump=8        " Scroll 8 lines at a time at bottom/top
let html_no_rendering=1 " Don't render italic, bold, links in HTML

" File ignores
" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem,.hg
" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
" Ignore bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
" Ignore rails temporary asset caches
set wildignore+=*/tmp/cache/assets/*/sprockets/*,*/tmp/cache/assets/*/sass/*
" Ignore node modules
set wildignore+=node_modules/*
" Disable temp and backup files
set wildignore+=*.swp,*~,._*
" Disable merge related files
set wildignore+=*.orig,*.rej

" Don't backup files.
set nobackup
set nowritebackup
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
noremap scls /asdlasdasdallc<CR>
set incsearch " Show search matches as you type

" History
set history=1000 " More history!
set undolevels=1000 " More undo levels!

" Window settings
set title " Show title
set ruler " Display cursor position in lower right corner
set showcmd " Display the command in lower right corner
" Split window to the right
set splitright
" Make cursor to always stay in the middle of the window
set scrolloff=999

" Quickfix navigation
nnoremap <leader>cc :cc<CR>
nnoremap <leader>cn :cn<CR>
nnoremap <leader>cp :cp<CR>

" Navigation across splits
nnoremap <C-w><C-h> <C-h>
nnoremap <C-w><C-j> <C-j>
nnoremap <C-w><C-k> <C-k>
nnoremap <C-w><C-l> <C-l>

" Copy/Paste settings
set clipboard=unnamed " Use the OS clipboard by default
set pastetoggle=<leader>pp
nnoremap Y bv$hd

nnoremap <silent> <Tab> :bn<CR>
nnoremap <silent> <S-Tab> :bp<CR>

" Use , instead of \ for leader
let mapleader=","

" Annoyances
command! -bang -range=% -complete=file -nargs=* W <line1>,<line2>write<bang> <args>
command! -bang Q quit<bang>
nnoremap <leader>c :bp\|bd #<CR>

function! MkDirCurrent()
    let current_path = expand("%:h")
    call mkdir(current_path, "p")
endfunction
command! MkDirCurrent call MkDirCurrent()

" Quickfix shortcuts
nnoremap <leader>Q :cclose<CR>
nnoremap <C-n> :cnext<CR>
nnoremap <C-p> :cprev<CR>

" Trim trailing spaces
function! TrimTrailingWhitespace()
  execute "normal mz"
  %s/\s\+$//ge
  execute"normal `z"
endfunction

" Auto commands
if !exists("autocommands_loaded")
let autocommands_loaded = 1
" Automatically reload .vimrc on save
autocmd BufWritePost .vimrc source %
" Save when you lose focus (don't warn about unsaved files)
autocmd FocusLost * silent! wa
" Treat .json files as .js
autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
" JSON formatting
autocmd FileType json nnoremap <leader>js :%!python -m json.tool<CR>
" Fix html indent
autocmd FileType html setlocal indentkeys-=*<Return>
" Trim trialing whitespace always
" autocmd BufWrite * :call TrimTrailingWhitespace()
" Jump to the last position when reopening a file
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" vimrc shortcut and fold expression
nmap <silent> <leader>ev :e $MYVIMRC<CR>
autocmd FileType vim call s:vimrc_settings()
function! s:vimrc_settings()
setlocal foldenable
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

" Folding for HTML
" TODO: Make this togglable
" Vatzf = Select around tag and fold
autocmd FileType html call s:HtmlSettings()
autocmd FileType htmldjango call s:HtmlSettings()
function! s:HtmlSettings()
nnoremap <space> Vatzf
nnoremap <leader>re :silent !chrome-reload-current<CR>:redraw!<CR>
endfunction

" indent and keep selection so that I can do it again
vnoremap < <gv
vnoremap > >gv

" Map <leader>o to go to the previous line (since O is too hard to type)
inoremap <leader>o <ESC>O
nnoremap <leader>o <ESC>O

" Map ; to :
nnoremap ; :

" Map jk/kj to ESC key in insert mode
inoremap jk <ESC>
inoremap kj <ESC>
inoremap ;; <ESC>

" Map <leader>e to ESC in insert and visual mode
inoremap <leader>e <ESC>
vnoremap <leader>e <ESC>

" Emacs key-binding in vim!
inoremap <C-a> <C-o>0
inoremap <C-e> <C-o>$
nnoremap <C-e> $
nnoremap <C-a> 0

" Make vim look pretty
colorscheme desert
set background=dark

" Convinent save/delete
" Using noremap for the mappings below screws up insert mode
" Map <leader>s to save file
inoremap <leader>s <ESC> :w <CR>
nnoremap <leader>s <ESC> :w <CR>
vnoremap <leader>s <ESC> :w <CR>
" Map <leader>d to delete the buffer
inoremap <leader>d <ESC> :BD <CR>
nnoremap <leader>d <ESC> :BD <CR>
vnoremap <leader>d <ESC> :BD <CR>
" cnoremap bd BD

" Bubble text
" Bubble single lines
"nnoremap <C-k> ddkP
nnoremap <C-j> ddp
" Bubble multiple lines
vnoremap <C-k> xkP`[V`]
vnoremap <C-j> xp`[V`]

" Shortcuts for easier editing
inoremap <leader>u <ESC>u
inoremap <leader>w <ESC>ciw

" Better shortcuts for incrementing/decrementing numbers
nnoremap + <C-a>
nnoremap - <C-x>

" Redraw screen
nnoremap <leader>C :redraw!<CR>

" insert filename without extension
inoremap \fn <C-R>=expand("%:t:r")<CR>

" Command mappings
cnoremap %% <C-R>=expand('%:h').'/'<cr>

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

" Plugin mappings
" ================

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

" Disable syntastic plugin for html files since it complains about templates
" in script tags
let g:syntastic_enable_highlighting = 0
let g:syntastic_quiet_warnings=1
let g:syntastic_mode_map={ 'mode': 'active',
        \ 'active_filetypes': [],
        \ 'passive_filetypes': ['html'] }

" CtrlP
let g:ctrlp_map = '<leader>f'
nnoremap E :CtrlP %:h<CR>
nnoremap <leader>bb :CtrlPMRU<CR>
set wildignore+=*.pyc,*.orig,*.rej,*.git/*,*.hg/*
let g:ctrlp_switch_buffer = 0 " Always open new buffers
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v((node_modules|tmp|vendor|dist)|[\/]\.(git|hg|svn))$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

" CtrlP funcky 
let g:ctrlp_extensions = ['funky']
nnoremap <Leader>p :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
" useful : TODO: Use later in other places
" nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

" Load local matchit.vim if not loaded
" Enables % to match open/close parens, blocks, etc
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
    runtime! macros/matchit.vim
endif

" Tell ack.vim to use ag instead.
let g:ackprg = 'ag --nogroup --nocolor --column'
nnoremap <leader>g <ESC>:Ack
noremap <C-g> :Ack <cword><cr>

" Trying out neocomplete.
" Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#auto_completion_start_length = 1
let g:neocomplete#sources#buffer#cache_limit_size = 50000
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 1
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }
" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.javascript = '[^. \t]\.\w*'
" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()
" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"
" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
" let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1
" AutoComplPop like behavior.
let g:neocomplete#enable_auto_select = 1
" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" Neosnippet config
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"
" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.vim/vim-snippets/snippets'

" vim-mustache
let g:mustache_abbreviations = 1

" Execute shell command and put result in split buffer
" Stolen from https://opensource.conformal.com/wiki/vim
function! s:ExecuteInShell(command, bang)
    let _ = a:bang != '' ? s:_ : a:command == '' ? '' : join(map(split(a:command), 'expand(v:val)'))

    if (_ != '')
        let s:_ = _
        let bufnr = bufnr('%')
        let winnr = bufwinnr('^' . _ . '$')
        silent! execute  winnr < 0 ? 'new ' . fnameescape(_) : winnr . 'wincmd w'
        setlocal buftype=nowrite bufhidden=wipe nobuflisted noswapfile nowrap
        silent! :%d
        let message = 'Execute ' . _ . '...'
        call append(0, message)
        echo message
        silent! 2d | resize 1 | redraw
        silent! execute 'silent! %!'. _
        silent! execute 'resize ' . line('$')
        silent! execute 'autocmd BufUnload <buffer> execute bufwinnr(' . bufnr . ') . ''wincmd w'''
        silent! execute 'autocmd BufEnter <buffer> execute ''resize '' .  line(''$'')'
        silent! execute 'nnoremap <silent> <buffer> <LocalLeader>r :call <SID>ExecuteInShell(''' . _ . ''', '''')<CR>'
        silent! execute 'nnoremap <silent> <buffer> <LocalLeader>g :execute bufwinnr(' . bufnr . ') . ''wincmd w''<CR>'
    endif
endfunction

command! -complete=shellcmd -nargs=* -bang Shell call s:ExecuteInShell(<q-args>, '<bang>')
cabbrev shell Shell

" Investigate.vim - documentation
nnoremap K :call investigate#Investigate()<cr>

function! GetVisualSelection()
  " Why is this not a built-in Vim script function?!
  let [lnum1, col1] = getpos("'<")[1:2]
  let [lnum2, col2] = getpos("'>")[1:2]
  let lines = getline(lnum1, lnum2)
  let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ? 1 : 2)]
  let lines[0] = lines[0][col1 - 1:]
  return join(lines, "\n")
endfunction

function! ExtractVariable()
    let name = inputdialog("Variable Name : ")
    if name != ""
        execute "normal O" . name . " = "
        normal p
        execute (line('.')+1) . ",$s/" . escape(getreg('"'), '/\') . "/" . name . "/" 
    endif
endfunction
vnoremap <c-e> y:call ExtractVariable()<cr>
