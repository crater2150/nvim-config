" Vim syntax file
" Language: Kitty session

if exists("b:current_syntax")
  finish
endif

syn keyword kittySessionCommand
	\ new_tab
	\ new_os_window
	\ layout
	\ launch
	\ focus
	\ enabled_layouts
	\ cd
	\ title
	\ os_window_size
	\ os_window_class

syn keyword	kittyTodo	contained TODO FIXME XXX
syn match	kittyComment	"^#.*" contains=kittyTodo

hi def link kittySessionCommand Keyword
hi def link kittyComment Comment
hi def link kittyTodo	Todo
