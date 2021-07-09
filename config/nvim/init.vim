" ==========================================
"            _
"     __   _(_)_ __ ___  _ __ ___
"     \ \ / / | '_ ` _ \| '__/ __|
"  _   \ V /| | | | | | | | | (__
" (_)   \_/ |_|_| |_| |_|_|  \___|
"
" ==========================================

let mapleader = "\<space>"
let maplocalleader = "\<space>"

" Plugins ------------------------------------------------------------
" ----- Vim Plugged ----- "
call plug#begin('~/.local/share/nvim/site/plugged')
Plug 'morhetz/gruvbox'
Plug 'srcery-colors/srcery-vim'
Plug 'vim-airline/vim-airline'
Plug 'ap/vim-css-color'
Plug 'scrooloose/nerdtree'
Plug 'easymotion/vim-easymotion'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'Yggdroot/indentLine'
Plug 'machakann/vim-highlightedyank'
Plug 'mechatroner/rainbow_csv'
Plug 'kien/rainbow_parentheses.vim'
Plug 'elzr/vim-json'
Plug 'nvim-lua/plenary.nvim'
Plug 'folke/todo-comments.nvim'
Plug 'blackcauldron7/surround.nvim' " Put parenthesis or commas around words
"Plug 'dense-analysis/ale' " Linter (not working yet)
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'} " Python syntax
Plug 'JuliaEditorSupport/julia-vim' " Julia support
Plug 'rust-lang/rust.vim'           " Rustlang support
Plug 'pangloss/vim-javascript'      " JavaScript support
Plug 'leafgarland/typescript-vim'   " TypeScript syntax
Plug 'maxmellon/vim-jsx-pretty'     " JS and JSX syntax
Plug 'jparise/vim-graphql'          " GraphQL syntax
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
"Plug 'sheerun/vim-polyglot'
call plug#end()

" General Settings ---------------------------------------------------
set mouse=a " Activate mouse
set number relativenumber " line numbers
set linebreak " wrap lines on 'word' boundaries
set scrolloff=3 " don't let cursor touch edge of viewport
set splitbelow splitright " vertical splits use right half of screen
set iskeyword+=- " treat dash separated words as one word object
set inccommand=nosplit " interactive find and replace preview
set breakindent " Indent wrapped lines up to the same level
set path+=** " Search down into subfolders
set clipboard=unnamed
set noerrorbells
set smartindent
set cursorline

" Figure out the system Python for Neovim.
if exists("$VIRTUAL_ENV")
    let g:python3_host_prog=substitute(system("which -a python3 | head -n2 | tail -n1"), "\n", '', 'g')
else
    let g:python3_host_prog=substitute(system("which python3"), "\n", '', 'g')
endif

"=============Search================================
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set ignorecase
set smartcase

let g:netrw_banner=0 " Disable banner in netrw
let g:airline_powerline_fonts=1

" Tab settings
set expandtab " Expand tabs into spaces
set tabstop=4 " default to 4 spaces for hard tab
set softtabstop=4 " default to 4 spaces for soft tab
set shiftwidth=4 " for when <tab> is pressed at beginning of line

" Colorscheme
set termguicolors
set background=dark

"colorscheme gruvbox
colorscheme srcery


"correct color for yank highlighting
highlight HighlightedyankRegion cterm=reverse gui=reverse

" set font for gui nvim
set guifont=MesloLGS\ NF:h12
" make gui nvim fullscreen again
call rpcnotify(0, 'Gui', 'WindowMaximized', 1)

" enable rainbow_parentheses
"let g:srcery_inverse_match_paren
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

lua << EOF
  require("todo-comments").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF

" required by surround.vim
lua require"surround".setup{}

" Columns
"set colorcolumn=80
"highlight ColorColumn ctermbg=darkgray

" General Shortcuts --------------------------------------------------
" Запуск питоновской программы по F9
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

" Shortcut to edit vimrc
nnoremap <leader>ec :vsplit $MYVIMRC<cr>
nnoremap <leader>rc :source $MYVIMRC<cr>
" Shortcut for todo-comments quickfix
nnoremap <leader>t :TodoQuickFix<cr>
" Close buffer
nnoremap <leader>q :bd<cr>


" Naviage with guides
nnoremap <leader><Space> <esc>/<++><cr>"_c4l

" Toggle relative number
nnoremap <leader>n :set relativenumber!<cr>

" Toggle spell-check
"nnoremap <leader>s :setlocal spell! spelllang=en_us<cr>

" Nerdtree on F3
map <F3> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '\.class$', 'pip-log\.txt$', '\.o$']

" Open terminal in new panel
"nnoremap <leader><cr> :sp<cr> :resize 10<cr> :term<cr> :set number!<cr> i

" Global Abbreviations -----------------------------------------------

