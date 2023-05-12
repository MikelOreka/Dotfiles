call plug#begin()
Plug 'preservim/NERDTree'
call plug#end()

let g:coc_disable_startupwarning = 1

" Uncomment below to set the max textwidth. Use a value corresponding to the width of your screen.
set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround
set virtualedit+=onemore
set foldmethod=manual
set background=dark
se so=9999

:set number relativenumber
:set nu rnu

syntax on

set term=screen-256color
set t_ut=

syntax enable
"colorscheme onehalfdark
"colorscheme monokai
colorscheme gruvbox

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

set visualbell

inoremap jj <ESC>

set backspace=indent,eol,start

set ttyfast

set laststatus=2

" Display options
set showmode
set showcmd


" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>

set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}

" Encoding
set encoding=utf-8

set hlsearch

" Enable incremental search
set incsearch

" Include matching uppercase words with lowercase search term
set ignorecase
" Include only uppercase words with uppercase search term
set smartcase

" Map the <Space> key to toggle a selected fold opened/closed.
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" Automatically save and load folds
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview"

let mapleader = ","
noremap <leader>w :w<cr>
noremap <leader>s :CocSearch
noremap <C-p> :Files<cr>
noremap <leader>d :NERDTreeToggle<cr>
noremap <leader>q :bd<cr>

set hidden
nnoremap <leader>a :bprev<cr>
nnoremap <leader>s :bnext<cr>
nnoremap qq :q<cr>
nnoremap <C-J> 5j
nnoremap <leader>x <C-W>l
nnoremap <leader>z <C-W>h
" noremap <C-A> gT
" noremap <C-S> gt
nnoremap <leader>c :m'a<cr>
nnoremap <leader>f :/
nnoremap <C-P> :FZF<cr>

vnoremap <C-C> "+y<cr>
vnoremap <C-V> "+p<cr>
vnoremap aa :q<cr>

:inoremap <C-H> <C-\><C-O>b
:inoremap <C-L> <C-\><C-O>w

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'SirVer/ultisnips'
Plug 'mlaursen/vim-react-snippets'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'hashivim/vim-terraform' " Terraform syntax and commands
Plug 'neoclide/coc.nvim' , { 'tag': '*', 'branch' : 'release' }
Plug 'vim-airline/vim-airline'
Plug 'eslint/eslint'
Plug 'preservim/nerdtree'
Plug 'hashivim/vim-terraform'
Plug 'vim-syntastic/syntastic'
Plug 'juliosueiras/vim-terraform-completion'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-surround'
Plug 'atom/fuzzy-finder'
Plug 'sheerun/vim-polyglot'
Plug 'preservim/nerdcommenter'
Plug 'ap/vim-buftabline'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
Plug 'mlaursen/vim-react-snippets'
Plug 'morhetz/gruvbox'
Plug 'vim-scripts/AutoClose'
Plug 'mlaursen/vim-react-snippets'
Plug 'pangloss/vim-javascript'
call plug#end()

"Exclude node modules in fzf
let $FZF_DEFAULT_COMMAND='find . \( -name node_modules -o -name .git \) -prune -o -print'


"Git
set signcolumn=yes

let g:airline_powerline_fonts = 1
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
:imap ii <Esc>
" Terraform config
let g:terraform_fmt_on_save=1
" NERDTreeConfig
let g:NERDTreeQuitOnOpen=1
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point

"Copiar al portapapeles
if executable(s:clip)
  augroup WSLYank
    autocmd!
    autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
  augroup END
endif

"Tema
"colorscheme onehalfdark
"let g:airline_theme='onehalfdark'
let g:airline_theme='gruvbox'

"inoremap ( ()<Left>
"inoremap [ []<Left>
"inoremap { {}<Left>

inoremap <expr> <CR> search('{\%#}', 'n') ? "\<CR>\<CR>\<Up>\<C-f>" : "\<CR>"

au BufWrite * :PrettierAsync
