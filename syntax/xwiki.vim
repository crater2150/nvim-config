if exists("b:current_syntax")
  finish
endif

runtime! syntax/html.vim
unlet! b:current_syntax

for i in range(1,6)
	exe "syn region xwikiHeading" . i . " start='^" 
			\ . repeat("=", i) . "' end='" . repeat("=", i) . "$'"
			\ . " contains=@xwikiFormat"
	exe "syn cluster xwikiHeadings add=xwikiHeading" . i
	exe "hi def link xwikiHeading" . i . " htmlH" . i
endfor

syn region xwikiBold start="\*\*" end="\*\*"   
  \ contains=xwikiItalic,xwikiMonospace,xwikiUnderline,xwikiStriked,xwikiSuperscript,xwikiSubscript
syn region xwikiItalic start="\(\a\+:\)\@<!//" end="\(\a\+:\)\@<!//"
  \ contains=xwikiBold,xwikiMonospace,xwikiUnderline,xwikiStriked,xwikiSuperscript,xwikiSubscript
syn region xwikiMonospace start="##" end="##"
  \ contains=xwikiBold,xwikiItalic,xwikiUnderline,xwikiStriked,xwikiSuperscript,xwikiSubscript
syn region xwikiUnderline start="__" end="__"
  \ contains=xwikiBold,xwikiItalic,xwikiMonospace,xwikiStriked,xwikiSuperscript,xwikiSubscript
syn region xwikiStriked    start="--" end="--"
  \ contains=xwikiBold,xwikiItalic,xwikiMonospace,xwikiUnderline,xwikiSuperscript,xwikiSubscript
syn region xwikiSuperscript start="\^\^" end="\^\^"
  \ contains=xwikiBold,xwikiItalic,xwikiMonospace,xwikiUnderline,xwikiStriked,xwikiSubscript
syn region xwikiSubscript start=",," end=",,"
  \ contains=xwikiBold,xwikiItalic,xwikiMonospace,xwikiUnderline,xwikiStriked,xwikiSuperscript

syn cluster xwikiFormat contains=xwikiBold,xwikiItalic,xwikiMonospace,xwikiUnderline,xwikiStriked,xwikiSuperscript,xwikiSubscript

syn region xwikiStyleSpec start="(%" end="%)"

syn match xwikiHline "----"

syn match xwikiListMarker "^\s*\*\+\s"
syn match xwikiOrderedListMarker "^\s*[1*]\+\.\_s"

syn match xwikiTableHeader "|=[^|]\+"

hi def link xwikiBold                  htmlBold
hi def link xwikiItalic                htmlItalic
hi def link xwikiUnderline             htmlUnderline
hi def link xwikiMonospace             Constant
hi def link xwikiStyleSpec             Special
hi def link xwikiTableHeader           Title
hi def link xwikiHline                 Statement
hi def link xwikiListMarker            Statement
hi def link xwikiOrderedListMarker     Statement

let b:current_syntax = "markdown"
