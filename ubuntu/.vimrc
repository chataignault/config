
filetype plugin indent on
syntax enable on


set conceallevel=1
set encoding=utf8

let g:vimtex_view_method='zathura'
let g:tex_conceal='abdmg'
let g:vimtex_compiler_progname='latexmk'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_CompileRule_pdf='latexmk -pdf -f -$*'

let g:UltiSnipsExpandTrigger='<c-e>'
let g:UltiSnipsJumpForwardTrigger='<c-e>'
let g:UltiSnipsJumpBackwardTrigger='<S-e>'
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']
"let g:UltiSnipsSnippetDir=$HOME.'/.vim/UltiSnips'
let maplocalender=','

let g:rustfmt_autosave=1
