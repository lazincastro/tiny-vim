"---- ---- ---- ---- Install Dependencies ---- ---- ---- ----"
let colorpath = expand('~/.vim/colors/retrobox.vim')
let startpath = expand('~/.vim/pack')
if !isdirectory(startpath)
  echo "Installing dependencies..."
  echo ""
  silent !mkdir -p ~/.vim/pack/
  silent !git clone https://tpope.io/vim/commentary.git ~/.vim/pack/tpope/start/commentary
  silent !git clone https://github.com/tpope/vim-vinegar.git ~/.vim/pack/tpope/start/vim-vinegar
  silent !git clone https://github.com/github/copilot.vim ~/.vim/pack/github/start/copilot.vim
  silent !git clone https://github.com/airblade/vim-gitgutter.git ~/.vim/pack/airblade/start/vim-gitgutter
endif
if !filereadable(colorpath) 
  silent !mkdir -p ~/.vim/colors
  silent !curl -fLo ~/.vim/colors/retrobox.vim --create-dirs https://raw.githubusercontent.com/vim/colorschemes/master/colors/retrobox.vim
endif

"---- ---- ---- ---- Basic Setup ---- ---- ---- ----"
syntax enable
filetype plugin indent on
set encoding=utf-8
set backspace=indent,eol,start    " Make backspace behave like every other editor
let mapleader = ','               " The default leader is \
set nowrap                        " Disable long line wrap
set expandtab                     " Tabs and Spaces Handling
set tabstop=2                     " Number of space that <TAB>
set softtabstop=2                 " Number of space that <TAB>
set shiftwidth=2                  " Number of space on (auto)ident
set laststatus=2                  " Always Show Status Bar
set noerrorbells visualbell t_vb= " No damn bells
set clipboard=unnamed,unnamedplus " Copy into system (*, +) register
set tags=tags;                    " Look for a tags file in directories
set confirm                       " use a dialog when an operation has to be confirmed
set mouse=a                       " Enable mouse support
set formatoptions-=cro            " Stop newline continution of comments
set rtp+=~/.fzf                   " Add fzf to runtime path
set wildmenu                      " Enable menu for command completion

"---- ---- ---- ---- Better Backup, Swap and Undos Storage ---- ---- ---- ----"
set directory=~/.vim/dirs/tmp               " directory to place swap files in
set backup                                  " make backup files
set backupdir=~/.vim/dirs/backups           " where to put backup files
set undofile                                " persistent undos
set undodir=~/.vim/dirs/undos               " undo after you re-open the file
set viminfo+=n~/.vim/dirs/viminfo
let g:yankring_history_dir = '~/.vim/dirs/' " store yankring history file

" Create Needed Directories if They Don't Exist
if !isdirectory(&backupdir)
  call mkdir(&backupdir, "p")
endif
if !isdirectory(&directory)
  call mkdir(&directory, "p")
endif
if !isdirectory(&undodir)
  call mkdir(&undodir, "p")
endif

"---- ---- ---- ---- Searching ---- ---- ---- ----"
set incsearch  " incremental search
set hlsearch   " highlighted search results
set ignorecase " Ignore case when searching...
set smartcase  " ...unless we type a capital

"---- ---- ---- ---- Visual Settings ---- ---- ---- ----"
colorscheme retrobox       " I love it that colorscheme
set bg=dark                " Background used for highlight color
set t_Co=256               " Enable 256 colors in Vim
set fillchars+=vert:\      " remove ugly vertical lines on window division
if !has("gui_running")
  hi vertsplit ctermfg=bg ctermbg=bg
endif

"---- ---- ---- ---- Mappings ---- ---- ---- ----"
" Escape to the NORMAL mode
inoremap jj <ESC>

" Toggle line number, cursor line, column line and highlight search
noremap <silent> <leader><space> :set nu! cursorline! cursorcolumn!<CR>:nohl<CR>

"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

"" terminal emulation
nnoremap <silent> <leader>sh :below terminal<CR>
tnoremap <silent><ESC> <C-w>:q!<CR>
set termwinsize=10x0

"---- ---- ---- ---- Auto-Commands ---- ---- ---- ----"
" Remember cursor position
" When a file is opened, move the cursor to the last position
autocmd BufReadPost *
 \ if line("'\"") > 0 && line("'\"") <= line("$") |
 \   execute "normal! g`\"" |
 \ endif
 \ "