" Abbreviation to insert current date
iabbrev @@d <C-r>=strftime("%Y-%m-%d")<cr>

" Normal mode mappings -----------------------------------------------
" Переход на начало/конец строки по H/L соответственно
nnoremap H ^
nnoremap L $
" выделить слово
nnoremap <leader>v viw
" скопировать/вставить из общего буфера
nnoremap <leader>y "+y
nnoremap <leader>p "+p
" Вертикальный сплит
nnoremap <leader>\ :vsp<cr>
" Горизонтальный сплит
nnoremap <leader>- :sp<cr>
" Отменить выделение по поиску
nnoremap <leader>/ :nohlsearch<cr> :echo "Search cleared."<cr>

"nnoremap <leader>* :%s/\<<c-r><c-w>\>//g<left><LEFT>
"nnoremap <c-u> viwU

" Для surround.vim после этой комбинации нажимаем требуемый знак: {"'
" nnoremap <leader>s ysiw

" Делаем так, что при выходе/записи большие и малые w, q читались одинаково
nmap :W :w
nmap :Q :q

"nnoremap <tab> za
" save as sudoer with :Sw
"command! -nargs=0 Sw w !sudo tee % > /dev/null

" TAB autocomplete
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ?
      \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    let g:coc_snippet_next = '<tab>'

" Specify some linters (didn't done it myself, copied from some page)
"let g:ale_linters = {
      "\   'python': ['flake8', 'pylint'],
      "\   'ruby': ['standardrb', 'rubocop'],
      "\   'javascript': ['eslint'],
      "\}

" Insert mode mappings -----------------------------------------------
inoremap <c-u> <esc>viwUi

