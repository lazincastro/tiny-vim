"============================================================
" Install Dependencies (only if not installed)
"============================================================

let s:packdir = expand('~/.vim/pack')
let s:plugdir = s:packdir . '/plugins/start'

if !isdirectory(s:plugdir)
  echo "Installing plugins..."
  silent !mkdir -p ~/.vim/pack/plugins/start

  silent !git clone https://tpope.io/vim/commentary.git ~/.vim/pack/plugins/start/commentary
  silent !git clone https://github.com/tpope/vim-vinegar.git ~/.vim/pack/plugins/start/vim-vinegar
  silent !git clone https://github.com/airblade/vim-gitgutter.git ~/.vim/pack/plugins/start/vim-gitgutter
  silent !git clone https://github.com/junegunn/fzf.vim ~/.vim/pack/plugins/start/fzf.vim
  silent !git clone https://github.com/itchyny/lightline.vim ~/.vim/pack/plugins/start/lightline.vim
  silent !git clone https://github.com/dracula/vim.git ~/.vim/pack/plugins/start/dracula
  silent !git clone https://github.com/christoomey/vim-tmux-navigator.git ~/.vim/pack/plugins/start/vim-tmux-navigator
  silent !git clone https://github.com/machakann/vim-highlightedyank.git ~/.vim/pack/plugins/start/vim-highlightedyank
  silent !git clone https://github.com/github/copilot.vim ~/.vim/pack/plugins/start/copilot.vim
endif

"============================================================
" Basic Setup
"============================================================

syntax enable
filetype plugin indent on
set encoding=utf-8
set backspace=indent,eol,start
let mapleader = ','

set nowrap
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

set laststatus=2
set noerrorbells
set visualbell
set clipboard=unnamedplus
set confirm
set mouse=a
set formatoptions-=cro
set wildmenu
set noshowmode

"============================================================
" Backup, Swap and Undo
"============================================================

set backup
set undofile

set directory^=~/.vim/tmp//
set backupdir^=~/.vim/backups//
set undodir^=~/.vim/undos//

for s:dir in ['~/.vim/tmp', '~/.vim/backups', '~/.vim/undos']
  if !isdirectory(expand(s:dir))
    call mkdir(expand(s:dir), "p")
  endif
endfor

"============================================================
" Searching
"============================================================

set incsearch
set hlsearch
set ignorecase
set smartcase

"============================================================
" Scrolling
"============================================================

set scrolloff=8
set sidescrolloff=10

"============================================================
" Visual Settings
"============================================================

set termguicolors
set background=dark
colorscheme dracula

set fillchars+=vert:\ 

let g:lightline = { 'colorscheme': 'dracula' }

highlight Normal guibg=NONE ctermbg=NONE
highlight VertSplit guibg=NONE ctermbg=NONE

"============================================================
" Mappings
"============================================================

inoremap jj <ESC>

nnoremap <silent> <leader><space> :set nu! cursorline! cursorcolumn!<CR>:nohlsearch<CR>
nnoremap <leader>. :lcd %:p:h<CR>

" Terminal
nnoremap <silent> <leader>sh :below terminal<CR>
tnoremap <Esc> <C-\><C-n>
set termwinsize=10x0

" FZF
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>ff :Files<CR>

"============================================================
" Auto Commands
"============================================================

augroup RestoreCursor
  autocmd!
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   execute "normal! g`\"" |
        \ endif
augroup END

" Highlight yank
augroup HighlightYank
  autocmd!
  autocmd TextYankPost * silent! lua vim.highlight.on_yank()
augroup END

" WSL Yank support
let s:clip = '/mnt/c/Windows/System32/clip.exe'
if executable(s:clip)
  augroup WSLYank
    autocmd!
    autocmd TextYankPost *
          \ if v:event.operator ==# 'y' |
          \   call system(s:clip, @0) |
          \ endif
  augroup END
endif
