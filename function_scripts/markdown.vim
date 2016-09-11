function! AddLink()
    v/ <a/s/^\([#]\+\) \(.*\)/\1 <a name='\2'>\2<\/a>/g 
    normal ''
endfunc
map <leader>l :call AddLink()
