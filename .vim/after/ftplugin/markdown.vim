setlocal noexpandtab		" do not convert tabs to spaces
setlocal tabstop=4		" hard tab stops are 4 columns
setlocal shiftwidth=4	" indents will also be 4 columns
setlocal softtabstop=0	" don't use softtabstop
setlocal autoindent

let g:markdown_fenced_languages = ['html', 'conf', 'bash=sh', 'sh', 'rust', 'vim', 'toml']