" Visual mode mappings -----------------------------------------------
vnoremap H ^
vnoremap L $
vnoremap <leader>" y`>a"<esc>`<i"<esc>
vnoremap <leader>' y`>a'<esc>`<i'<esc>
vnoremap <leader>( y`>a)<esc>`<i(<esc>
vnoremap <leader>{ y`>a}<esc>`<i{<esc>
vnoremap <leader>[ y`>a]<esc>`<i[<esc>
vnoremap <leader>< y`>a><esc>`<i<<esc>
vnoremap <leader>y "+y
vnoremap <leader>p "+p

" Terminal mode mappings ---------------------------------------------
tnoremap <esc> <c-\><c-n>
tnoremap <leader>q <c-\><c-n>:q<cr>

" Operator-pending mappings ------------------------------------------
" pair with d, c, y, etc
onoremap H ^
onoremap L $
onoremap p i(
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>
onoremap an( :<c-u>normal! f(va(<cr>
onoremap al( :<c-u>normal! F)va(<cr>
onoremap fun :<c-u>normal! 0f(hviw<cr>

" Quick window navigation --------------------------------------------
nnoremap <a-h> <c-w>h
nnoremap <a-j> <c-w>j
nnoremap <a-k> <c-w>k
nnoremap <a-l> <c-w>l
inoremap <a-h> <esc><c-w>h
inoremap <a-j> <esc><c-w>j
inoremap <a-k> <esc><c-wk
inoremap <a-l> <esc><c-w>l
vnoremap <a-h> <esc><c-w>h
vnoremap <a-j> <esc><c-w>j
vnoremap <a-k> <esc><c-w>k
vnoremap <a-l> <esc><c-w>l
tnoremap <a-h> <c-\><c-n><c-w>h
tnoremap <a-j> <c-\><c-n><c-w>j
tnoremap <a-k> <c-\><c-n><c-w>k
tnoremap <a-l> <c-\><c-n><c-w>l

" File templates --------------------------------------------
nnoremap \html :-1read ~/.local/share/nvim/skel/skel.html<cr><esc>:setfiletype html<cr>^3jf>a
nnoremap \python :-1read ~/.local/share/nvim/skel/skel.py<cr><esc>:setfiletype python<cr>^3j3f"i
nnoremap \c :-1read ~/.local/share/nvim/skel/skel.c<cr><esc>:setfiletype c<cr>
nnoremap \ch :-1read ~/.local/share/nvim/skel/skel.h<cr><esc>:setfiletype c<cr>
nnoremap \tex :-1read ~/.local/share/nvim/skel/skel.tex<cr><esc>:setfiletype tex<cr>^3jf{a
nnoremap \sh ggi#!/bin/sh<esc>:setfiletype sh<cr>a<cr><cr>
nnoremap \bash ggi#!/bin/bash<esc>:setfiletype sh<cr>a<cr><cr>

" FileType settings --------------------------------------------------
" Global file settings -----------------------------------------------
augroup global
    autocmd!
    " Disable autocomment on newline
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
    " Automatically delete all trailing whitespace on save.
    autocmd BufWritePre * %s/\s\+$//e
augroup END

" Vimscript file settings --------------------------------------------
augroup filetype_vim
    autocmd!
    autocmd FileType vim nnoremap <buffer> <localleader>c I"<esc>
    autocmd FileType vim setlocal foldmethod=marker
augroup END

"augroup myvimrc
"    autocmd!
"    autocmd BufWritePost init.vim so $MYVIMRC
"augroup END

" Ini file settings --------------------------------------------------
augroup filetype_ini
    autocmd!
    autocmd FileType dosini nnoremap <buffer> <localleader>c I;<esc>
augroup END

" Sxhkd file settings --------------------------------------------------
augroup filetype_sxhkd
    autocmd!
    autocmd FileType sxhkd nnoremap <buffer> <localleader>c I#<esc>
    autocmd FileType sxhkd setlocal foldmethod=marker
augroup END

" Shell script file settings -----------------------------------------
augroup filetype_sh
    autocmd!
    autocmd FileType sh nnoremap <buffer> <localleader>c I#<esc>
augroup END

" Python file settings -----------------------------------------------
" make self word a keyword in python
"augroup python
    "autocmd!
    "autocmd FileType python
                "\   syn keyword pythonSelf self
                "\ | highlight def link pythonSelf Special
"augroup end

augroup filetype_python
    autocmd!
    autocmd FileType python nnoremap <buffer> <localleader>c I#<esc>
    autocmd FileType python iabbrev <buffer> iff if:<left>
    " For PEP 8 standards
    autocmd FileType python set tabstop=4
    autocmd FileType python set softtabstop=4
    autocmd FileType python set shiftwidth=4
    autocmd FileType python set textwidth=79
    autocmd FileType python set expandtab
    autocmd FileType python set autoindent
    autocmd FileType python set shiftround
    autocmd FileType python set fileformat=unix
augroup END

" Haskell file settings -----------------------------------------------
augroup filetype_haskell
    autocmd!
    autocmd FileType haskell nnoremap <buffer> <localleader>c I--<esc>
    " For haskell style guide
    autocmd FileType python set textwidth=79
    autocmd FileType python set shiftwidth=4
    autocmd FileType python set tabstop=4
    autocmd FileType python set expandtab
    autocmd FileType python set softtabstop=4
    autocmd FileType python set shiftround
    autocmd FileType python set autoindent
augroup END

" Asm
let b:asmsyntax = "nasm"

" C file settings ----------------------------------------------------
augroup filetype_c
    autocmd!
    autocmd FileType c nnoremap <buffer> <localleader>c I//<esc>
    autocmd FileType c nnoremap <buffer> <localleader>z :!make<cr>
augroup END

" Html file settings -------------------------------------------------
augroup filetype_html
    autocmd!
    autocmd FileType html nnoremap <buffer> <localleader>c I<!--<space><esc>A<space>--><esc>
    autocmd FileType html nnoremap <buffer> <localleader>f Vatzf
    autocmd FileType html nnoremap <buffer> <localleader>h1 i<h1></h1><esc>F>a
    autocmd FileType html nnoremap <buffer> <localleader>li i<li></li><esc>F>a
    autocmd FileType html nnoremap <buffer> <localleader>ul i<ul></ul><esc>F>a<cr><esc>kf>a<cr>
    "autocmd FileType html
                "\ set tabstop=2
                "\ set softtabstop=2
                "\ set shiftwidth=2
augroup END

" LaTex file settings ------------------------------------------------
augroup filetype_tex
    autocmd!
    autocmd FileType tex nnoremap <localleader>bf i\textbf{}<ESC>i
    autocmd FileType tex nnoremap <c-p> :w<cr>:!pdflatex %:p<cr>
    autocmd FileType tex nnoremap <c-b> :w<cr>:!biber %:p:r<cr>
augroup END

" Markdown file settings ------------------------------------------------
augroup filetype_markdown
    autocmd!
    autocmd FileType markdown nnoremap <localleader>c :!pandoc -f markdown -t html -o <c-r>%<bs><bs><bs>.html <c-r>%<cr>
    autocmd FileType markdown nnoremap <localleader>i i**<esc>i
    autocmd FileType markdown vnoremap <localleader>i y`>a*<esc>`<i*<esc>
    autocmd FileType markdown nnoremap <localleader>b i****<esc>hi
    autocmd FileType markdown vnoremap <localleader>b y`>a**<esc>`<i**<esc>
augroup END

au! BufRead,BufNewFile *.json set filetype=json

" Notes --------------------------------------------------------------
" ^n for autocomple selections
" ^x^n autocomplete just this file
" ^x^f autocomplete filenames
" ^x^] autocomplete tags
" ^P scroll back in list

" :read to input file contents into file
" :-1read no extra line
