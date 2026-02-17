" When started as "evim", evim.vim will already have done these settings, bail
" out.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

" This makes vim look better.
set background=dark
" This guy likes to highlight stuff that is not wrong so he can go nospell.
set nospell
" Number lines use relativenumber to see how many up and down from the cursor 
" lines are. That seemed good to me, but became distracting ymmmv.
set number
" This makes it so that copied stuff in vim goes to the os clipboard. Run vim
" --version | grep clipboard and verify there is a plus next to it otherwise 
" lookup how to fix that issue.
set clipboard=unnamedplus
"Translates 1 tab = 4 spaces
set expandtab
"How many spaces per tab (This goes for interpreted tabs)
set tabstop=2
"Indent to depth of line above. Good for code, bad for school.
set autoindent
"This adds an extra tab when using if statements and stuff like that
set smartindent

set termguicolors

set cursorline

highlight LineNr ctermfg=DarkGrey ctermbg=NONE guifg=DarkGrey guibg=NONE
highlight CursorLineNr ctermfg=White ctermbg=NONE guifg=White guibg=NONE

set shortmess-=S
