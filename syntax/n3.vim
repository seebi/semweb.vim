" Vim syntax file
" Language:     RDF Notation 3
" Version:      1.0
" SeeAlso:      <http://www.w3.org/DesignIssues/Notation3.html>
" Maintainer:   Niklas Lindstr&ouml;m <nlm@valtech.se>
" Updated:      2004-03-24

" TODO:
"   * grouping e.g. statements to ebable folding, error checking etc.
"   * string value specials
"   * "@"-prefix of verbs (?)


if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif


syn keyword n3Verb              a has is of
syn match   n3Separator         "[][;,)(}{.^!]"
"syn match   n3StatementTail     "\."
syn match   n3Declaration       "@keywords\|@prefix"
syn match   n3Quantifier        "@forAll\|@forSome"
syn match   n3LName             "\(:\?\)\@<=[a-zA-Z_][a-zA-Z0-9_]*"
syn match   n3Prefix            "\([a-zA-Z_][a-zA-Z0-9_]*\)\?:"
syn match   n3Comment           "#.*$" contains=n3Todo
syn keyword n3Todo              TODO FIXME XXX contained
syn match   n3Deprecated        "@this"

" URI:s, strings, numbers, variables
syn match n3Number              "[-+]\?[0-9]\+\(\.[0-9]\+\)\?\(e[-+]\?[0-9]\+\)\?" 
syn match n3Variable            "?[a-zA-Z_][a-zA-Z0-9_]*"
syn region n3URI                matchgroup=n3URI start=+<+ end=+>+ skip=+\\\\\|\\"+ contains=n3URITokens
" TODO: n3URITokens
syn region n3String             matchgroup=n3StringDelim start=+"+ end=+"+ skip=+\\\\\|\\"+ contains=n3Escape
" TODO: n3Escape

syn match   n3Verb              "<=\|=>\|="

" Lang notation
syn match n3Langcode  +\("\s*\)\@<=@[a-zA-Z0-9]\+\(-[a-zA-Z0-9]\+\)\?+

" Type notation
syn match n3Datatype +\("\s*\)\@<=^^+ 
" TODO: then follows: explicituri | qname

" XMLLiterals
if filereadable(expand("<sfile>:p:h")."/xml.vim")
 unlet! b:current_syntax
 syn include @n3XMLLiteral <sfile>:p:h/xml.vim
 syn region n3XMLLiteralRegion matchgroup=n3StringDelim start=+"""+ end=+"""+ contains=@n3XMLLiteral
endif


" Highlight Links

if version >= 508 || !exists("did_n3_syn_inits")
  if version <= 508
    let did_n3_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  " The default methods for highlighting.  Can be overridden later
  HiLink n3Verb                 keyword
  HiLink n3Quantifier           keyword
  HiLink n3Separator            Operator
  HiLink n3EndStatement         Special
  HiLink n3Declaration          PreCondit
  HiLink n3Prefix               Special
  HiLink n3LName                Normal
  HiLink n3Comment              Comment
  HiLink n3Todo                 Todo
  HiLink n3Deprecated           Error
  HiLink n3Number               Number
  HiLink n3Variable             Identifier
  HiLink n3URI                  Label
  HiLink n3String               String
  HiLink n3StringDelim          Constant
  HiLink n3Langcode             Type
  HiLink n3Datatype             Type
  HiLink n3XMLLiteralRegion     String

  delcommand HiLink
endif


let b:current_syntax = "n3"


" EOF
