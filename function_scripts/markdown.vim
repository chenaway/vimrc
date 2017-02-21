function! AddLink()
    v/ <a/s/^\([#]\+\) \(.*\)/\1 <a name='\2'>\2<\/a>/g 
    normal ''
endfunc
map <leader>l :call AddLink()

function! GenerateDocx()
    " requires: https://github.com/vim-pandoc/vim-pandoc
    Pandoc -s -S --toc docx
    " open the output
    let output=substitute(expand('%'), '.md', '.docx', '')
    exec("silent ! cygstart " . output)
endfunc
map <leader>g :call GenerateDocx()<CR>
