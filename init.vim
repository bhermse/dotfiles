packadd minpac
call minpac#init()

set nocompatible
let mapleader = ','

set t_Co=256
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

set encoding=utf-8
set backspace=2
set noswapfile
set history=1000
set ruler
set guifont=Droid_Sans_Mono:h8:cANSI
set shiftwidth=2
set softtabstop=2
set tabstop=2       " number of visual spaces per TAB
set laststatus=2
set textwidth=120 " make it obvious where text width is
set colorcolumn=+1
" Open new split panes to right and bottom
set splitbelow
set splitright
set autowrite
:set switchbuf+=usetab,newtab
colorscheme Tomorrow-Night         " awesome colorscheme elflord pablo
"colorscheme atom-dark-256         " awesome colorscheme elflord pablo
"colorscheme deus
"colorscheme jellybeans
"colorscheme PaperColor
"colorscheme nord
"colorscheme one
"let g:airline_theme='base16'
"colorscheme one
"let g:airline_theme='one'
syntax enable           " enable syntax processing
syntax on
set shiftround
set expandtab
set number              " show line numbers
set numberwidth=4
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
set scrolloff=4
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
set backupdir=~/.tmp
set directory=~/.tmp " Don't clutter my dirs up with swp and tmp files
" toggle gundo
nnoremap <leader>u :GundoToggle<CR>
" Always use vertical diffs
set diffopt+=vertical
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

" move up and down on visual lines (if a line wraps)
noremap k gk
noremap j gj

nmap 0 ^

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

call minpac#add('k-takata/minpac', {'type': 'opt'})
call minpac#add('tpope/vim-unimpaired')
"call minpac#add('tpope/vim-scriptease', {'type': 'opt'})
call minpac#add('scrooloose/nerdtree')
call minpac#add('Xuyuanp/nerdtree-git-plugin')
call minpac#add('scrooloose/nerdcommenter')
call minpac#add('vim-syntastic/syntastic')
call minpac#add('tpope/vim-surround')
call minpac#add('austintaylor/vim-indentobject')
call minpac#add('tpope/vim-dispatch')
call minpac#add('christoomey/vim-tmux-navigator')
"call minpac#add('tpope/vim-rails')
call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-repeat')
"call minpac#add('tpope/vim-markdown')
call minpac#add('plasticboy/vim-markdown')
call minpac#add('vim-pandoc/vim-pandoc-syntax')
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
call minpac#add('sheerun/vim-polyglot')
call minpac#add('leafgarland/typescript-vim')
call minpac#add('w0rp/ale')
call minpac#add('peitalin/vim-jsx-typescript')
"call minpac#add('vim-airline/vim-airline')
"call minpac#add('vim-airline/vim-airline-themes')
"call minpac#add('rakr/vim-one')
"call minpac#add('StanAngeloff/php.vim')
"call minpac#add('andymass/vim-matchup')

let g:vim_markdown_conceal = 0
" mappings
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" NERDTree settings
" auto-open nerdtree?
"autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" " Toggle nerdtree with F10
map <F10> :NERDTreeToggle<CR>
" Current file in nerdtree
map <F9> :NERDTreeFind<CR>

" fuzzy find
nnoremap <C-p> :<C-u>FZF<CR>
" Tell FZF to use RG - so we can skip .gitignore files even if not using
" :GitFiles search
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'
" grep
:set grepprg=rg\ -H\ --no-heading\ --vimgrep
:set grepformat=$f:$l:%c:%m
nnoremap <Leader>g :Grepper -tool rg<CR>

" javascript
let g:javascript_plugin_jsdoc = 1

augroup configgroup
  autocmd!
  autocmd VimEnter * highlight clear SignColumn
  "autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md
        "\:call <SID>StripTrailingWhitespaces()
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

  augroup pandoc_syntax
    au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
  augroup END
  "filetype=json
augroup END

" Autocompletion {{{
let g:coc_global_extensions = [
      \ 'coc-css',
      \ 'coc-rls',
      \ 'coc-html',
      \ 'coc-json',
      \ 'coc-python',
      \ 'coc-yaml',
      \ 'coc-emoji',
      \ 'coc-tsserver',
      \ 'coc-ultisnips',
      \ 'coc-phpls',
      \ 'coc-solargraph',
      \ 'coc-emmet',
      \ 'coc-prettier',
      \ ]

function! s:coc_cb(hooktype, name) abort
  execute 'packadd ' . a:name
  call coc#util#build()
  call coc#util#install_extension(g:coc_global_extensions)
endfunction

call minpac#add('Shougo/neco-vim')
call minpac#add('neoclide/coc-neco')
call minpac#add('neoclide/coc.nvim', {'do': function('s:coc_cb')})

" coc keybindings and such
" if hidden is not set, TextEdit might fail.
set hidden
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup
" Better display for messages
set cmdheight=2
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)
xmap <leader>f  <Plug>(coc-format)
nmap <leader>f  <Plug>(coc-format)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
"nmap <silent> <C-d> <Plug>(coc-range-select)
"xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" }}}

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'
syntax on

" easy split screens
" https://thoughtbot.com/blog/vim-splits-move-faster-and-more-naturally
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Split edit your vimrc. Type space, v, r in sequence to trigger
nmap <leader>vr :sp $MYVIMRC<cr>
" Source (reload) your vimrc. Type space, s, o in sequence to trigger
nmap <leader>so :source $MYVIMRC<cr>

" Leader shortcuts
" open my notes in a new tab
map <Leader>nt :tabedit ~/Nextcloud/Notes<cr>
" Edit another file in the same directory as the current file
" uses expression to extract path from current file's path
map <Leader>e :e <C-R>=escape(expand("%:p:h"),' ') . '/'<CR>
map <Leader>s :split <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>
map <Leader>v :vnew <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>
" Merge a tab into a split in the previous window
function! MergeTabs()
  if tabpagenr() == 1
    return
  endif
  let bufferName = bufname("%")
  if tabpagenr("$") == tabpagenr()
    close!
  else
    close!
    tabprev
  endif
  split
  execute "buffer " . bufferName
endfunction

nmap <C-W>u :call MergeTabs()<CR>

" Enable fzf
source /usr/share/doc/fzf/examples/fzf.vim
