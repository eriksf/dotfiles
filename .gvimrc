"
" .gvimrc
" 2001/04/25 Tim Prindle
" Modified from gvimrc_example.vim
"

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Make external commands work through a pipe instead of a pseudo-tty
"set noguipty

set autoindent
set autoread
"set backup
"set backupdir=/export/erik
"set backupext=.~n~
set backspace=indent,eol,start
set cmdheight=2
set columns=140
set cursorline
set lines=55
"set dir=/export/erik
set expandtab
set exrc
set hidden
set history=1000
set infercase
"set ignorecase
set laststatus=2
set lazyredraw
set linebreak
"set lines=54
set magic
set mat=2
set ruler
set scrolloff=4
set shiftwidth=4
set showbreak===>
set showmatch
set showcmd
set showmode
set smartcase
set smartindent
set smarttab
set softtabstop=4
set tabstop=4
set viminfo=%,'50
set visualbell
"set nowrap
set wildmenu
set wrap
"set writebackup

" Don't use Ex mode, use Q for formatting
map Q gq

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

" Only do this part when compiled with support for autocommands.
if has("autocmd")

 " In text files, always limit the width of text to 78 characters
 autocmd BufRead *.txt set tw=78
 "autocmd BufRead *.txt set tw=65

 augroup cprog
  " Remove all cprog autocommands
  au!

  " When starting to edit a file:
  "   For C and C++ files set formatting of comments and set C-indenting on.
  "   For other files switch it off.
  "   Don't change the order, it's important that the line with * comes first.
  autocmd FileType *      set formatoptions=tcql nocindent comments&
  autocmd FileType c,cpp  set formatoptions=croql cindent comments=sr:/*,mb:*,el:*/,://
 augroup END

 augroup gzip
  " Remove all gzip autocommands
  au!

  " Enable editing of gzipped files
  " set binary mode before reading the file
  autocmd BufReadPre,FileReadPre	*.gz,*.bz2 set bin
  autocmd BufReadPost,FileReadPost	*.gz call GZIP_read("gunzip")
  autocmd BufReadPost,FileReadPost	*.bz2 call GZIP_read("bunzip2")
  autocmd BufWritePost,FileWritePost	*.gz call GZIP_write("gzip")
  autocmd BufWritePost,FileWritePost	*.bz2 call GZIP_write("bzip2")
  autocmd FileAppendPre			*.gz call GZIP_appre("gunzip")
  autocmd FileAppendPre			*.bz2 call GZIP_appre("bunzip2")
  autocmd FileAppendPost		*.gz call GZIP_write("gzip")
  autocmd FileAppendPost		*.bz2 call GZIP_write("bzip2")

  " After reading compressed file: Uncompress text in buffer with "cmd"
  fun! GZIP_read(cmd)
    " set 'cmdheight' to two, to avoid the hit-return prompt
    let ch_save = &ch
    set ch=3
    " when filtering the whole buffer, it will become empty
    let empty = line("'[") == 1 && line("']") == line("$")
    let tmp = tempname()
    let tmpe = tmp . "." . expand("<afile>:e")
    " write the just read lines to a temp file "'[,']w tmp.gz"
    execute "'[,']w " . tmpe
    " uncompress the temp file "!gunzip tmp.gz"
    execute "!" . a:cmd . " " . tmpe
    " delete the compressed lines
    '[,']d
    " read in the uncompressed lines "'[-1r tmp"
    set nobin
    execute "'[-1r " . tmp
    " if buffer became empty, delete trailing blank line
    if empty
      normal Gdd''
    endif
    " delete the temp file
    call delete(tmp)
    let &ch = ch_save
    " When uncompressed the whole buffer, do autocommands
    if empty
      execute ":doautocmd BufReadPost " . expand("%:r")
    endif
  endfun

  " After writing compressed file: Compress written file with "cmd"
  fun! GZIP_write(cmd)
    if rename(expand("<afile>"), expand("<afile>:r")) == 0
      execute "!" . a:cmd . " <afile>:r"
    endif
  endfun

  " Before appending to compressed file: Uncompress file with "cmd"
  fun! GZIP_appre(cmd)
    execute "!" . a:cmd . " <afile>"
    call rename(expand("<afile>:r"), expand("<afile>"))
  endfun

 augroup END

 " This is disabled, because it changes the jumplist.  Can't use CTRL-O to go
 " back to positions in previous files more than once.
 if 0
  " When editing a file, always jump to the last cursor position.
  " This must be after the uncompress commands.
   autocmd BufReadPost * if line("'\"") && line("'\"") <= line("$") | exe "normal `\"" | endif
 endif

endif " has("autocmd")

" Only do this for Vim version 5.0 and later.
if version >= 500

  " I like highlighting strings inside C comments
  let c_comment_strings=1

  " Switch on syntax highlighting.
  syntax on

  " Switch on search pattern highlighting.
  "set hlsearch
  "set nohlsearch
  set hlsearch
  map <f7> :nohlsearch<CR>

  " Hide the mouse pointer while typing
  set mousehide

  " Set nice colors
  " background for normal text is light grey
  " Text below the last line is darker grey
  " Cursor is green
  " Constants are not underlined but have a slightly lighter background
  "highlight Normal guibg=grey90
  "highlight Cursor guibg=Green guifg=NONE
  "highlight NonText guibg=grey80
  "highlight Constant gui=NONE guibg=grey95
  "highlight Special gui=NONE guibg=grey95
  "highlight Normal guibg=lightgray
  highlight Cursor guibg=Green guifg=NONE
  "highlight NonText guibg=lightgray
  "highlight Constant gui=NONE guibg=lightgray
  "highlight Special gui=NONE guibg=lightgray

  "set guifont=-b&h-lucidatypewriter-medium-r-normal-*-*-140-*-*-m-*-iso8859-9
  "set guifont=-b&h-lucidatypewriter-medium-r-normal-*-*-180-*-*-m-*-iso8859-9
  "set guifont=-b&h-lucidatypewriter-medium-r-normal-*-*-140-*-*-m-*-iso8859-1
  "set guifont=-b&h-lucidatypewriter-medium-r-normal-*-*-240-*-*-m-*-iso8859-9
  set guifont=Andale\ Mono:h14

  "set guioptions=mgr
  set guioptions=mgl
  "set guioptions=mglb
endif
