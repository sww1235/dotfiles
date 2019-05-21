"" VIMRC file

"" use Vim settings rather than Vi settings
"" must be set first since it changes other options
"" avoid issues if already set
"" second "set nocompatible" is a hack that fires if the +eval comamnd is
"" missing. From defaults.vim
if &compatible
	set nocompatible
endif

silent! while 0
	set nocompatible
silent! endwhile


" basic behavior

set number              " show line numbers
set wrap                " wrap lines
set encoding=utf-8      " set encoding to UTF-8 
set mouse=a             " enable mouse support (might not work well on Mac OS X)
set lazyredraw          " redraw screen only when we need to
set showmatch           " highlight matching parentheses / brackets [{()}]
set laststatus=2        " always show statusline (even with only single window)
set ruler               " show line and column number of the cursor on right side of statusline
set visualbell          " blink cursor on error, instead of beeping
set history=200		" keep 200 lines of command line history
set showcmd		" display incomplete commands
set wildmenu		" display completion matches in status line (part of Vim, not Vi)

set ttimeout		" time out for key codes
set ttimeoutlen		" wait up to 100ms after Esc for special key

set scrolloff=5		" always show context lines around cursor. will scroll text

if has('reltime') " need reltime to avoid vim hanging when typing search pattern
	set incsearch
endif

" no octal number formats
set nrformats-=octal

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" from default vimrc

if has('win32')
	set guioptions-=t
endif


" enable mouse support if supported
if has('mouse')
	set mouse=a
endif
