"                                   
"                    ██▒   █▓ ██▓ ███▄ ▄███▓ ██▀███   ▄████▄  
"                   ▓██░   █▒▓██▒▓██▒▀█▀ ██▒▓██ ▒ ██▒▒██▀ ▀█  
"                    ▓██  █▒░▒██▒▓██    ▓██░▓██ ░▄█ ▒▒▓█    ▄ 
"                     ▒██ █░░░██░▒██    ▒██ ▒██▀▀█▄  ▒▓▓▄ ▄██▒
"                      ▒▀█░  ░██░▒██▒   ░██▒░██▓ ▒██▒▒ ▓███▀ ░
"                      ░ ▐░  ░▓  ░ ▒░   ░  ░░ ▒▓ ░▒▓░░ ░▒ ▒  ░
"                      ░ ░░   ▒ ░░  ░      ░  ░▒ ░ ▒░  ░  ▒   
"                        ░░   ▒ ░░      ░     ░░   ░ ░        
"                         ░   ░         ░      ░     ░ ░      
"                        ░                           ░        
"
"                        Author: https://github.com/mohabaks
"
" Vundle Settings {{{  

"" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"" let Vundle manage Vundle, required
"" Random Plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-markdown'
Plugin 'cespare/vim-toml'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'scrooloose/syntastic'
Plugin 'airblade/vim-gitgutter'
Plugin 'easymotion/vim-easymotion'
Plugin 'mattn/emmet-vim'
Plugin 'nvie/vim-flake8'
Plugin 'PotatoesMaster/i3-vim-syntax'
Plugin 'SirVer/ultisnips'
Plugin 'sukima/xmledit'
Plugin 'python-mode/python-mode'
Plugin 'Raimondi/delimitMate'
Plugin 'digitaltoad/vim-pug'
Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-misc'
Plugin 'tmux-plugins/vim-tmux'
Plugin 'Valloric/YouCompleteMe'
Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'moll/vim-node'
Plugin 'lervag/vimtex'
Plugin 'iamcco/markdown-preview.vim'
Plugin 'lilydjwg/colorizer'

""" Colorscheme
Plugin 'altercation/vim-colors-solarized'
Plugin 'morhetz/gruvbox'

call vundle#end()       
filetype plugin indent on  

"}}}  
"  Set Colorscheme {{{
set background=dark
colorscheme htb
"}}} 
" General Settings {{{ 
syntax on
filetype on
set encoding=utf-8
set tw=79
set nowrap
set smartindent
set colorcolumn=80
set visualbell
set noerrorbells
set autowrite
set mouse+=a
set cursorline
set lazyredraw
set showmatch
set autoindent
set expandtab
set splitbelow
set splitright
set backspace=indent,eol,start
"}}}  
" Tabs Settings {{{

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" Go to last active tab
au TabLeave * let g:lasttab = tabpagenr()
nnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>
vnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>
"}}}
" Split Layouts {{{
""specify different areas of the screen
set splitbelow
set splitright
""split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"}}}
" Searching {{{ 
set incsearch             " search as characters are entered
set hlsearch              " highight matches

"" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR> 
"}}} 
" Code Block Settings {{{
"Code Folding 
set foldmethod=indent
set foldlevelstart=10     " open most folds by default
set foldlevel=99
set foldnestmax=10        " 10 nested fold max

"" space open/closes folds
nnoremap <space> za
set foldmethod=indent     " fold based on indent level

""  Moving Code Blocks
"" easier moving of code blocks
"" Try to go into visual mode (v), thenselect several lines of code here and
"" then press ``>`` several times.
vnoremap < <gv              " better indentation
vnoremap > >gv              " better indentation
"" Commenting blocks of code
autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
autocmd FileType sh,ruby,python   let b:comment_leader = '# '
autocmd FileType conf,fstab       let b:comment_leader = '# '
autocmd FileType tex              let b:comment_leader = '% '
autocmd FileType mail             let b:comment_leader = '> '
autocmd FileType vim              let b:comment_leader = '" '
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>
"}}}
" Vim Shortcut {{{
"" Leader
let mapleader=","

"" jk is escape
inoremap jk <esc>

"" Quicksave command
noremap  <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>
"}}}
" CtrlP settings {{{ 
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
"}}}
" File Browsing {{{ 
"" Open NERDTree when no files are specified
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\~$']

"" hide .pyc files
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
"}}}
" Buffer Navigation {{{ 
"" Ctrl Left/h & Right/l cycle between buffers
noremap <silent> <C-left> :bprev<CR>
noremap <silent> <C-h> :bprev<CR>
noremap <silent> <C-right> :bnext<CR>
noremap <silent> <C-l> :bnext<CR>

"" <Leader>q Closes the current buffer
nnoremap <silent> <Leader>q :Bclose<CR>

"" <Leader>Q Closes the current window
nnoremap <silent> <Leader>Q <C-w>c
"}}}
" Backups Settings {{{
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
"}}} 
" Git Integration {{{


"}}}
" Lively Previewing LaTeX PDF Output {{{
let g:livepreview_previewer = 'zathura'
"}}}
" Match Valid Ip A ddress {{{
syn match ipaddr /\(\(25\_[0-5]\|2\_[0-4]\_[0-9]\|\_[01]\?\_[0-9]\_[0-9]\?\)\.\)\{3\}\(25\_[0-5]\|2\_[0-4]\_[0-9]\|\_[01]\?\_[0-9]\_[0-9]\?\)/
hi link ipaddr Identifier
"}}}
" Easytags Settings {{{
let g:easytags_suppress_ctags_warning = 1
"}}}
" Vim IDE Settings {{{
"" PEP8 Settings
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

au BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |

"" enable all Python syntax highlighting feautures
let python_highlight_all = 1

"" Python-mode
"Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'
"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes, pep8"
let g:pymode_lint_write = 1
"Support virtualenv
let g:pymode_virtualenv = 1
"syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
"Don't autofold code
let g:pymode_folding = 0
let g:pymode_rope_lookup_project = 0

"" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_collect_identifiers_from_tags_files = 1       " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1                   " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1              " Completion for programming language's keyword
let g:ycm_complete_in_comments = 0                      " Completion in comments
let g:ycm_complete_in_strings = 0                       " Completion in string
let g:ycm_global_ycm_extra_conf = '~/vim/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_python_binary_path = '/usr/bin/python2.7'
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

"" Ultisnips.vim
let g:UltiSnipsExpandTrigger       = "<c-j>"
let g:UltiSnipsJumpForwardTrigger  = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-p>"
let g:UltiSnipsListSnippets        = "<c-k>"

"" Java IDE Settings
let g:EclimCompletionMethod = 'omnifunc'
"}}}
" Organization {{{
set modelines=1
"}}}
" vim:foldmethod=marker:foldlevel=0
