syn region htmlReplacement start="{" end="}" contains=rustIdentifier
syn region htmlReplacement start="{" end="}" containedin=htmlH1,htmlH2,htmlH3,htmlH4,htmlH5,htmlH6,htmlHead,htmlTitle,htmlString,htmlValue contains=rustIdentifier
hi link htmlReplacement PreProc
