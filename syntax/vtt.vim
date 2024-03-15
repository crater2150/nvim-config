" Vim syntax file
" Language:	Web Video Text Tracks Format (VTT)
" Filenames:	*.vtt
" Vim syntax file
" SeeAlso:      <https://developer.mozilla.org/en-US/docs/Web/API/WebVTT_API>
" Maintainer:   Alexander Gehrke
" Created:      2023-12-19

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn region vttComment start="^NOTE .*" end="^$"
syn match vttTimings "\d\{2}:\d\{2}\.\d\{3}"
syn match vttArrow "-->"
syn keyword vttHeader WEBVTT

hi def link vttTimings   Number
hi def link vttArrow     Special
hi def link vttComment   Comment
hi def link vttHeader    Keyword

let b:current_syntax = "vtt"
