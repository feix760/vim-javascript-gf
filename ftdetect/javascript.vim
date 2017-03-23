
if exists('loaded_node_gf')
    finish
endif
let loaded_node_gf = 1

let node#suffixesadd = [".js", ".json", ".es", ".jsx"]
setlocal path-=/usr/include
let &l:suffixesadd .= "," . join(g:node#suffixesadd, ",")

au BufEnter *.js call javascript#findinit()

fun! javascript#findinit()
  let &l:include = '\<require(\(["'']\)\zs[^\1]\+\ze\1)\>'
  let &l:includeexpr = "javascript#find(v:fname)"
endfun

let node_gf_js_path = substitute(expand('<sfile>:p:h'), '[/\\]\?[^/\\]*$', '', '').'/javascript/find.js'

fun! javascript#find(name)
  let cmd = 'node'.s:WrapString(g:node_gf_js_path).s:WrapString(getcwd()).s:WrapString(expand('%:p')).s:WrapString(a:name)
  let path = substitute(system(cmd), '^[ \n]\+\|[ \n]\+$', '', 'g')
  if path != ''
    return path
  endif
endfun

fun! s:WrapString(str)
  return ' "'.a:str.'" '
endfun
