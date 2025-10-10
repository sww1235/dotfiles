" vim: set tabstop=4 :
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

set autoread				" will automatically read files that change outside of vim but not inside
set clipboard=unnamedplus,unnamed 	" merges vim yank register, and system clipboards
set encoding=utf-8      		" set encoding to UTF-8
set history=200				" keep 200 lines of command line history
set laststatus=2        		" always show statusline (even with only single window)
set lazyredraw          		" redraw screen only when we need to
set matchpairs+=<:>			" add angle brackets to matchpairs
set maxmempattern=5000			" increase the amount of memory available for pattern searching
set number              		" show line numbers
set ruler               		" show line and column number of the cursor on right side of statusline
set scrolloff=5				" always show context lines around cursor. will scroll text
set showcmd				" display incomplete commands
set showmatch           		" highlight matching parentheses / brackets [{()}]
set splitbelow				" when using :split, put the new window below the current one
set splitright				" when using :vsplit, put the new window to the right of the current one
set ttimeout				" time out for key codes
set ttimeoutlen=100			" wait up to 100ms after Esc for special key
set visualbell          		" blink cursor on error, instead of beeping
set whichwrap=b,s,<,>,[,]		" which keys can move to next/previous line when on last/first character of line
set wildmenu		" display completion matches in status line (part of Vim, not Vi)
set wrap                " wrap lines


" https://github.com/nickjj/dotfiles/blob/d3c2b74f50e786edf78eceaa5359145f6f370eb3/.vimrc#L319C1-L322C18
" Prevent x and the delete key from overriding what's in the clipboard.
noremap x "_x
noremap X "_x
noremap <Del> "_x

" https://github.com/nickjj/dotfiles/blob/d3c2b74f50e786edf78eceaa5359145f6f370eb3/.vimrc#L324C1-L325C16
" Prevent selecting and pasting from overwriting what you originally copied.
xnoremap p pgvy

" https://github.com/nickjj/dotfiles/blob/d3c2b74f50e786edf78eceaa5359145f6f370eb3/.vimrc#L132C1-L139C6
" Enable 24-bit true colors if your terminal supports it.
if (has("termguicolors"))
" https://github.com/vim/vim/issues/993#issuecomment-255651605
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	set termguicolors
endif


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
		autocmd!
		" When editing a file, always jump to the last known cursor position.
		" Don't do it when the position is invalid, when inside an event handler
		" (happens when dropping a file on gvim) and for a commit message (it's
		" likely a different one than last time).
		autocmd BufReadPost *
		\ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
		\ |   exe "normal! g`\""
		\ | endif
	augroup END
else
	set noexpandtab
	set tabstop=4
	set shiftwidth=4
	set softtabstop=0
endif

if has("autocmd")
	" Auto-resize splits when Vim gets resized.
	autocmd VimResized * wincmd =
	" https://github.com/nickjj/dotfiles/blob/d3c2b74f50e786edf78eceaa5359145f6f370eb3/.vimrc#L410C1-L411C48
	" Make sure .aliases, .bash_aliases and similar files get syntax highlighting.
	autocmd BufNewFile,BufRead .*aliases* set ft=sh
	" https://github.com/nickjj/dotfiles/blob/d3c2b74f50e786edf78eceaa5359145f6f370eb3/.vimrc#L416C1-L417C43
	" Ensure tabs don't get converted to spaces in Makefiles.
	autocmd FileType make setlocal noexpandtab
endif

if has('reltime')	" need reltime to avoid vim hanging when typing search pattern
	set incsearch
endif

" https://github.com/nickjj/dotfiles/blob/d3c2b74f50e786edf78eceaa5359145f6f370eb3/.vimrc#L441C1-L464C28
" Allow files to be saved as root when forgetting to start Vim using sudo.
command Sw :execute ':silent w !sudo tee % > /dev/null' | :edit!

" Add all TODO items to the quickfix list relative to where you opened Vim.
function! s:todo() abort
	let entries = []
	for cmd in ['git grep -niIw -e TODO -e FIXME 2> /dev/null',
			\ 'grep -rniIw -e TODO -e FIXME . 2> /dev/null']
		let lines = split(system(cmd), '\n')
		if v:shell_error != 0 | continue | endif
		for line in lines
			let [fname, lno, text] = matchlist(line,'^\([^:]*\):\([^:]*\):\(.*\)')[1:3]
			call add(entries, { 'filename': fname, 'lnum': lno, 'text': text })
		endfor
		break
	endfor

	if !empty(entries)
		call setqflist(entries)
		copen
	endif
endfunction

command! Todo call s:todo()

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

" fixing issue with mouse not selecting things past 223rd column
" https://github.com/vim/vim/issues/2309#issuecomment-343288543
if has("mouse_sgr")
		set ttymouse=sgr
else
		set ttymouse=xterm2
end

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

" markdown specific commands
let g:markdown_fenced_languages = ['html', 'conf', 'bash=sh', 'sh', 'rust', 'vim']


" rust specific commands
let g:rustfmt_autosave = 1
let g:ale_rust_cargo_use_clippy = 1
let g:rust_fold = 1
let g:rustfmt_command = 'cargo +nightly fmt'

" turn off inline error messages
let g:ale_virtualtext_cursor = 'disabled'

let g:airline#extensions#ale#enabled = 1


" From https://github.com/dense-analysis/ale/README.md
" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded
" All messages and errors will be ignored
silent! helptags ALL
