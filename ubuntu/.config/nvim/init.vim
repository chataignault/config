" ============================================================================
" Basic Vim Settings
" ============================================================================

filetype plugin indent on
syntax enable on

" ============================================================================
" Appearance & Colorscheme
" ============================================================================

colorscheme catppuccin-mocha

" Transparency settings
highlight Normal guibg=NONE ctermbg=NONE
highlight NonText guibg=NONE ctermbg=NONE
highlight EndOfBuffer guibg=NONE ctermbg=NONE
highlight SignColumn guibg=NONE ctermbg=NONE

" ============================================================================
" Editor Settings
" ============================================================================

set conceallevel=1
set encoding=utf8
set clipboard=unnamedplus

" ============================================================================
" LaTeX/VimTeX Configuration
" ============================================================================

let g:vimtex_view_method='zathura'
let g:tex_conceal='abdmg'
let g:vimtex_compiler_progname='latexmk'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_CompileRule_pdf='latexmk -pdf -f -$*'

" ============================================================================
" UltiSnips Configuration
" ============================================================================

let g:UltiSnipsExpandTrigger='<c-e>'
let g:UltiSnipsJumpForwardTrigger='<c-e>'
let g:UltiSnipsJumpBackwardTrigger='<S-e>'
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']
"let g:UltiSnipsSnippetDir=$HOME.'/.vim/UltiSnips'"
let maplocalender=','

" ============================================================================
" Language Specific Settings
" ============================================================================

" Rust
let g:rustfmt_autosave=1

" ============================================================================
" Disable Unused Providers
" ============================================================================

let g:loaded_perl_provider=0
let g:loaded_ruby_provider=0
let g:loaded_node_provider=0
