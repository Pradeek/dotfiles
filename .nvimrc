" Super standard stuff
set nocompatible " Forget vi.
filetype off

" Shut up!
set visualbell

" Set up NeoBundle
let g:neocomplete#enable_at_startup = 1
set runtimepath+=~/.nvim/bundle/neobundle.vim/
call neobundle#rc(expand('~/.nvim/bundle/'))

" let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'tools\\update-dll-mingw',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

" Python / Clipboard setup
if has('neovim')
    let s:python_host_init = 'python -c "import neovim; neovim.start_host()"'
    let &initpython = s:python_host_init
    let &initclipboard = s:python_host_init
    set unnamedclip " Automatically use clipboard as storage for the unnamed register
endif

" Plugins
" Tmux integration
NeoBundle 'benmills/vimux'
" Autocomplete
NeoBundle 'tarruda/YouCompleteMe'
" Syntax check / lint
NeoBundle 'scrooloose/syntastic'
" Snippets
NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'
" Make FocusLost work in vim -> tmux -> iTerm2
NeoBundle 'sjl/vitality.vim'
" Move between Vim and tmux splits seamlessly
NeoBundle 'christoomey/vim-tmux-navigator'
" Run commands in Tmux panes and bring them back to Vim
NeoBundle 'tpope/vim-dispatch'
" Status bar
NeoBundle 'bling/vim-airline'
" Bindings for ack (using ag in the back)
NeoBundle 'mileszs/ack.vim'
" Add comments faster
NeoBundle 'tpope/vim-commentary'
" File navigation
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'tacahiroy/ctrlp-funky'
" Adds closing tags automatically
NeoBundle 'Raimondi/delimitMate'
" Allows selection of multiple occurances of a patterns for faster changes
NeoBundle 'joedicastro/vim-multiple-cursors'
" Better syntax
NeoBundle 'plasticboy/vim-markdown'
NeoBundleLazy 'pangloss/vim-javascript', {'autoload':{'filetypes':['javascript']}}
" Refactoring
NeoBundleLazy 'python-rope/ropevim', {'autoload': {'filetypes': ['python']}}

" Buffer movement
" Look for stuff here (affects the gf command)
set path=.,**
nnoremap <silent> <Tab> :bn<CR>
nnoremap <silent> <S-Tab> :bp<CR>

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
set number
" Basic editing stuff
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
set shortmess=atI   " Don't show the Vim intro message
set autoread " Auto reload files changed outside
" Folder specific vimrc
set exrc " enable per directory vimrc files
set secure " disable unsafe commands in those files

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
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

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

" Navigation across splits
nnoremap <C-w><C-h> <C-h>
nnoremap <C-w><C-j> <C-j>
nnoremap <C-w><C-k> <C-k>
nnoremap <C-w><C-l> <C-l>

" Copy/Paste settings
set clipboard=unnamed " Use the OS clipboard by default
set pastetoggle=<leader>pp
nnoremap Y bv$hd

" Use , instead of \ for leader
let mapleader=","

" Annoyances
command! -bang -range=% -complete=file -nargs=* W <line1>,<line2>write<bang> <args>
command! -bang Q quit<bang>
nnoremap <leader>c :bp\|bd #<CR>

" Make dir if it doesn't exist
augroup vimrc-auto-mkdir  " {{{
  autocmd!
  autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'))
  function! s:auto_mkdir(dir)  " {{{
    if !isdirectory(a:dir)
      call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
  endfunction  " }}}
augroup END  " }}}

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
" Treat ejs files as html
autocmd BufNewFile,BufRead *.ejs set filetype=html
autocmd BufNewFile,BufRead *.hbs set filetype=html
" JSON formatting
autocmd FileType json nnoremap <leader>js :%!python -m json.tool<CR>
" Trim trialing whitespace always
autocmd BufWrite * :call TrimTrailingWhitespace()
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

" indent and keep selection so that I can do it again
vnoremap < <gv
vnoremap > >gv

" Map <leader>o to go to the previous line (since O is too hard to type)
inoremap <leader>o <ESC>O
nnoremap <leader>o <ESC>O

" Emacs key-binding in vim!
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
inoremap <leader>d <ESC> :bd <CR>
nnoremap <leader>d <ESC> :bd <CR>
vnoremap <leader>d <ESC> :bd <CR>

" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" markdown helpers
nnoremap <leader>h1 yyp^v$r=
nnoremap <leader>h2 yyp^v$r-

" Plugin mappings
" ================

" Vimux
nnoremap <leader>r :VimuxPromptCommand <CR>
nnoremap <leader>r. :VimuxRunLastCommand <CR>

" Set shortcut for NERDTree
nnoremap <leader>nt :NERDTreeToggle <CR>
vnoremap <leader>nt :NERDTreeToggle <CR>

" Load local matchit.vim if not loaded
" Enables % to match open/close parens, blocks, etc
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
    runtime! macros/matchit.vim
endif

" Tell ack.vim to use ag instead.
let g:ackprg = 'ag --nogroup --nocolor --column'
nnoremap <leader>g <ESC>:Ack
noremap <C-g> :Ack <cword><cr>

" Handy mappings for parens
inoremap r5 %
inoremap y7 &
inoremap u8 *
inoremap i9 (
inoremap o0 )

" CtrlP
let g:ctrlp_map = '<leader>f'
nnoremap E :CtrlP %:h<CR>
nnoremap VE :vsp <CR> :CtrlP %:h<CR>
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>m :CtrlPMRU<CR>
set wildignore+=*.pyc,*.orig,*.rej,*.git/*,*.hg/*
let g:ctrlp_switch_buffer = 0 " Always open new buffers
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v((node_modules|public\/bower_components|tmp|vendor|dist|.git))|[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(git|exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
" let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

" CtrlP funcky
let g:ctrlp_extensions = ['funky']
nnoremap <Leader>p :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
" useful : TODO: Use later in other places
" nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

" YCM
autocmd FileType python nnoremap <CR> :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_min_num_of_chars_for_completion = 0
" let g:ycm_filetype_whitelist = { 'python': 1, 'javascript': 1, 'ruby': 1 }
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_use_ultisnips_completer = 1

" Make YCM and Ultisnips work together
function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips#JumpForwards()
            if g:ulti_jump_forwards_res == 0
               return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction
au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-e>"
" this mapping Enter key to <C-y> to chose the current highlight item
" and close the selection list, same as other IDEs.
" CONFLICT with some plugins like tpope/Endwise
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Rope
" C-c r r	RopeRename
" C-c r l	RopeExtractVariable
" C-c r m	RopeExtractMethod

" Syntastic
" Don't bother checking when I close Vim
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_enable_balloons = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_loc_list_height = 5
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_ignore_files = ['\m^/tmp/', '\.html$']
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': ['ruby', 'python'],
                           \ 'passive_filetypes': ['handlebars', 'hbs', 'html', 'javascript'] }

autocmd Filetype javascript setlocal ts=2 sts=2 sw=2 foldlevel=2
autocmd Filetype hbs setlocal ts=2 sts=2 sw=2
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype css setlocal ts=2 sts=2 sw=2
autocmd Filetype scss setlocal ts=2 sts=2 sw=2

set omnifunc=csscomplete#CompleteCSS
