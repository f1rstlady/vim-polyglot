let files = filter(globpath(&rtp, 'indent/lifelines.vim', 1, 1), { _, v -> v !~ "vim-polyglot" && v !~ $VIMRUNTIME && v !~ "after" })
if len(files) > 0
  exec 'source ' . files[0]
  finish
endif
if !exists('g:polyglot_disabled') || index(g:polyglot_disabled, 'lifelines') == -1

" Vim indent file
" Language:	LifeLines
" Maintainer:	Patrick Texier <p.texier@orsennes.com>
" Location:	<http://patrick.texier.free.fr/vim/indent/lifelines.vim>
" Last Change:	2010 May 7

" Only load this indent file when no other was loaded.
if exists("b:did_indent")
    finish
endif
let b:did_indent = 1

" LifeLines uses cindent without ; line terminator, C functions
" declarations, C keywords, C++ formating
setlocal cindent
setlocal cinwords=""
setlocal cinoptions+=+0
setlocal cinoptions+=p0
setlocal cinoptions+=i0
setlocal cinoptions+=t0
setlocal cinoptions+=*500

let b:undo_indent = "setl cin< cino< cinw<"
" vim: ts=8 sw=4

endif
