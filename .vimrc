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

" no defaults.vim
unlet! skip_defaults_vim

" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start

" basic behavior

set number              " show line numbers
set wrap                " wrap lines
set encoding=utf-8      " set encoding to UTF-8
set lazyredraw          " redraw screen only when we need to
set showmatch           " highlight matching parentheses / brackets [{()}]
set laststatus=2        " always show statusline (even with only single window)
set ruler               " show line and column number of the cursor on right side of statusline
set visualbell          " blink cursor on error, instead of beeping
set history=200		" keep 200 lines of command line history
set showcmd		" display incomplete commands
set wildmenu		" display completion matches in status line (part of Vim, not Vi)

set ttimeout		" time out for key codes
set ttimeoutlen=100	" wait up to 100ms after Esc for special key

set scrolloff=5		" always show context lines around cursor. will scroll text

" set colorscheme to my own
colorscheme toxic

" Setup tabstop and autoindent

" Only do this part when Vim was compiled with the +eval feature.
if has("autocmd")

	" Enable file type detection.
	" Use the default filetype settings, so that mail gets 'tw' set to 72,
	" 'cindent' is on in C files, etc.
	" Also load indent files, to automatically do language-dependent indenting.
	" Revert with ":filetype off".
	filetype plugin indent on
	set foldmethod=syntax
	set nofoldenable
	" Put these in an autocmd group, so that you can revert them with:
	" ":augroup vimStartup | au! | augroup END"
	augroup vimStartup
		au!
		" When editing a file, always jump to the last known cursor position.
		" Don't do it when the position is invalid, when inside an event handler
		" (happens when dropping a file on gvim) and for a commit message (it's
		" likely a different one than last time).
		autocmd BufReadPost *
		\ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
		\ |   exe "normal! g`\""
		\ | endif
	augroup END
elseif
	set noexpandtab
	set tabstop=4
	set shiftwidth=4
	set softtabstop=0

endif

if has('reltime')	" need reltime to avoid vim hanging when typing search pattern
	set incsearch
endif

" no octal number formats for ctrl-a and ctrl-x
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

" from defaults.vim
"
" Switch syntax highlighting on when the terminal has colors or when using the
" GUI (which always has colors).
if &t_Co > 2 || has("gui_running")
	" Revert with ":syntax off".
	syntax on

	" I like highlighting strings inside C comments.
	" Revert with ":unlet c_comment_strings".
	let c_comment_strings=1
endif



" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
" Revert with: ":delcommand DiffOrig".
if !exists(":DiffOrig")
	command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		\ | wincmd p | diffthis
endif

if has('langmap') && exists('+langremap')
	" Prevent that the langmap option applies to characters that result from a
	" mapping.  If set (default), this may break plugins (but it's backward
	" compatible).
	set nolangremap
endif

" From https://github.com/dense-analysis/ale/README.md
" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded
" All messages and errors will be ignored
silent! helptags ALL
