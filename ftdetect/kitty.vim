au! BufNewFile,BufRead kitty.conf   set ft=kitty syntax=kitty
if exists("$XDG_CONFIG_HOME")
  au! BufNewFile,BufRead $XDG_CONFIG_HOME/kitty/*.conf    set ft=kitty syntax=kitty
  au! BufRead,BufNewFile $XDG_CONFIG_HOME/kitty/*.session set ft=kitty-session syntax=kitty-session
else
  au! BufNewFile,BufRead ~/.config/kitty/*.conf   set ft=kitty syntax=kitty
  au! BufRead,BufNewFile ~/.config/kitty/*.session set ft=kitty-session syntax=kitty-session
endif
