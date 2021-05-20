" Vim syntax file
" Language:     JavaScript
" Maintainer:   vim-deluge community
" URL:          https://github.com/pangloss/vim-deluge

if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'deluge'
endif

" Dollar sign is permitted anywhere in an identifier
if (v:version > 704 || v:version == 704 && has('patch1142')) && main_syntax == 'deluge'
  syntax iskeyword @,48-57,_,192-255,$
else
  setlocal iskeyword+=$
endif

syntax sync fromstart
" TODO: Figure out what type of casing I need
" syntax case ignore
syntax case match

syntax match   delugeNoise          /[:,;]/
syntax match   delugeDot            /\./ skipwhite skipempty nextgroup=jsObjectProp,jsFuncCall,jsPrototype,jsTaggedTemplate
syntax match   delugeObjectProp     contained /\<\K\k*/
syntax match   delugeFuncCall       /\<\K\k*\ze\s*(/
syntax match   delugeParensError    /[)}\]]/

" Program Keywords
syntax keyword delugeStorageClass   const var let skipwhite skipempty nextgroup=jsDestructuringBlock,jsDestructuringArray,jsVariableDef
syntax match   delugeVariableDef    contained /\<\K\k*/ skipwhite skipempty nextgroup=jsFlowDefinition
syntax keyword delugeOperatorKeyword delete instanceof typeof void new in of skipwhite skipempty nextgroup=@jsExpression
syntax match   delugeOperator       "[-!|&+<>=%/*~^]" skipwhite skipempty nextgroup=@jsExpression
syntax match   delugeOperator       /::/ skipwhite skipempty nextgroup=@jsExpression
syntax keyword delugeBooleanTrue    true
syntax keyword delugeBooleanFalse   false

" Modules
syntax keyword delugeImport                       import skipwhite skipempty nextgroup=jsModuleAsterisk,jsModuleKeyword,jsModuleGroup,jsFlowImportType
syntax keyword delugeExport                       export skipwhite skipempty nextgroup=@jsAll,jsModuleGroup,jsExportDefault,jsModuleAsterisk,jsModuleKeyword,jsFlowTypeStatement
syntax match   delugeModuleKeyword      contained /\<\K\k*/ skipwhite skipempty nextgroup=jsModuleAs,jsFrom,jsModuleComma
syntax keyword delugeExportDefault      contained default skipwhite skipempty nextgroup=@jsExpression
syntax keyword delugeExportDefaultGroup contained default skipwhite skipempty nextgroup=jsModuleAs,jsFrom,jsModuleComma
syntax match   delugeModuleAsterisk     contained /\*/ skipwhite skipempty nextgroup=jsModuleKeyword,jsModuleAs,jsFrom
syntax keyword delugeModuleAs           contained as skipwhite skipempty nextgroup=jsModuleKeyword,jsExportDefaultGroup
syntax keyword delugeFrom               contained from skipwhite skipempty nextgroup=jsString
syntax match   delugeModuleComma        contained /,/ skipwhite skipempty nextgroup=jsModuleKeyword,jsModuleAsterisk,jsModuleGroup,jsFlowTypeKeyword

