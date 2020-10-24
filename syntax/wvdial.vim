let files = filter(globpath(&rtp, 'syntax/wvdial.vim', 1, 1), { _, v -> v !~ "vim-polyglot" && v !~ $VIMRUNTIME && v !~ "after" })
if len(files) > 0
  exec 'source ' . files[0]
  finish
endif
if !exists('g:polyglot_disabled') || index(g:polyglot_disabled, 'wvdial') == -1

" Vim syntax file
" Language:     Configuration file for WvDial
" Maintainer:   Prahlad Vaidyanathan <slime@vsnl.net>
" Last Update:  Mon, 15 Oct 2001 09:39:03 Indian Standard Time

" Quit if syntax file is already loaded
if exists("b:current_syntax")
	finish
endif

syn match   wvdialComment   "^;.*$"lc=1
syn match   wvdialComment   "[^\\];.*$"lc=1
syn match   wvdialSection   "^\s*\[.*\]"
syn match   wvdialValue     "=.*$"ms=s+1
syn match   wvdialValue     "\s*[^ ;"' ]\+"lc=1
syn match   wvdialVar       "^\s*\(Inherits\|Modem\|Baud\|Init.\|Phone\|Area\ Code\|Dial\ Prefix\|Dial\ Command\|Login\|Login\| Prompt\|Password\|Password\ Prompt\|PPPD\ Path\|Force\ Address\|Remote\ Name\|Carrier\ Check\|Stupid\ [Mm]ode\|New\ PPPD\|Default\ Reply\|Auto\ Reconnect\|SetVolume\|Username\)"
syn match   wvdialEqual     "="

" The default highlighting
hi def link wvdialComment   Comment
hi def link wvdialSection   PreProc
hi def link wvdialVar       Identifier
hi def link wvdialValue     String
hi def link wvdialEqual     Statement

let b:current_syntax = "wvdial"

"EOF vim: tw=78:ft=vim:ts=8

endif
