
" This is necessary for VimTeX to load properly. The "indent" is optional.
" Note that most plugin managers will do this automatically.
filetype on
filetype plugin on 
filetype indent on

" Necessary for vimtex 
set encoding=utf8 

" This enables Vim's and neovim's syntax-related features. Without this, some
" VimTeX features will not work (see ":help vimtex-requirements" for more
" info).
syntax on
syntax enable

" Viewer options: One may configure the viewer either by specifying a built-in
" viewer method:
let g:vimtex_view_general_viewer = 'SumatraPDF'
let g:vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'
let g:vimtex_view_automatic = 1

let g:vimtex_log_verbose = 1


set conceallevel=1
let g:tex_conceal='abdmg'

" VimTeX uses latexmk as the default compiler backend. If you use it, which is
" strongly recommended, you probably don't need to configure anything. If you
" want another compiler backend, you can change it as follows. The list of
" supported backends and further explanation is provided in the documentation,
" see ":help vimtex-compiler".
let g:vimtex_compiler_method = 'latexmk'
let g:vimtex_compiler_latexmk = {
    \ 'build_dir' : '',
    \ 'callback' : 1,
    \ 'continuous' : 1,
    \ 'executable' : 'latexmk',
    \ 'hooks' : [],
    \ 'options' : [
    \   '-pdf',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \   '-shell-escape',  
    \ ],
    \}

let g:vimtex_compiler_progname = 'vim'
" Most VimTeX mappings rely on localleader and this can be changed with the
" following line. The default is usually fine and is the symbol "\".

set iskeyword+=:

let maplocalleader = ","

set packpath+=~/.vim

set background=dark
let g:one_dark_termcolors=16

