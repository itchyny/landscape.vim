
let g:Powerline#Segments#unite#segments = Pl#Segment#Init(["unite",
	\ exists('g:loaded_unite') && g:loaded_unite == 1,
\	Pl#Segment#Create('status', '%{unite#get_status_string()}')
\])
