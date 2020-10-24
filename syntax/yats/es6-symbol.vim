let files = filter(globpath(&rtp, 'syntax/yats/es6-symbol.vim', 1, 1), { _, v -> v !~ "vim-polyglot" && v !~ $VIMRUNTIME && v !~ "after" })
if len(files) > 0
  exec 'source ' . files[0]
  finish
endif
if !exists('g:polyglot_disabled') || index(g:polyglot_disabled, 'typescript') == -1

syntax keyword typescriptGlobal containedin=typescriptIdentifierName Symbol nextgroup=typescriptGlobalSymbolDot,typescriptFuncCallArg
syntax match   typescriptGlobalSymbolDot /\./ contained nextgroup=typescriptSymbolStaticProp,typescriptSymbolStaticMethod,typescriptProp
syntax keyword typescriptSymbolStaticProp contained length iterator match replace
syntax keyword typescriptSymbolStaticProp contained search split hasInstance isConcatSpreadable
syntax keyword typescriptSymbolStaticProp contained unscopables species toPrimitive
syntax keyword typescriptSymbolStaticProp contained toStringTag
if exists("did_typescript_hilink") | HiLink typescriptSymbolStaticProp Keyword
endif
syntax keyword typescriptSymbolStaticMethod contained for keyFor nextgroup=typescriptFuncCallArg
if exists("did_typescript_hilink") | HiLink typescriptSymbolStaticMethod Keyword
endif

endif