" Strings, Templates, Numbers
syntax region  delugeString           start=+\z(["']\)+  skip=+\\\%(\z1\|$\)+  end=+\z1+ end=+$+  contains=jsSpecial extend
syntax region  delugeTemplateString   start=+`+  skip=+\\`+  end=+`+     contains=jsTemplateExpression,jsSpecial extend
syntax match   delugeTaggedTemplate   /\<\K\k*\ze`/ nextgroup=jsTemplateString
syntax match   delugeNumber           /\c\<\%(\d\+\%(e[+-]\=\d\+\)\=\|0b[01]\+\|0o\o\+\|0x\%(\x\|_\)\+\)\>/
syntax keyword delugeNumber           Infinity
syntax match   delugeFloat            /\c\<\%(\d\+\.\d\+\|\d\+\.\|\.\d\+\)\%(e[+-]\=\d\+\)\=\>/

" Regular Expressions
syntax match   delugeSpecial            contained "\v\\%(x\x\x|u%(\x{4}|\{\x{4,5}})|c\u|.)"
syntax region  delugeTemplateExpression contained matchgroup=jsTemplateBraces start=+${+ end=+}+ contains=@jsExpression keepend
syntax region  delugeRegexpCharClass    contained start=+\[+ skip=+\\.+ end=+\]+ contains=jsSpecial extend
syntax match   delugeRegexpBoundary     contained "\v\c[$^]|\\b"
syntax match   delugeRegexpBackRef      contained "\v\\[1-9]\d*"
syntax match   delugeRegexpQuantifier   contained "\v[^\\]%([?*+]|\{\d+%(,\d*)?})\??"lc=1
syntax match   delugeRegexpOr           contained "|"
syntax match   delugeRegexpMod          contained "\v\(\?[:=!>]"lc=1
syntax region  delugeRegexpGroup        contained start="[^\\]("lc=1 skip="\\.\|\[\(\\.\|[^]]\+\)\]" end=")" contains=jsRegexpCharClass,@jsRegexpSpecial keepend
syntax region  delugeRegexpString   start=+\%(\%(\<return\|\<typeof\|\_[^)\]'"[:blank:][:alnum:]_$]\)\s*\)\@<=/\ze[^*/]+ skip=+\\.\|\[[^]]\{1,}\]+ end=+/[gimyus]\{,6}+ contains=jsRegexpCharClass,jsRegexpGroup,@jsRegexpSpecial oneline keepend extend
syntax cluster delugeRegexpSpecial    contains=jsSpecial,jsRegexpBoundary,jsRegexpBackRef,jsRegexpQuantifier,jsRegexpOr,jsRegexpMod

" Objects
syntax match   delugeObjectShorthandProp contained /\<\k*\ze\s*/ skipwhite skipempty nextgroup=jsObjectSeparator
syntax match   delugeObjectKey         contained /\<\k*\ze\s*:/ contains=jsFunctionKey skipwhite skipempty nextgroup=jsObjectValue
syntax region  delugeObjectKeyString   contained start=+\z(["']\)+  skip=+\\\%(\z1\|$\)+  end=+\z1\|$+  contains=jsSpecial skipwhite skipempty nextgroup=jsObjectValue
syntax region  delugeObjectKeyComputed contained matchgroup=jsBrackets start=/\[/ end=/]/ contains=@jsExpression skipwhite skipempty nextgroup=jsObjectValue,jsFuncArgs extend
syntax match   delugeObjectSeparator   contained /,/
syntax region  delugeObjectValue       contained matchgroup=jsObjectColon start=/:/ end=/[,}]\@=/ contains=@jsExpression extend
syntax match   delugeObjectFuncName    contained /\<\K\k*\ze\_s*(/ skipwhite skipempty nextgroup=jsFuncArgs
syntax match   delugeFunctionKey       contained /\<\K\k*\ze\s*:\s*function\>/
syntax match   delugeObjectMethodType  contained /\<[gs]et\ze\s\+\K\k*/ skipwhite skipempty nextgroup=jsObjectFuncName
syntax region  delugeObjectStringKey   contained start=+\z(["']\)+  skip=+\\\%(\z1\|$\)+  end=+\z1\|$+  contains=jsSpecial extend skipwhite skipempty nextgroup=jsFuncArgs,jsObjectValue

exe 'syntax keyword delugeNull      null             '.(exists('g:deluge_conceal_null')      ? 'conceal cchar='.g:deluge_conceal_null       : '')
exe 'syntax keyword delugeReturn    return contained '.(exists('g:deluge_conceal_return')    ? 'conceal cchar='.g:deluge_conceal_return     : '').' skipwhite nextgroup=@jsExpression'
exe 'syntax keyword delugeUndefined undefined        '.(exists('g:deluge_conceal_undefined') ? 'conceal cchar='.g:deluge_conceal_undefined  : '')
exe 'syntax keyword delugeNan       NaN              '.(exists('g:deluge_conceal_NaN')       ? 'conceal cchar='.g:deluge_conceal_NaN        : '')
exe 'syntax keyword delugePrototype prototype        '.(exists('g:deluge_conceal_prototype') ? 'conceal cchar='.g:deluge_conceal_prototype  : '')
exe 'syntax keyword delugeThis      this             '.(exists('g:deluge_conceal_this')      ? 'conceal cchar='.g:deluge_conceal_this       : '')
exe 'syntax keyword delugeSuper     super  contained '.(exists('g:deluge_conceal_super')     ? 'conceal cchar='.g:deluge_conceal_super      : '')

" Statement Keywords
syntax match   delugeBlockLabel              /\<\K\k*\s*::\@!/    contains=jsNoise skipwhite skipempty nextgroup=jsBlock
syntax match   delugeBlockLabelKey contained /\<\K\k*\ze\s*\_[;]/
syntax keyword delugeStatement     contained with yield debugger
syntax keyword delugeStatement     contained break continue skipwhite skipempty nextgroup=jsBlockLabelKey
syntax keyword delugeConditional            if              skipwhite skipempty nextgroup=jsParenIfElse
syntax keyword delugeConditional            else            skipwhite skipempty nextgroup=jsCommentIfElse,jsIfElseBlock
syntax keyword delugeConditional            switch          skipwhite skipempty nextgroup=jsParenSwitch
syntax keyword delugeRepeat                 while for       skipwhite skipempty nextgroup=jsParenRepeat,jsForAwait
syntax keyword delugeDo                     do              skipwhite skipempty nextgroup=jsRepeatBlock
syntax region  delugeSwitchCase   contained matchgroup=jsLabel start=/\<\%(case\|default\)\>/ end=/:\@=/ contains=@jsExpression,jsLabel skipwhite skipempty nextgroup=jsSwitchColon keepend
syntax keyword delugeTry                    try             skipwhite skipempty nextgroup=jsTryCatchBlock
syntax keyword delugeFinally      contained finally         skipwhite skipempty nextgroup=jsFinallyBlock
syntax keyword delugeCatch        contained catch           skipwhite skipempty nextgroup=jsParenCatch,jsTryCatchBlock
syntax keyword delugeException              throw
syntax keyword delugeAsyncKeyword           async await
syntax match   delugeSwitchColon   contained /::\@!/        skipwhite skipempty nextgroup=jsSwitchBlock

" Keywords
syntax keyword delugeGlobalObjects     ArrayBuffer Array BigInt64Array BigUint64Array Float32Array Float64Array Int16Array Int32Array Int8Array Uint16Array Uint32Array Uint8Array Uint8ClampedArray Boolean Buffer Collator DataView Date DateTimeFormat Function Intl Iterator JSON Map Set WeakMap WeakSet Math Number NumberFormat Object ParallelArray Promise Proxy Reflect RegExp String Symbol Uint8ClampedArray WebAssembly console document fetch window
syntax keyword delugeGlobalNodeObjects  module exports global process __dirname __filename
syntax match   delugeGlobalNodeObjects  /\<require\>/ containedin=jsFuncCall
syntax keyword delugeExceptions         Error EvalError InternalError RangeError ReferenceError StopIteration SyntaxError TypeError URIError
syntax keyword delugeBuiltins           decodeURI decodeURIComponent encodeURI encodeURIComponent eval isFinite isNaN parseFloat parseInt uneval
" DISCUSS: How imporant is this, really? Perhaps it should be linked to an error because I assume the keywords are reserved?
syntax keyword delugeFutureKeys         abstract enum int short boolean interface byte long char final native synchronized float package throws goto private transient implements protected volatile double public

" DISCUSS: Should we really be matching stuff like this?
" DOM2 Objects
syntax keyword delugeGlobalObjects  DOMImplementation DocumentFragment Document Node NodeList NamedNodeMap CharacterData Attr Element Text Comment CDATASection DocumentType Notation Entity EntityReference ProcessingInstruction
syntax keyword delugeExceptions     DOMException

" DISCUSS: Should we really be matching stuff like this?
" DOM2 CONSTANT
syntax keyword delugeDomErrNo       INDEX_SIZE_ERR DOMSTRING_SIZE_ERR HIERARCHY_REQUEST_ERR WRONG_DOCUMENT_ERR INVALID_CHARACTER_ERR NO_DATA_ALLOWED_ERR NO_MODIFICATION_ALLOWED_ERR NOT_FOUND_ERR NOT_SUPPORTED_ERR INUSE_ATTRIBUTE_ERR INVALID_STATE_ERR SYNTAX_ERR INVALID_MODIFICATION_ERR NAMESPACE_ERR INVALID_ACCESS_ERR
syntax keyword delugeDomNodeConsts  ELEMENT_NODE ATTRIBUTE_NODE TEXT_NODE CDATA_SECTION_NODE ENTITY_REFERENCE_NODE ENTITY_NODE PROCESSING_INSTRUCTION_NODE COMMENT_NODE DOCUMENT_NODE DOCUMENT_TYPE_NODE DOCUMENT_FRAGMENT_NODE NOTATION_NODE

" DISCUSS: Should we really be special matching on these props?
" HTML events and internal variables
syntax keyword delugeHtmlEvents     onblur onclick oncontextmenu ondblclick onfocus onkeydown onkeypress onkeyup onmousedown onmousemove onmouseout onmouseover onmouseup onresize

" Code blocks
syntax region  delugeBracket                      matchgroup=jsBrackets            start=/\[/ end=/\]/ contains=@jsExpression,jsSpreadExpression extend fold
syntax region  delugeParen                        matchgroup=jsParens              start=/(/  end=/)/  contains=@jsExpression extend fold nextgroup=jsFlowDefinition
syntax region  delugeParenDecorator     contained matchgroup=jsParensDecorator     start=/(/  end=/)/  contains=@jsAll extend fold
syntax region  delugeParenIfElse        contained matchgroup=jsParensIfElse        start=/(/  end=/)/  contains=@jsAll skipwhite skipempty nextgroup=jsCommentIfElse,jsIfElseBlock,jsReturn extend fold
syntax region  delugeParenRepeat        contained matchgroup=jsParensRepeat        start=/(/  end=/)/  contains=@jsAll skipwhite skipempty nextgroup=jsCommentRepeat,jsRepeatBlock,jsReturn extend fold
syntax region  delugeParenSwitch        contained matchgroup=jsParensSwitch        start=/(/  end=/)/  contains=@jsAll skipwhite skipempty nextgroup=jsSwitchBlock extend fold
syntax region  delugeParenCatch         contained matchgroup=jsParensCatch         start=/(/  end=/)/  skipwhite skipempty nextgroup=jsTryCatchBlock extend fold
syntax region  delugeFuncArgs           contained matchgroup=jsFuncParens          start=/(/  end=/)/  contains=jsFuncArgCommas,jsComment,jsFuncArgExpression,jsDestructuringBlock,jsDestructuringArray,jsRestExpression,jsFlowArgumentDef skipwhite skipempty nextgroup=jsCommentFunction,jsFuncBlock,jsFlowReturn extend fold
syntax region  delugeClassBlock         contained matchgroup=jsClassBraces         start=/{/  end=/}/  contains=jsClassFuncName,jsClassMethodType,jsArrowFunction,jsArrowFuncArgs,jsComment,jsGenerator,jsDecorator,jsClassProperty,jsClassPropertyComputed,jsClassStringKey,jsAsyncKeyword,jsNoise extend fold
syntax region  delugeFuncBlock          contained matchgroup=jsFuncBraces          start=/{/  end=/}/  contains=@jsAll,jsBlock extend fold
syntax region  delugeIfElseBlock        contained matchgroup=jsIfElseBraces        start=/{/  end=/}/  contains=@jsAll,jsBlock extend fold
syntax region  delugeTryCatchBlock      contained matchgroup=jsTryCatchBraces      start=/{/  end=/}/  contains=@jsAll,jsBlock skipwhite skipempty nextgroup=jsCatch,jsFinally extend fold
syntax region  delugeFinallyBlock       contained matchgroup=jsFinallyBraces       start=/{/  end=/}/  contains=@jsAll,jsBlock extend fold
syntax region  delugeSwitchBlock        contained matchgroup=jsSwitchBraces        start=/{/  end=/}/  contains=@jsAll,jsBlock,jsSwitchCase extend fold
syntax region  delugeRepeatBlock        contained matchgroup=jsRepeatBraces        start=/{/  end=/}/  contains=@jsAll,jsBlock extend fold
syntax region  delugeDestructuringBlock contained matchgroup=jsDestructuringBraces start=/{/  end=/}/  contains=jsDestructuringProperty,jsDestructuringAssignment,jsDestructuringNoise,jsDestructuringPropertyComputed,jsSpreadExpression,jsComment nextgroup=jsFlowDefinition extend fold
syntax region  delugeDestructuringArray contained matchgroup=jsDestructuringBraces start=/\[/ end=/\]/ contains=jsDestructuringPropertyValue,jsDestructuringNoise,jsDestructuringProperty,jsSpreadExpression,jsDestructuringBlock,jsDestructuringArray,jsComment nextgroup=jsFlowDefinition extend fold
syntax region  delugeObject             contained matchgroup=jsObjectBraces        start=/{/  end=/}/  contains=jsObjectKey,jsObjectKeyString,jsObjectKeyComputed,jsObjectShorthandProp,jsObjectSeparator,jsObjectFuncName,jsObjectMethodType,jsGenerator,jsComment,jsObjectStringKey,jsSpreadExpression,jsDecorator,jsAsyncKeyword,jsTemplateString extend fold
syntax region  delugeBlock                        matchgroup=jsBraces              start=/{/  end=/}/  contains=@jsAll,jsSpreadExpression extend fold
syntax region  delugeModuleGroup        contained matchgroup=jsModuleBraces        start=/{/ end=/}/   contains=jsModuleKeyword,jsModuleComma,jsModuleAs,jsComment,jsFlowTypeKeyword skipwhite skipempty nextgroup=jsFrom fold
syntax region  delugeSpreadExpression   contained matchgroup=jsSpreadOperator      start=/\.\.\./ end=/[,}\]]\@=/ contains=@jsExpression
syntax region  delugeRestExpression     contained matchgroup=jsRestOperator        start=/\.\.\./ end=/[,)]\@=/
syntax region  delugeTernaryIf                    matchgroup=jsTernaryIfOperator   start=/?:\@!/  end=/\%(:\|}\@=\)/  contains=@jsExpression extend skipwhite skipempty nextgroup=@jsExpression
" These must occur here or they will be override by delugeTernaryIf
syntax match   delugeOperator           /?\.\ze\_D/
syntax match   delugeOperator           /??/ skipwhite skipempty nextgroup=@jsExpression

syntax match   delugeGenerator            contained /\*/ skipwhite skipempty nextgroup=jsFuncName,jsFuncArgs,jsFlowFunctionGroup
syntax match   delugeFuncName             contained /\<\K\k*/ skipwhite skipempty nextgroup=jsFuncArgs,jsFlowFunctionGroup
syntax region  delugeFuncArgExpression    contained matchgroup=jsFuncArgOperator start=/=/ end=/[,)]\@=/ contains=@jsExpression extend
syntax match   delugeFuncArgCommas        contained ','
syntax keyword delugeArguments            contained arguments
syntax keyword delugeForAwait             contained await skipwhite skipempty nextgroup=jsParenRepeat

" Matches a single keyword argument with no parens
syntax match   delugeArrowFuncArgs  /\<\K\k*\ze\s*=>/ skipwhite contains=jsFuncArgs skipwhite skipempty nextgroup=jsArrowFunction extend
" Matches a series of arguments surrounded in parens
syntax match   delugeArrowFuncArgs  /([^()]*)\ze\s*=>/ contains=jsFuncArgs skipempty skipwhite nextgroup=jsArrowFunction extend

exe 'syntax match delugeFunction /\<function\>/      skipwhite skipempty nextgroup=jsGenerator,jsFuncName,jsFuncArgs,jsFlowFunctionGroup skipwhite '.(exists('g:deluge_conceal_function') ? 'conceal cchar='.g:deluge_conceal_function : '')
exe 'syntax match delugeArrowFunction /=>/           skipwhite skipempty nextgroup=jsFuncBlock,jsCommentFunction '.(exists('g:deluge_conceal_arrow_function') ? 'conceal cchar='.g:deluge_conceal_arrow_function : '')
exe 'syntax match delugeArrowFunction /()\ze\s*=>/   skipwhite skipempty nextgroup=jsArrowFunction '.(exists('g:deluge_conceal_noarg_arrow_function') ? 'conceal cchar='.g:deluge_conceal_noarg_arrow_function : '')
exe 'syntax match delugeArrowFunction /_\ze\s*=>/    skipwhite skipempty nextgroup=jsArrowFunction '.(exists('g:deluge_conceal_underscore_arrow_function') ? 'conceal cchar='.g:deluge_conceal_underscore_arrow_function : '')

" Classes
syntax keyword delugeClassKeyword           contained class
syntax keyword delugeExtendsKeyword         contained extends skipwhite skipempty nextgroup=@jsExpression
syntax match   delugeClassNoise             contained /\./
syntax match   delugeClassFuncName          contained /\<\K\k*\ze\s*[(<]/ skipwhite skipempty nextgroup=jsFuncArgs,jsFlowClassFunctionGroup
syntax match   delugeClassMethodType        contained /\<\%([gs]et\|static\)\ze\s\+\K\k*/ skipwhite skipempty nextgroup=jsAsyncKeyword,jsClassFuncName,jsClassProperty
syntax region  delugeClassDefinition                  start=/\<class\>/ end=/\(\<extends\>\s\+\)\@<!{\@=/ contains=jsClassKeyword,jsExtendsKeyword,jsClassNoise,@jsExpression,jsFlowClassGroup skipwhite skipempty nextgroup=jsCommentClass,jsClassBlock,jsFlowClassGroup
syntax match   delugeClassProperty          contained /\<\K\k*\ze\s*[=;]/ skipwhite skipempty nextgroup=jsClassValue,jsFlowClassDef
syntax region  delugeClassValue             contained start=/=/ end=/\_[;}]\@=/ contains=@jsExpression
syntax region  delugeClassPropertyComputed  contained matchgroup=jsBrackets start=/\[/ end=/]/ contains=@jsExpression skipwhite skipempty nextgroup=jsFuncArgs,jsClassValue extend
syntax region  delugeClassStringKey         contained start=+\z(["']\)+  skip=+\\\%(\z1\|$\)+  end=+\z1\|$+  contains=jsSpecial extend skipwhite skipempty nextgroup=jsFuncArgs

" Destructuring
syntax match   delugeDestructuringPropertyValue     contained /\k\+/
syntax match   delugeDestructuringProperty          contained /\k\+\ze\s*=/ skipwhite skipempty nextgroup=jsDestructuringValue
syntax match   delugeDestructuringAssignment        contained /\k\+\ze\s*:/ skipwhite skipempty nextgroup=jsDestructuringValueAssignment
syntax region  delugeDestructuringValue             contained start=/=/ end=/[,}\]]\@=/ contains=@jsExpression extend
syntax region  delugeDestructuringValueAssignment   contained start=/:/ end=/[,}=]\@=/ contains=jsDestructuringPropertyValue,jsDestructuringBlock,jsNoise,jsDestructuringNoise skipwhite skipempty nextgroup=jsDestructuringValue extend
syntax match   delugeDestructuringNoise             contained /[,[\]]/
syntax region  delugeDestructuringPropertyComputed  contained matchgroup=jsDestructuringBraces start=/\[/ end=/]/ contains=@jsExpression skipwhite skipempty nextgroup=jsDestructuringValue,jsDestructuringValueAssignment,jsDestructuringNoise extend fold

" Comments
syntax keyword delugeCommentTodo    contained TODO FIXME XXX TBD NOTE
syntax region  delugeComment        start=+//+ end=/$/ contains=jsCommentTodo,@Spell extend keepend
syntax region  delugeComment        start=+/\*+  end=+\*/+ contains=jsCommentTodo,@Spell fold extend keepend
syntax region  delugeEnvComment     start=/\%^#!/ end=/$/ display

" Specialized Comments - These are special comment regexes that are used in
" odd places that maintain the proper nextgroup functionality. It sucks we
" can't make delugeComment a skippable type of group for nextgroup
syntax region  delugeCommentFunction    contained start=+//+ end=/$/    contains=jsCommentTodo,@Spell skipwhite skipempty nextgroup=jsFuncBlock,jsFlowReturn extend keepend
syntax region  delugeCommentFunction    contained start=+/\*+ end=+\*/+ contains=jsCommentTodo,@Spell skipwhite skipempty nextgroup=jsFuncBlock,jsFlowReturn fold extend keepend
syntax region  delugeCommentClass       contained start=+//+ end=/$/    contains=jsCommentTodo,@Spell skipwhite skipempty nextgroup=jsClassBlock,jsFlowClassGroup extend keepend
syntax region  delugeCommentClass       contained start=+/\*+ end=+\*/+ contains=jsCommentTodo,@Spell skipwhite skipempty nextgroup=jsClassBlock,jsFlowClassGroup fold extend keepend
syntax region  delugeCommentIfElse      contained start=+//+ end=/$/    contains=jsCommentTodo,@Spell skipwhite skipempty nextgroup=jsIfElseBlock extend keepend
syntax region  delugeCommentIfElse      contained start=+/\*+ end=+\*/+ contains=jsCommentTodo,@Spell skipwhite skipempty nextgroup=jsIfElseBlock fold extend keepend
syntax region  delugeCommentRepeat      contained start=+//+ end=/$/    contains=jsCommentTodo,@Spell skipwhite skipempty nextgroup=jsRepeatBlock extend keepend
syntax region  delugeCommentRepeat      contained start=+/\*+ end=+\*/+ contains=jsCommentTodo,@Spell skipwhite skipempty nextgroup=jsRepeatBlock fold extend keepend

" Decorators
syntax match   delugeDecorator                    /^\s*@/ nextgroup=jsDecoratorFunction
syntax match   delugeDecoratorFunction  contained /\h[a-zA-Z0-9_.]*/ nextgroup=jsParenDecorator

if exists("deluge_plugin_delugedoc")
  runtime extras/delugedoc.vim
  " NGDoc requires JSDoc
  if exists("deluge_plugin_ngdoc")
    runtime extras/ngdoc.vim
  endif
endif

if exists("deluge_plugin_flow")
  runtime extras/flow.vim
endif

syntax cluster delugeExpression  contains=jsBracket,jsParen,jsObject,jsTernaryIf,jsTaggedTemplate,jsTemplateString,jsString,jsRegexpString,jsNumber,jsFloat,jsOperator,jsOperatorKeyword,jsBooleanTrue,jsBooleanFalse,jsNull,jsFunction,jsArrowFunction,jsGlobalObjects,jsExceptions,jsFutureKeys,jsDomErrNo,jsDomNodeConsts,jsHtmlEvents,jsFuncCall,jsUndefined,jsNan,jsPrototype,jsBuiltins,jsNoise,jsClassDefinition,jsArrowFunction,jsArrowFuncArgs,jsParensError,jsComment,jsArguments,jsThis,jsSuper,jsDo,jsForAwait,jsAsyncKeyword,jsStatement,jsDot
syntax cluster delugeAll         contains=@jsExpression,jsStorageClass,jsConditional,jsRepeat,jsReturn,jsException,jsTry,jsNoise,jsBlockLabel

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_deluge_syn_inits")
  if version < 508
    let did_deluge_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
  HiLink delugeComment              Comment
  HiLink delugeEnvComment           PreProc
  HiLink delugeParensIfElse         jsParens
  HiLink delugeParensRepeat         jsParens
  HiLink delugeParensSwitch         jsParens
  HiLink delugeParensCatch          jsParens
  HiLink delugeCommentTodo          Todo
  HiLink delugeString               String
  HiLink delugeObjectKeyString      String
  HiLink delugeTemplateString       String
  HiLink delugeObjectStringKey      String
  HiLink delugeClassStringKey       String
  HiLink delugeTaggedTemplate       StorageClass
  HiLink delugeTernaryIfOperator    Operator
  HiLink delugeRegexpString         String
  HiLink delugeRegexpBoundary       SpecialChar
  HiLink delugeRegexpQuantifier     SpecialChar
  HiLink delugeRegexpOr             Conditional
  HiLink delugeRegexpMod            SpecialChar
  HiLink delugeRegexpBackRef        SpecialChar
  HiLink delugeRegexpGroup          jsRegexpString
  HiLink delugeRegexpCharClass      Character
  HiLink delugeCharacter            Character
  HiLink delugePrototype            Special
  HiLink delugeConditional          Conditional
  HiLink delugeBranch               Conditional
  HiLink delugeLabel                Label
  HiLink delugeReturn               Statement
  HiLink delugeRepeat               Repeat
  HiLink delugeDo                   Repeat
  HiLink delugeStatement            Statement
  HiLink delugeException            Exception
  HiLink delugeTry                  Exception
  HiLink delugeFinally              Exception
  HiLink delugeCatch                Exception
  HiLink delugeAsyncKeyword         Keyword
  HiLink delugeForAwait             Keyword
  HiLink delugeArrowFunction        Type
  HiLink delugeFunction             Type
  HiLink delugeGenerator            jsFunction
  HiLink delugeArrowFuncArgs        jsFuncArgs
  HiLink delugeFuncName             Function
  HiLink delugeFuncCall             Function
  HiLink delugeClassFuncName        jsFuncName
  HiLink delugeObjectFuncName       Function
  HiLink delugeArguments            Special
  HiLink delugeError                Error
  HiLink delugeParensError          Error
  HiLink delugeOperatorKeyword      jsOperator
  HiLink delugeOperator             Operator
  HiLink delugeOf                   Operator
  HiLink delugeStorageClass         StorageClass
  HiLink delugeClassKeyword         Keyword
  HiLink delugeExtendsKeyword       Keyword
  HiLink delugeThis                 Special
  HiLink delugeSuper                Constant
  HiLink delugeNan                  Number
  HiLink delugeNull                 Type
  HiLink delugeUndefined            Type
  HiLink delugeNumber               Number
  HiLink delugeFloat                Float
  HiLink delugeBooleanTrue          Boolean
  HiLink delugeBooleanFalse         Boolean
  HiLink delugeObjectColon          jsNoise
  HiLink delugeNoise                Noise
  HiLink delugeDot                  Noise
  HiLink delugeBrackets             Noise
  HiLink delugeParens               Noise
  HiLink delugeBraces               Noise
  HiLink delugeFuncBraces           Noise
  HiLink delugeFuncParens           Noise
  HiLink delugeClassBraces          Noise
  HiLink delugeClassNoise           Noise
  HiLink delugeIfElseBraces         Noise
  HiLink delugeTryCatchBraces       Noise
  HiLink delugeModuleBraces         Noise
  HiLink delugeObjectBraces         Noise
  HiLink delugeObjectSeparator      Noise
  HiLink delugeFinallyBraces        Noise
  HiLink delugeRepeatBraces         Noise
  HiLink delugeSwitchBraces         Noise
  HiLink delugeSpecial              Special
  HiLink delugeTemplateBraces       Noise
  HiLink delugeGlobalObjects        Constant
  HiLink delugeGlobalNodeObjects    Constant
  HiLink delugeExceptions           Constant
  HiLink delugeBuiltins             Constant
  HiLink delugeImport               Include
  HiLink delugeExport               Include
  HiLink delugeExportDefault        StorageClass
  HiLink delugeExportDefaultGroup   jsExportDefault
  HiLink delugeModuleAs             Include
  HiLink delugeModuleComma          jsNoise
  HiLink delugeModuleAsterisk       Noise
  HiLink delugeFrom                 Include
  HiLink delugeDecorator            Special
  HiLink delugeDecoratorFunction    Function
  HiLink delugeParensDecorator      jsParens
  HiLink delugeFuncArgOperator      jsFuncArgs
  HiLink delugeClassProperty        jsObjectKey
  HiLink delugeObjectShorthandProp  jsObjectKey
  HiLink delugeSpreadOperator       Operator
  HiLink delugeRestOperator         Operator
  HiLink delugeRestExpression       jsFuncArgs
  HiLink delugeSwitchColon          Noise
  HiLink delugeClassMethodType      Type
  HiLink delugeObjectMethodType     Type
  HiLink delugeClassDefinition      jsFuncName
  HiLink delugeBlockLabel           Identifier
  HiLink delugeBlockLabelKey        jsBlockLabel

  HiLink delugeDestructuringBraces     Noise
  HiLink delugeDestructuringProperty   jsFuncArgs
  HiLink delugeDestructuringAssignment jsObjectKey
  HiLink delugeDestructuringNoise      Noise

  HiLink delugeCommentFunction      jsComment
  HiLink delugeCommentClass         jsComment
  HiLink delugeCommentIfElse        jsComment
  HiLink delugeCommentRepeat        jsComment

  HiLink delugeDomErrNo             Constant
  HiLink delugeDomNodeConsts        Constant
  HiLink delugeDomElemAttrs         Label
  HiLink delugeDomElemFuncs         PreProc

  HiLink delugeHtmlEvents           Special
  HiLink delugeHtmlElemAttrs        Label
  HiLink delugeHtmlElemFuncs        PreProc

  HiLink delugeCssStyles            Label

  delcommand HiLink
endif

" Define the htmlJavaScript for HTML syntax html.vim
syntax cluster  htmlJavaScript       contains=@delugeAll,jsImport,jsExport
syntax cluster  javaScriptExpression contains=@delugeAll

" Vim's default html.vim highlights all deluge as 'Special'
hi! def link javaScript              NONE

let b:current_syntax = "deluge"
if main_syntax == 'deluge'
  unlet main_syntax
endif
