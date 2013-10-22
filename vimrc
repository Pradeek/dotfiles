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
" Split management
Bundle 'roman/golden-ratio'
Bundle 'vim-scripts/bufkill.vim'
" Undo management
Bundle 'sjl/gundo.vim'
" VCS
Bundle 'Lawrencium'
Bundle 'tpope/vim-fugitive'
" Terminal/iTerm integration (Macvim)
Bundle 'gcmt/tube.vim'
" Tmux integration
Bundle 'benmills/vimux'
" Make FocusLost work in vim -> tmux -> iTerm2
Bundle 'sjl/vitality.vim'
" Move between Vim and tmux splits seamlessly
Bundle 'christoomey/vim-tmux-navigator'
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
Bundle 'junegunn/seoul256.vim'
" Status bar
Bundle 'bling/vim-airline'
" Bindings for ack (using ag in the back)
Bundle 'mileszs/ack.vim'
" Syntax checker
Bundle 'scrooloose/syntastic'
" File explorer
Bundle 'scrooloose/nerdtree'
" Zencoding for HTML
Bundle 'mattn/emmet-vim'
" Tagbar / Autocomplete / Go to symbol
Bundle 'majutsushi/tagbar'
" Bundle 'Valloric/YouCompleteMe'
Bundle 'Shougo/neocomplete.vim'
Bundle 'travisjeffery/vim-gotosymbol'
" Go to character
Bundle 'svermeulen/vim-extended-ft'
Bundle 'justinmk/vim-sneak'
" Change surrounding text
Bundle 'tpope/vim-surround'
" Snippets
Bundle 'SirVer/ultisnips'
Bundle 'Shougo/neosnippet.vim'
Bundle 'honza/vim-snippets'
" Adds closing tags automatically
Bundle 'Raimondi/delimitMate'
" Allows selection of multiple occurances of a patterns for faster changes
Bundle 'terryma/vim-multiple-cursors'
" Javascript intelligence
Bundle 'marijnh/tern_for_vim'
" Python tools
Bundle 'davidhalter/jedi-vim'
" Python linters
Bundle 'nvie/vim-flake8'
" Better syntax
Bundle 'plasticboy/vim-markdown'
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

" Timeout settings
set ttimeout
set ttimeoutlen=100
set notimeout

" Testing some tweaks to make Vim faster
let loaded_matchparen=1 " Don't load matchit.vim (paren/bracket matching)
set noshowmatch         " Don't match parentheses/brackets
set nocursorline        " Don't paint cursor line
set nocursorcolumn      " Don't paint cursor column
set lazyredraw          " Wait to redraw
set scrolljump=8        " Scroll 8 lines at a time at bottom/top
let html_no_rendering=1 " Don't render italic, bold, links in HTML

" Testing some tweaks to fix wierd rendering issue of arrow keys
nnoremap <Esc>A <up>
nnoremap <Esc>B <down>
nnoremap <Esc>C <right>
nnoremap <Esc>D <left>
inoremap <Esc>A <up>
inoremap <Esc>B <down>
inoremap <Esc>C <right>
inoremap <Esc>D <left>

" File ignores
" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
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
noremap scls :set nohlsearch<CR>
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
" Set leader to , instead of \
command! -bang -range=% -complete=file -nargs=* W <line1>,<line2>write<bang> <args>
command! -bang Q quit<bang>
nnoremap <leader>c :bp\|bd #<CR>

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

" Easier shortcuts for cursor nav
nnoremap ww 10k
nnoremap ss 10j

" Shortcuts for easier editing
inoremap <leader>u <ESC>u
inoremap <leader>w <ESC>ciw

" Better shortcuts for incrementing/decrementing numbers
nnoremap + <C-a>
nnoremap - <C-x>

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
nnoremap <Leader>a= :Tabularize /=<CR>
vnoremap <Leader>a= :Tabularize /=<CR>
nnoremap <Leader>a: :Tabularize /:\zs<CR>
vnoremap <Leader>a: :Tabularize /:\zs<CR>

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

" YouCompleteMe completion preview
let g:ycm_add_preview_to_completeopt = 0

