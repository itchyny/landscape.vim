
let g:Powerline#Segments#vimshell#segments = Pl#Segment#Init(["vimshell",
	\ exists('g:loaded_vimshell') && g:loaded_vimshell == 1,
\	Pl#Segment#Create('status', '%{substitute(vimshell#get_status_string(),"\\[[a-z]\\+\\] ","","")}')
\])

