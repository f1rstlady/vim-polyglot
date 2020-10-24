let files = filter(globpath(&rtp, 'syntax/tt2js.vim', 1, 1), { _, v -> v !~ "vim-polyglot" && v !~ $VIMRUNTIME && v !~ "after" })
if len(files) > 0
  exec 'source ' . files[0]
  finish
endif
if !exists('g:polyglot_disabled') || index(g:polyglot_disabled, 'perl') == -1

" Language:      TT2 embedded with Javascript
" Maintainer:    Andy Lester <andy@petdance.com>
" Author:        Yates, Peter <pd.yates@gmail.com>
" Homepage:      http://github.com/vim-perl/vim-perl
" Bugs/requests: http://github.com/vim-perl/vim-perl/issues
" Last Change:   {{LAST_CHANGE}}

if exists("b:current_syntax")
    finish
endif

runtime! syntax/javascript.vim
unlet b:current_syntax

runtime! syntax/tt2.vim
unlet b:current_syntax

syn cluster javascriptPreProc add=@tt2_top_cluster

let b:current_syntax = "tt2js"

endif
