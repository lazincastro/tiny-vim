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
set noshowmode                    " INSERT is unnecessary (see lightline.vim docs)
set confirm                       " use a dialog when an operation has to be confirmed
set title  

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
"" On Terminal 
" Download Retrobox colorscheme:
" curl -o .vim/colors/retrobox.vim --create-dirs https://raw.githubusercontent.com/vim/colorschemes/master/colors/retrobox.vim
colorscheme retrobox       " I love it that colorscheme
set bg=dark                " Background used for highlight color
set t_Co=256               " Enable 256 colors in Vim
set fillchars+=vert:\      " remove ugly vertical lines on window division
" set cursorline            " Cursor Line
" set cursorcolumn          " Cursor Column
" set foldcolumn=1          " Width between text and border
" set colorcolumn=80        " Screen columns that are highlight
" hi Comment cterm=italic
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
