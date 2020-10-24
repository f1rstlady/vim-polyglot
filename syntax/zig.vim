let files = filter(globpath(&rtp, 'syntax/zig.vim', 1, 1), { _, v -> v !~ "vim-polyglot" && v !~ $VIMRUNTIME && v !~ "after" })
if len(files) > 0
  exec 'source ' . files[0]
  finish
endif
if !exists('g:polyglot_disabled') || index(g:polyglot_disabled, 'zig') == -1

" Vim syntax file
" Language: Zig
" Maintainer: Andrew Kelley
" Latest Revision: 03 August 2016

if exists("b:current_syntax")
  finish
endif
let b:current_syntax = "zig"

syn keyword zigStorage const var extern packed export pub noalias inline noinline comptime callconv volatile allowzero align linksection threadlocal anytype
syn keyword zigStructure struct enum union error opaque
syn keyword zigStatement break return continue asm defer errdefer unreachable try catch async nosuspend await suspend resume
syn keyword zigConditional if else switch and or orelse
syn keyword zigRepeat while for

syn keyword zigConstant null undefined
syn keyword zigKeyword fn usingnamespace test
syn keyword zigType bool f16 f32 f64 f128 void noreturn type anyerror anyframe
syn keyword zigType i0 u0 isize  usize comptime_int comptime_float
syn keyword zigType c_short c_ushort c_int c_uint c_long c_ulong c_longlong c_ulonglong c_longdouble c_void

syn keyword zigBoolean true false

syn match zigType "\v<[iu][1-9]\d*>"

syn match zigOperator display "\V\[-+/*=^&?|!><%~]"
syn match zigArrowCharacter display "\V->"

syn match zigBuiltinFn "\v\@(addWithOverflow|as|atomicLoad|atomicStore|bitCast|breakpoint)>"
syn match zigBuiltinFn "\v\@(alignCast|alignOf|cDefine|cImport|cInclude)>"
syn match zigBuiltinFn "\v\@(cUndef|canImplicitCast|clz|cmpxchgWeak|cmpxchgStrong|compileError)>"
syn match zigBuiltinFn "\v\@(compileLog|ctz|popCount|divExact|divFloor|divTrunc)>"
syn match zigBuiltinFn "\v\@(embedFile|export|tagName|TagType|errorName|call)>"
syn match zigBuiltinFn "\v\@(errorReturnTrace|fence|fieldParentPtr|field|unionInit)>"
syn match zigBuiltinFn "\v\@(frameAddress|import|newStackCall|asyncCall|intToPtr)>"
syn match zigBuiltinFn "\v\@(memcpy|memset|mod|mulWithOverflow|splat|src)>"
syn match zigBuiltinFn "\v\@(bitOffsetOf|byteOffsetOf|OpaqueType|panic|ptrCast)>"
syn match zigBuiltinFn "\v\@(ptrToInt|rem|returnAddress|setCold|Type|shuffle|reduce)>"
syn match zigBuiltinFn "\v\@(setRuntimeSafety|setEvalBranchQuota|setFloatMode)>"
syn match zigBuiltinFn "\v\@(setGlobalLinkage|setGlobalSection|shlExact|This|hasDecl|hasField)>"
syn match zigBuiltinFn "\v\@(shlWithOverflow|shrExact|sizeOf|bitSizeOf|sqrt|byteSwap|subWithOverflow|intCast|floatCast|intToFloat|floatToInt|boolToInt|errSetCast)>"
syn match zigBuiltinFn "\v\@(truncate|typeInfo|typeName|TypeOf|atomicRmw|bytesToSlice|sliceToBytes)>"
syn match zigBuiltinFn "\v\@(intToError|errorToInt|intToEnum|enumToInt|setAlignStack|frame|Frame|frameSize|bitReverse|Vector)>"
syn match zigBuiltinFn "\v\@(sin|cos|exp|exp2|log|log2|log10|fabs|floor|ceil|trunc|round)>"

"                                     12_34  (. but not ..)? (12_34)?     (exponent  12_34)?
syn match zigDecNumber display   "\v<\d%(_?\d)*%(\.\.@!)?%(\d%(_?\d)*)?%([eE][+-]?\d%(_?\d)*)?"
syn match zigHexNumber display "\v<0x\x%(_?\x)*%(\.\.@!)?%(\x%(_?\x)*)?%([pP][+-]?\d%(_?\d)*)?"
syn match zigOctNumber display "\v<0o\o%(_?\o)*"
syn match zigBinNumber display "\v<0b[01]%(_?[01])*"

syn match zigCharacterInvalid display contained /b\?'\zs[\n\r\t']\ze'/
syn match zigCharacterInvalidUnicode display contained /b'\zs[^[:cntrl:][:graph:][:alnum:][:space:]]\ze'/
syn match zigCharacter /b'\([^\\]\|\\\(.\|x\x\{2}\)\)'/ contains=zigEscape,zigEscapeError,zigCharacterInvalid,zigCharacterInvalidUnicode
syn match zigCharacter /'\([^\\]\|\\\(.\|x\x\{2}\|u\x\{4}\|U\x\{6}\)\)'/ contains=zigEscape,zigEscapeUnicode,zigEscapeError,zigCharacterInvalid

syn region zigBlock start="{" end="}" transparent fold

syn region zigCommentLine start="//" end="$" contains=zigTodo,@Spell
syn region zigCommentLineDoc start="//[/!]/\@!" end="$" contains=zigTodo,@Spell

" TODO: match only the first '\\' within the zigMultilineString as zigMultilineStringPrefix
syn match zigMultilineStringPrefix display contained /c\?\\\\/
syn region zigMultilineString start="c\?\\\\" end="$" contains=zigMultilineStringPrefix

syn keyword zigTodo contained TODO

syn match     zigEscapeError   display contained /\\./
syn match     zigEscape        display contained /\\\([nrt\\'"]\|x\x\{2}\)/
syn match     zigEscapeUnicode display contained /\\\(u\x\{4}\|U\x\{6}\)/
syn region    zigString      start=+c\?"+ skip=+\\\\\|\\"+ end=+"+ oneline contains=zigEscape,zigEscapeUnicode,zigEscapeError,@Spell

hi def link zigDecNumber zigNumber
hi def link zigHexNumber zigNumber
hi def link zigOctNumber zigNumber
hi def link zigBinNumber zigNumber

hi def link zigBuiltinFn Function
hi def link zigKeyword Keyword
hi def link zigType Type
hi def link zigCommentLine Comment
hi def link zigCommentLineDoc SpecialComment
hi def link zigTodo Todo
hi def link zigString String
hi def link zigMultilineString String
hi def link zigMultilineStringContent String
hi def link zigMultilineStringPrefix Comment
hi def link zigCharacterInvalid Error
hi def link zigCharacterInvalidUnicode zigCharacterInvalid
hi def link zigCharacter Character
hi def link zigEscape Special
hi def link zigEscapeUnicode zigEscape
hi def link zigEscapeError Error
hi def link zigBoolean Boolean
hi def link zigConstant Constant
hi def link zigNumber Number
hi def link zigArrowCharacter zigOperator
hi def link zigOperator Operator
hi def link zigStorage StorageClass
hi def link zigStructure Structure
hi def link zigStatement Statement
hi def link zigConditional Conditional
hi def link zigRepeat Repeat

endif
