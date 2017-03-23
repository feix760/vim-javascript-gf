
if exists('javascript#loaded')
    finish
endif
let javascript#loaded = 1

fun! s:WrapString(str)
  return ' "'.a:str.'" '
endfun

let javascript#js_path = substitute(expand('<sfile>:p:h'), '[/\\]\?[^/\\]*$', '', '').'/javascript/find.js'

fun! javascript#gf_find(name)
  let cmd = 'node'.s:WrapString(g:javascript#js_path).s:WrapString(getcwd()).s:WrapString(expand('%:p')).s:WrapString(a:name)
  let path = substitute(system(cmd), '^[ \n]\+\|[ \n]\+$', '', 'g')
  if path != ''
    return path
  endif
endfun

au BufEnter *.js call javascript#gf_init()

fun! javascript#gf_init()
  let &l:include = '\<require(\(["'']\)\zs[^\1]\+\ze\1)\>'
  let &l:includeexpr = "javascript#gf_find(v:fname)"
endfun
