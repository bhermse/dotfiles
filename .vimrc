packadd minpac
call minpac#init()

set nocompatible
let mapleader = ','

set backspace=2
set noswapfile
set history=50
set ruler
set guifont=Droid_Sans_Mono:h8:cANSI
set shiftwidth=2
set softtabstop=2
set laststatus=2
set autowrite
colorscheme Tomorrow-Night         " awesome colorscheme elflord pablo
syntax enable           " enable syntax processing
syntax on
set tabstop=2       " number of visual spaces per TAB
set shiftround
set expandtab
set number              " show line numbers
set numberwidth=5
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
filetype plugin indent on      " load filetype-specific indent files
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
nnoremap <leader><space> :nohlsearch<CR> " turn off search highlight
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
nnoremap <space> za " space open/closes folds
set foldmethod=indent   " fold based on indent level
nnoremap gV `[v`] " highlight last inserted text
" toggle gundo
nnoremap <leader>u :GundoToggle<CR>
" Always use vertical diffs
set diffopt+=vertical

:set smartcase
:set ignorecase

" Persistent undo
set undodir=~/.vim/undo/
set undofile
set undolevels=1000
set undoreload=10000

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·
" Use one space, not two, after punctuation.
set nojoinspaces

" Habit keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

call minpac#add('tpope/vim-unimpaired')
"call minpac#add('tpope/vim-scriptease', {'type': 'opt'})
call minpac#add('scrooloose/nerdtree')
call minpac#add('Xuyuanp/nerdtree-git-plugin')
call minpac#add('scrooloose/nerdcommenter')
call minpac#add('vim-syntastic/syntastic')
call minpac#add('tpope/vim-surround')
call minpac#add('austintaylor/vim-indentobject')
call minpac#add('tpope/vim-dispatch')
call minpac#add('tpope/vim-rails')
call minpac#add('tpope/vim-fugitive')
call minpac#add('tmhedberg/matchit')
call minpac#add('kana/vim-textobj-user')
call minpac#add('nelstrom/vim-textobj-rubyblock')
call minpac#add('vim-scripts/JSON.vim')
call minpac#add('pangloss/vim-javascript')
"call minpac#add('chemzqm/vim-jsx-improve')
call minpac#add('mxw/vim-jsx')
call minpac#add('junegunn/fzf')
call minpac#add('mhinz/vim-grepper')
call minpac#add('BurntSushi/ripgrep')
call minpac#add('vim-airline/vim-airline')
"call minpac#add('andymass/vim-matchup')

" mappings
map <C-n> :NERDTreeToggle<CR>

" NERDTree settings
autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" " Toggle nerdtree with F10
map <F10> :NERDTreeToggle<CR>
" Current file in nerdtree
map <F9> :NERDTreeFind<CR>

" fuzzy find
nnoremap <C-p> :<C-u>FZF<CR>
" grep
:set grepprg=rg\ -H\ --no-heading\ --vimgrep
:set grepformat=$f:$l:%c:%m
nnoremap <Leader>g :Grepper -tool rg<CR>

" javascript
let g:javascript_plugin_jsdoc = 1

augroup configgroup
  autocmd!
  autocmd VimEnter * highlight clear SignColumn
  autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md
        \:call <SID>StripTrailingWhitespaces()
  autocmd FileType java setlocal noexpandtab
  autocmd FileType java setlocal list
  autocmd FileType java setlocal listchars=tab:+\ ,eol:-
  autocmd FileType java setlocal formatprg=par\ -w80\ -T4
  autocmd FileType php setlocal expandtab
  autocmd FileType php setlocal list
  autocmd FileType php setlocal listchars=tab:+\ ,eol:-
  autocmd FileType php setlocal formatprg=par\ -w80\ -T4
  autocmd FileType ruby setlocal tabstop=2
  autocmd FileType ruby setlocal shiftwidth=2
  autocmd FileType ruby setlocal softtabstop=2
  autocmd FileType ruby setlocal commentstring=#\ %s
  autocmd FileType python setlocal commentstring=#\ %s
  autocmd BufEnter *.cls setlocal filetype=java
  autocmd BufEnter *.zsh-theme setlocal filetype=zsh
  autocmd BufEnter Makefile setlocal noexpandtab
  autocmd BufEnter *.sh setlocal tabstop=2
  autocmd BufEnter *.sh setlocal shiftwidth=2
  autocmd BufEnter *.sh setlocal softtabstop=2
  autocmd Filetype html setlocal ts=2 sts=2 sw=2
  autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
augroup END


augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  "   " Don't do it for commit messages, when the position is invalid, or
  "   when
  "     " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
        \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile .{jscs,jshint,eslint}rc set
  "filetype=json
augroup END

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'
syntax on
