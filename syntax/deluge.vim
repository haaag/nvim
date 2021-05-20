" Vim syntax file
" Language:	JavaScript
" Maintainer:	Claudio Fleiner <claudio@fleiner.com>
" Updaters:	Scott Shattuck (ss) <ss@technicalpursuit.com>
" URL:		http://www.fleiner.com/vim/syntax/deluge.vim
" Changes:	(ss) added keywords, reserved words, and other identifiers
"		(ss) repaired several quoting and grouping glitches
"		(ss) fixed regex parsing issue with multiple qualifiers [gi]
"		(ss) additional factoring of keywords, globals, and members
" Last Change:	2021 Mar 30
" 		2013 Jun 12: adjusted delugeRegexpString (Kevin Locke)
" 		2018 Apr 14: adjusted delugeRegexpString (LongJohnCoder)

" tuning parameters:
" unlet deluge_fold

if !exists("main_syntax")
  " quit when a syntax file was already loaded
  if exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'deluge'
elseif exists("b:current_syntax") && b:current_syntax == "deluge"
  finish
endif

let s:cpo_save = &cpo
set cpo&vim


syn keyword delugeCommentTodo      TODO FIXME XXX TBD contained
syn match   delugeLineComment      "\/\/.*" contains=@Spell,delugeCommentTodo
syn match   delugeCommentSkip      "^[ \t]*\*\($\|[ \t]\+\)"
syn region  delugeComment	       start="/\*"  end="\*/" contains=@Spell,delugeCommentTodo
syn match   delugeSpecial	       "\\\d\d\d\|\\."
syn region  delugeStringD	       start=+"+  skip=+\\\\\|\\"+  end=+"\|$+	contains=delugeSpecial,@htmlPreproc
syn region  delugeStringS	       start=+'+  skip=+\\\\\|\\'+  end=+'\|$+	contains=delugeSpecial,@htmlPreproc
syn region  delugeStringT	       start=+`+  skip=+\\\\\|\\`+  end=+`+	contains=delugeSpecial,delugeEmbed,@htmlPreproc
syn region  delugeSignature	       start=+\\b(void|String|List|Map|Boolean|Bigint|Decimal)\\b(?:\\s|\\t)*([a-zA-Z_][a-zA-Z0-9_]*)(?:\\s|\\t)*(\\()+  end=+(\\))+	contains=delugeSpecial,delugeEmbed,@htmlPreproc
syn region  delugeVariable             start=+([a-zA-Z_][a-zA-Z0-9_]*)(?:\\s|\\t)*(=)(?:\\s|\\t)*+ end=+(\\;)$+ contains=delugeSpecial,@htmlPreproc
syn match   delugeFunction	"\<function\>"
syn region  delugeFunctionFold	start="\<function\>.*[^};]$" end="^\z1}.*$" transparent fold keepend
syntax match   delugeFuncCall       /\<\K\k*\ze\s*(/

syn region  delugeEmbed	       start=+${+  end=+}+	contains=@delugeEmbededExpr

syn match   delugeSpecialCharacter "'\\.'"
syn match   delugeNumber	       "-\=\<\d\+L\=\>\|0[xX][0-9a-fA-F]\+\>"
syn match   delugeNumber	       "-\=\<\d\+\%(_\d\+\)*\>"
syn region  delugeRegexpString     start=+[,(=+]\s*/[^/*]+ms=e-1,me=e-1 skip=+\\\\\|\\/+ end=+/[gimuys]\{0,2\}\s*$+ end=+/[gimuys]\{0,2\}\s*[+;.,)\]}]+me=e-1 end=+/[gimuys]\{0,2\}\s\+\/+me=e-1 contains=@htmlPreproc,delugeComment oneline

syn keyword delugeConditional	if else switch
syn keyword delugeZoho	        zoho
syn keyword delugeRepeat	while for do in each is not where from limit between
syn keyword delugeBranch	break continue
syn keyword delugeOperator	info delete instanceof typeof
syn keyword delugeCurl          PUT GET DELETE POST
syn keyword delugeType		Array Boolean Date Function Number Object String RegExp
syn keyword delugeStatement	return with await
syn keyword delugeBoolean	true false
syn keyword delugeNull		null undefined
syn keyword delugeIdentifier	arguments this var let
syn keyword delugeLabel		case default
syn keyword delugeException	try catch finally throw
syn keyword delugeMessage	alert confirm prompt status
syn keyword delugeGlobal	self window top parent
syn keyword delugeMember	document event location
syn keyword delugeDeprecated	escape unescape
syn keyword delugeReserved	abstract boolean byte char class const debugger double enum export extends final float goto implements import int interface long native package private protected public short static super synchronized throws transient volatile async map Map get List sendmail invokeurl crm inventory

syn cluster  delugeEmbededExpr	contains=delugeBoolean,delugeNull,delugeIdentifier,delugeStringD,delugeStringS,delugeStringT,delugeVariable

if exists("deluge_fold")
    syn match	delugeFunction	"\<function\>"
    syn region	delugeFunctionFold	start="\<function\>.*[^};]$" end="^\z1}.*$" transparent fold keepend

    syn sync match delugeSync	grouphere delugeFunctionFold "\<function\>"
    syn sync match delugeSync	grouphere NONE "^}"

    setlocal foldmethod=syntax
    setlocal foldtext=getline(v:foldstart)
else
    syn keyword delugeFunction	function
    syn match	delugeBraces	   "[{}\[\]]"
    syn match	delugeParens	   "[()]"
endif

if main_syntax == "deluge"
  syn sync fromstart
  syn sync maxlines=100

  syn sync ccomment delugeComment
endif

" Define the default highlighting.
" Only when an item doesn't have highlighting yet
hi def link delugeComment		Comment
hi def link delugeLineComment		Comment
hi def link delugeCommentTodo		Todo
hi def link delugeVariable              Special
hi def link delugeSpecial		Special
hi def link delugeStringS		String
hi def link delugeStringD		String
hi def link delugeStringT		String
hi def link delugeCharacter		Character
hi def link delugeSpecialCharacter	delugeSpecial
hi def link delugeNumber		delugeValue
hi def link delugeConditional		Conditional
hi def link delugeZoho  		Conditional
hi def link delugeRepeat		Repeat
hi def link delugeBranch		Conditional
hi def link delugeOperator		Operator
hi def link delugeType			Type
hi def link delugeStatement		Statement
hi def link delugeFunction		Function
hi def link delugeBraces		Function
hi def link delugeError		        Error
hi def link javaScrParenError		delugeError
hi def link delugeNull			Keyword
hi def link delugeBoolean		Boolean
hi def link delugeRegexpString		String
hi def link delugeIdentifier		Identifier
hi def link delugeLabel		        Label
hi def link delugeException		Exception
hi def link delugeMessage		Keyword
hi def link delugeGlobal		Keyword
hi def link delugeMember		Keyword
hi def link delugeDeprecated		Exception
hi def link delugeReserved		Constant
hi def link delugeCurl                  Label
hi def link delugeDebug		        Debug
hi def link delugeConstant		Label
hi def link delugeEmbed		        Special
hi def link delugeFuncCall             Function




let b:current_syntax = "deluge"
if main_syntax == 'deluge'
  unlet main_syntax
endif
let &cpo = s:cpo_save
unlet s:cpo_save

" vim: ts=8
