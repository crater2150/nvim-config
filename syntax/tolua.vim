if exists("b:current_syntax")
  finish
endif

syn include @EmbeddedLua     syntax/lua.vim
syn include @EmbeddedPreproc syntax/c.vim

syn match toluaString "\".*\"" 
syn match toluaInclude "<.*>" 
syn region toluaEmbeddedLua matchgroup=toluaEmbeddedDelimiter
      \ start="^\$\[" end="^\$\]" contains=@EmbeddedLua
syn match toluaCInclude "^\$#.*$" contains=toluaString,toluaInclude

syn keyword toluaStatement module nextgroup=toluaModuleName skipwhite
syn match toluaModuleName "[_a-zA-Z]\+" contained

syn match toluaRename "@ [_a-zA-Z]\+"

" from c syntax file
syn keyword	cType		int long short char void
syn keyword	cType		signed unsigned float double
syn keyword	luaState        lua_State

syn region cComment	matchgroup=cCommentStart start="/\*" end="\*/" contains=@cCommentGroup,cCommentStartError,cCommentString,cCharacter,cNumbersCom,cSpaceError,@Spell extend
syn region	cComment	matchgroup=cCommentStart start="/\*" end="\*/" contains=@cCommentGroup,cCommentStartError,cSpaceError,@Spell extend
syn keyword	cStructure	struct union enum typedef
syn keyword	cStorageClass	static register auto volatile extern const

let b:current_syntax = "tolua"

hi def link toluaEmbeddedDelimiter      Special
hi def link toluaCInclude               PreProc
hi def link toluaString                 String
hi def link toluaInclude                String
hi def link toluaStatement              Statement
hi def link toluaModuleName             Identifier
hi def link toluaRename                 Special
hi def link cType                       Type
hi def link luaState                    Type
hi def link cStorageClass               StorageClass
hi def link cStructure                  Structure
