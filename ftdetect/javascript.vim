
if exists('loaded_node_gf')
    finish
endif
let loaded_node_gf = 1

let node#suffixesadd = [".js", ".json", ".es", ".jsx"]
setlocal path-=/usr/include
let &l:suffixesadd .= "," . join(g:node#suffixesadd, ",")

let &l:include = '\<require(\(["'']\)\zs[^\1]\+\ze\1)\>'
let &l:includeexpr = "javascript#find(v:fname)"

let b:path = expand('<sfile>:p:h')
let b:findJsFile = substitute(b:path, '[/\\]\?[^/\\]*$', '', '').'/javascript/find.js'

fun! javascript#find(name)
  let cmd = 'node'.s:WrapString(b:findJsFile).s:WrapString(getcwd()).s:WrapString(expand('%:p')).s:WrapString(a:name)
  return substitute(system(cmd), '^[ \n]\+\|[ \n]\+$', '', 'g')
endfun

fun! s:WrapString(str)
  return ' "'.a:str.'" '
endfun
