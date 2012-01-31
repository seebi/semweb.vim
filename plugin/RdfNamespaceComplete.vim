"
" This file is part of the semweb vim bundle for working with RDF knowledge bases
"
" Author:    Sebastian Tramp <http://sebastian.tramp.name>
" Homepage:  http://github.com/seebi/semweb.vim
" Copyright: Copyright (C) 2012 Sebastian Tramp
" License:   http://opensource.org/licenses/gpl-3.0.html

" this function can be used to autocomplete a prefix
function! RdfNamespaceComplete(findstart, base)
    if a:findstart
        " locate the start of the word
        let line = getline('.')
        let start = col('.') - 1
        while start > 0 && line[start - 1] =~ '[^:,]'
            let start -= 1
        endwhile
        while start < col('.') && line[start] =~ '[:, ]'
            let start += 1
        endwhile
        return start
    else
        let results = []
        let query = substitute(a:base, '"', '', 'g')
        let query = substitute(query, '\s*<.*>\s*', '', 'g')
        let result = system("rdf ns " . query . " plain" )
        call add(results, result)
        return results
    endif
endfunction
autocmd FileType n3 set completefunc=RdfNamespaceComplete
