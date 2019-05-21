" Modified from darkblue and default scheme
" color scheme ideas
" black background
" medium gray comments
" normal text is bright green
" quoted strings and characters are dark forrest green
" all other constants are a light orange
" identifiers (variable names) are ba0000
" function names are 005ae2
" statements are c21460
" preproc yellow


" use colors defined for dark background
set bg=dark
hi clear " clear existing colorschemes

if exists("syntax_on")
	syntax reset
endif

let colors_name = "toxic"

"hi = highlight

hi Normal	ctermfg=darkgreen ctermbg=black guifg=#007f00 guibg=#000000
hi ErrorMsg	ctermfg=red ctermbg=white guifg=#FF0000 guibg=#FFFFFF
hi Visual	ctermfg=fg ctermbg=white cterm=reverse guifg=fg guibg=#FFFFFF gui=reverse
hi VisualNOS	ctermfg=fg ctermbg=white cterm=reverse,underline guifg=fg guibg=#FFFFFF gui=reverse,underline
" todo is medium magenta (Magenta3) on normal background
hi Todo		ctermfg=163 ctermbg=bg guifg=#d700af guibg=bg term=standout
" Search is what all results are shown as, while IncSearch is the currently
" selected result
" search is yellow on dark gray background (underlined in terminal)
hi Search	ctermfg=226 ctermbg=darkgray cterm=underline guifg=#ffff00 guibg=#808080 term=underline
" incsearch is orange on dark gray background (stolen from chrome), underlined
" and bold in terminal
hi IncSearch	ctermfg=208 ctermbg=darkgray cterm=underline,bold guifg=#ff8700 guibg=#808080 term=underline,bold
" SpecialKey is highlighting for "text that is displayed differently than what
" it really is" like spaces, newlines, tabs and meta/control characters
" slightly lighter green than normal text on normal background
hi SpecialKey	ctermfg=28 ctermbg=bg guifg=#008700 guibg=bg
hi Directory	ctermfg=28 ctermbg=bg guifg=#008700 guibg=bg
hi Title	ctermfg=magenta cterm=bold guifg=magenta gui=none
" same as errormsg
hi WarningMsg	ctermfg=red ctermbg=white guifg=#FF0000 guibg=#FFFFFF
" same as search and incsearch
hi WildMenu	ctermfg=226 ctermbg=darkgray guifg=#ffff00 guibg=#808080 term=underline
" insert or visual
hi ModeMsg	ctermfg=fg  ctermbg=bg cterm=bold guifg=fg guibg=bg gui=bold
" message prompts from vim
hi MoreMsg	ctermfg=red ctermbg=white guifg=#FF0000 guibg=#FFFFFF
hi Question	ctermfg=red ctermbg=white guifg=#FF0000 guibg=#FFFFFF
" nontext is text that is not really in text such as @ at end of line, show
" break, etc. Same as specialkey for now
hi Nontext	ctermfg=28 ctermbg=bg guifg=#008700 guibg=bg

" statuslinenc is non focused window
hi StatusLine	ctermfg=fg ctermbg=darkgray cterm=bold guifg=fg guibg=#808080 gui=bold term=reverse,bold
hi StatusLineNC	ctermfg=fg ctermbg=darkgray guifg=fg guibg=#808080 term=reverse

hi VertSplit	ctermfg=NONE ctermbg=darkgray guifg=NONE guibg=#808080
hi LineNr	ctermfg=19 ctermbg=darkgray guifg=#0000af guibg=#808080
hi CursorLineNr	ctermfg=33 ctermbg=black guifg=#0087ff guibg=#000000
hi Folded 	ctermfg=19 ctermbg=darkgray guifg=#0000af guibg=#808080
hi FoldColumn	ctermfg=19 ctermbg=black guifg=#0000af guibg=#000000

hi Cursor	ctermfg=black ctermbg=green guifg=black guibg=#00ff00
hi CursorLine	ctermfg=fg ctermbg=240 guifg=fg guibg=#585858

" diffadd is based on default atom diff highlighting
" light text on green background for added lines
" light text on red background for deleted lines
" dark text on orange background for changed lines
" blue text on orange background for changed text within changed line
hi DiffAdd	ctermfg=gray ctermbg=29 guifg=#c0c0c0 guibg=#00875f
hi DiffDelete	ctermfg=gray ctermbg=52 guifg=#c0c0c0 guibg=#5f0000
hi DiffChange	ctermfg=darkgray ctermbg=214 guifg=#808080 guibg=#ffaf00
hi DiffText	ctermfg=blue ctermbg=bg guifg=#0000ff guibg=bg

" syntax highlighting specific colors


" medium gray comments
" normal text is bright green
" quoted strings and characters are medium blue
" all other constants are a light orange
" identifiers (variable names) are dark red
" function names are 005ae2 (cornflower blue)
" statements are c21460 (deep pink)
" preproc yellow
" type is purple
" Special is pale green
" Underlined is dark red and underlined
"

hi Comment	ctermfg=gray guifg=#c0c0c0
hi String	ctermfg=27 guifg=#005fff
hi Character	ctermfg=27 guifg=#005fff
hi Number	ctermfg=172 guifg=#d78700
hi Float	ctermfg=172 guifg=#d78700
hi Boolean	ctermfg=172 guifg=#d78700

hi Identifier	ctermfg=160 guifg=#d70000
hi Function	ctermfg=69 guifg=#5f87ff

hi Statement	ctermfg=161 guifg=#d7005f

hi Preproc	ctermfg=220 guifg=#ffd700

hi Type		ctermfg=57 guifg=#5f00ff

hi Special	ctermfg=158 guifg=#afffd7

hi Underlined	ctermfg=160 cterm=underline guifg=#d70000 gui=underline term=underline

hi Ignore	ctermfg=bg guifg=bg

