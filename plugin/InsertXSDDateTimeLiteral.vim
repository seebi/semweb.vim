"
" This file is part of the semweb vim bundle for working with RDF knowledge bases
"
" Author:    Sebastian Tramp <http://sebastian.tramp.name>
" Homepage:  http://github.com/seebi/semweb.vim
" Copyright: Copyright (C) 2012 Sebastian Tramp
" License:   http://opensource.org/licenses/gpl-3.0.html

function! InsertXSDDateTimeLiteral()
    " http://www.hccp.org/xsd-date.html
    read !echo -n `date -u  +\"\%Y-\%m-\%dT\%H:\%M:\%SZ\"\^\^xsd:dateTime`
endfunction
autocmd FileType n3 iabbrev <expr> xsdnow "\"" . strftime("%Y-%m-%dT%H:%M:%SZ") . "\"\^\^xsd:dateTime;"
