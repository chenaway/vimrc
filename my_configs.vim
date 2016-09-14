" --------------------------------------------------------------------------------
" encodings
au BufWrite *.md :set filetype=markdown
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese,cp936
set termencoding=utf-8
set ignorecase
set tabstop=4
set cmdheight=1
filetype plugin indent on

" --------------------------------------------------------------------------------
" keys
imap jk <ESC>
map <C-s> :w<CR>
" remove empty lines?
map <F1> :%s/??[^-].*//n<CR>
map <F2> :set hls!<CR>
map <F5> :so ~/.vimrc<CR>
map <F6> :Bclose<CR>
map <F7> :set guifont=Monaco:h11<CR>
" map <F8> :set guifont=Monaco:h1<CR>
map <F9> :%sort<CR>
"unmap j
"unmap k

" keys - tabs
imap jk <ESC>
nmap <leader>1 1gt
nmap <leader>2 2gt
nmap <leader>3 3gt
nmap <leader>4 4gt
nmap <leader>5 5gt
nmap <leader>6 6gt
nmap <leader>7 7gt
nmap <leader>8 8gt
nmap <leader>9 9gt
nmap <leader>c :q<CR>
nmap <leader>n :tabnext<CR>
nmap <leader>p :tablast<CR>
"nmap <leader>t :tabnew<CR>
nmap <leader>q :q<CR>
" keys - buffers
nmap <leader>bn :bnext<CR>
nmap <leader>bc :Bclose<CR>
nmap <leader>bp :blrev<CR>

" replace current word
" nmap <leader>s :%s/<C-R><C-W>//gODOD
nmap <leader>s :update<CR>


" use ; to trigger command mode
nmap ; :
vmap ; :

    

" --------------------------------------------------------------------------------
" gui basic
set guioptions=a
set nu
set relativenumber

" cursor line & column
" set cursorcolumn
set cursorline
highlight CursorLine term=underline cterm=underline

syntax enable
"set background=dark
"colorscheme solarized
colorscheme apprentice
"colorscheme antares
" for chinese char display
" set guifont=yahei\ mono:h11:b
" set guifont=Ubuntu\ Mono:h17
set guifont=Monaco:h11
" set guifont=consolas:h11:b
"let mapleader = "\"

set autochdir

" --------------------------------------------------------------------------------
" functions
function! Addlinenumber()
    let currentline = line('.')
    execute "g/^/exec \"s/^/\\\\=line('.') . '. '/\""
    execute "normal" currentline . "G" 
endfunction
map <leader>l <ESC>:call Addlinenumber()<CR>

function! Find(word)
    execute "g/" . a:word . "/echo line('.') getline('.')"
endfunction
map <leader>f <ESC>:call Find("")<Left><Left>

" create new markdown file in current directory with date as filename
function! CreateTodaysMarkdown()
    let filename = strftime('%Y%m%d') . '.md'
    if !filereadable(filename)
        call writefile([], filename)
        echo 'file created, open it'
    else
        echo 'file exists, open it'
    endif
    exec ":e " . filename
endfunction
nmap <leader>md :call CreateTodaysMarkdown()<CR>

" --------------------------------------------------------------------------------
" plugins

" ctrlp
map <C-p> :CtrlPMRU<CR>

" NERDTree: nerdtree and nerdtree-tab {{{
    let g:NERDTreeChDirMode = 2
    let g:NERDTreeDirArrows = 1
    let g:NERDTreeShowBookmarks = 1
    let g:NERDTreeWinPos = "left"
    let g:NERDTreeDirArrowExpandable = '+'
    let g:NERDTreeDirArrowCollapsible = '>'
    " for special fonts only
    " let NERDTreeDirArrowExpandable = '▸'
    " let NERDTreeDirArrowCollapsible = '▾'
    let g:nerdtree_tabs_open_on_gui_startup = 0
    map <C-N> :NERDTreeTabsToggle<CR>
" }}}

" yankring
let yankring_replace_n_nkey='<C-J>'

" TList: tag list
"let Tlist_Auto_Open = 1 
let Tlist_Exit_OnlyWindow = 1
let Tlist_Show_One_File = 1
let Tlist_Use_Right_Window = 1
let Tlist_Show_Menu = 1
let Tlist_Compact_Format = 1
let Tlist_Auto_Update = 1
nnoremap <silent> <F3> :TlistToggle<CR>

" StupidEasyMotion: {{{
    map <C-O> <Leader><Leader>w
    map <C-E> <Leader><Leader>W
" }}}

" full screen
map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>

" YouCompleteMe: {{{
    "let g:ycm_min_num_of_chars_for_completion = 1
    "let g:ycm_filetype_blacklist = {}
" }}}

" PYMOD: {{{
    let g:pymode_rope_lookup_project = 0
    let g:pymode_rope = 0
    let g:pymode_rope_goto_definition_bind = '<Leader>d'
    let g:pymode_run = 1
    " let g:pymode_rope_completion_bind = '<Tab>'
    " Turn on pymode syntax
    let g:pymode_syntax = 1
    " Enable all python highlights
    let g:pymode_syntax_all = 1
    let g:pymode_syntax_slow_sync = 1
    " Highlight "print" as a function
    let g:pymode_syntax_print_as_function = 1
    let g:pymode_folding = 1
" }}}

" JSON: {{{
    let g:vim_json_syntax_conceal = 0
" }}}

" JediVim: {{{
    let g:jedi#completions_command = "<Tab>"
    let g:jedi#rename_command = "<leader>rr"
" }}}

" PyUnit: {{{
"    map <leader>t :call PyUnitRunTests()<CR>
" }}}

" Python: {{{
    map <leader>t :!nosetests %<CR>
" }}}

" Orgmode: {{{
    let g:org_agenda_fields = ['~/org/index.org']
" }}}
"

" IndentLine: {{{
    let g:indentLine_enabled = 1
    " let g:indentLine_char = 'c'
    let g:indentLine_color_gui = '#A4E57E'
    " let g:indentLine_color_term = 239
" }}}
