
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
