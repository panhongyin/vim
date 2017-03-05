"=====================================================================
"         the vim configure file only for seven(panhongyin)
"=====================================================================


"=====================================================================
"          this part for vim base configure options
"=====================================================================

" file default encoding format and supported
set fileencoding=utf-8
set fileencodings=utf-8,latin1,usc-bom,euc-jp,gb18030,gbk,gb2312,cp936

" encoding used internally
set encoding=utf-8

" make sure last line in file has <EOL>
set fixendofline

" list of directories searched with "gf" et.al.
set path=.,/usr/include,/usr/local/include,

" switch on file type detection, with automatic indenting and settings
filetype plugin on
filetype plugin indent on

" only use vim mode
set nocompatible

" start using syntax highlighting
syntax on

" highlight matches with search pattern
set hlsearch
set incsearch

" smart autoindenting for C
set cindent

" take indent for new line from previous line
set autoindent
set smartindent

" number of spaces to use for (auto)indent step
set smarttab
set shiftwidth=4

" use spaces when <Tab> is inserted
set expandtab

" number of spaces that <Tab>
set tabstop=4
set softtabstop=4

" maximum width of text that is being inserted
set textwidth=79

" briefly jump to matching bracket if insert one
set showmatch

" no ignore case when pattern has uppercase
set smartcase		

" highlight the screen line of the cursor
set cursorline		

" always show status line on my format
set laststatus=2
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %l/%L%)

" use /usr/share/vim/vim74/colors/evening.vim
"colorscheme evening

" "dark" or "light", used for highlight colors
set background=dark

" disable generate temporary file
set nobackup
set noswapfile

" disable loop search
set nowrapscan

" print the line number in front of each line
set number

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" read/write a .viminfo file, don't store more than 50 lines of registers
set viminfo='20,\"50

" number of command-lines that are remembered
set history=100

" show cursor line and column in the status line
set ruler

" autom. read file when changed outside of Vim
set autoread

" write to file with no need for "!" override
set writeany

" disable ring the bell for error messages
set noerrorbells


"=====================================================================
" this part for shortcut keys configure 
"=====================================================================
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


"=====================================================================
"            this part for autocmd configure options
"=====================================================================
autocmd BufNewFile,BufRead *.yml,*.yaml,*.html,*.css 
\ set tabstop=2 |
\ set softtabstop=2 |
\ set shiftwidth=2

" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
\ if line("'\"") > 0 && line ("'\"") <= line("$") |
\   exe "normal! g'\"" |
\ endif