" Go To definition
nnoremap <C-d> :YcmCompleter GoToDefinitionElseDeclaration<CR>
" nnoremap <C-d>c :YcmCompleter GoToDeclaration<CR>
" nnoremap <C-d>f :YcmCompleter GoToDefinition<CR>

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
setlocal wrap
command! PyLint call Flake8()
cmap pylint PyLint
noremap <leader>br :call InsertLine()<CR>
function! InsertLine()
    let trace = expand("import ipdb; ipdb.set_trace()")
    execute "normal o".trace
endfunction
endfunction
" Ignore some these PEP8 errors
let g:flake8_ignore="E221,E222,E302"
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_checker_args='--ignore=E221,E222,E302'
let g:syntastic_python_flake8_post_args='--ignore=E221,E222,E302'
" E221 - multiple spaces before operator
" E222 - multiple spaces after operator
" E302  expected 2 blank lines, found 0

" DWM.vim
nnoremap <silent> <C-w> :call DWM_New()<CR>
nnoremap <silent> <leader>q :exec DWM_Close()<CR>
" The two commands below screw up arrow keys in normal mode
" nnoremap <silent> <C-]> :call DWM_GrowMaster()<CR>
" nnoremap <silent> <C-[> :call DWM_ShrinkMaster()<CR>
" nnoremap <silent> <Tab> :call DWM_Rotate(0)<CR>
" nnoremap <silent> <S-Tab> :call DWM_Rotate(1)<CR>
nnoremap <leader>w :wincmd w<CR>
nnoremap <leader>W :wincmd W<CR>
let g:dwm_master_pane_width=120

" Unite.vim
" Always go to insert mode
let g:unite_enable_start_insert = 1
" Yank history
let g:unite_source_history_yank_enable = 1
" Cache max of 500 files
let g:unite_source_rec_max_cache_files=500
" Use ag for search.
let g:unite_source_grep_command="ag"
let g:unite_source_grep_default_opts="-i --nocolor --nogroup"
" Fancy prompts
let g:unite_prompt = '» '
" Fuzzy search ALL THE THINGS!
call unite#filters#matcher_default#use(['matcher_fuzzy'])
" Goodbye CtrlP
nnoremap <leader>f :Unite -no-split -buffer-name=files -start-insert -auto-resize buffer file_mru file file_rec/async<cr>
nnoremap <leader>vf :Unite -vertical -buffer-name=files -start-insert -auto-preview file_mru file_rec/async<cr>
" Buffer list
nnoremap <leader>b :Unite -no-split -buffer-name=buffer -start-insert buffer<cr>
nnoremap <leader>vb :Unite -vertical -buffer-name=buffer -start-insert buffer<cr>
" Tags!
nnoremap <leader>p :Unite -no-split -buffer-name=outline -start-insert outline<cr>
" Yank history!
nnoremap <leader>y :Unite -no-split -buffer-name=yank history/yank<cr>
" Go to directory
nnoremap <leader>cd :<C-u>Unite -no-split directory_mru directory_rec:. -start-insert -buffer-name=cd -default-action=cd<CR>
nnoremap E :UniteWithBufferDir -buffer-name=files buffer file<CR>
" Super search
nnoremap <leader>g :Unite -buffer-name=search -start-insert -auto-preview grep:.<cr>
nnoremap <leader>l :Unite -buffer-name=search_line line -start-insert<CR>
nnoremap <leader>j :Unite -buffer-name=jump jump -start-insert<CR>
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
" Window config
let g:unite_winheight = 10
let g:unite_split_rule = 'topleft'

" vimfiler
let g:vimfiler_as_default_explorer = 1

" jedi-vim config
autocmd FileType python setlocal omnifunc=jedi#completions
let g:jedi#auto_vim_configuration = 0
"let g:neocomplete#force_omni_input_patterns.python = '[^. \t]\.\w*'
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#use_splits_not_buffers = "left"
let g:jedi#goto_definitions_command = "<C-d>"
let g:jedi#documentation_command = "K"
let g:jedi#rename_command = "<leader>re"
let g:jedi#show_call_signatures = "1"
let g:jedi#popup_select_first = 0
let g:jedi#popup_on_dot = 0

" Trying out neocomplete. 
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
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
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

