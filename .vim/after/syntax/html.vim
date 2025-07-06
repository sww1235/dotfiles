syn region htmlReplacement start="{" end="}" contains=rustIdentifier
syn region htmlReplacement start="{" end="}" containedin=htmlH1,htmlH2,htmlH3,htmlH4,htmlH5,htmlH6,htmlHead,htmlTitle,htmlString,htmlValue contains=rustIdentifier
syn region htmlLegend start="<legend\>" end="</legend\_s*>"me=s-1 contains=@htmlTop
hi link htmlReplacement PreProc
hi link htmlLegend Title
