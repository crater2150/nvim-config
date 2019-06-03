let s:texNoSpell=[
			\['texTypeStyle', 'texttt'],
			\['texStatement', 'scala'],
			\['texStatement', 'java'],
			\]
for nospell in s:texNoSpell
	exe "syntax match ".nospell[0]." '\\\\".nospell[1]."\\>' nextgroup=texCustomNoSpell"
endfor
syntax region texCustomNoSpell matchgroup=Delimiter start='{' end='}' contained contains=@NoSpell
