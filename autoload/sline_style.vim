if exists('g:loaded_sline_style') | finish | endif
let g:loaded_sline_style = 1

let g:sline_style_list = ['pure', 'simple']

if !exists('g:sline_style_name')
  let g:sline_style_name = 'simple'
endif

function! s:style_pure()
  set laststatus =2
  set statusline =
endfunction

function! s:style_simple()
  set laststatus =2
  set statusline =%<%f%y\ #%n%m%r%h%w
  set statusline+=%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}
  set statusline+=%=\ (%v,%l)/%L%8P
endfunction



function! s:index()
  let i=0
  while (i < len(g:sline_style_list))
    if g:sline_style_name == g:sline_style_list[i]
      return i
    endif
    let i+=1
  endwhile
endfunction

function! sline_style#update()
  execute printf("call s:style_%s()", g:sline_style_name)
endfunction

function! sline_style#set(name)
  let g:sline_style_name = a:name
  call sline_style#update()
endfunction

function! sline_style#switch()
  let idx  = s:index()
  let n    = len(g:sline_style_list)
  let name = g:sline_style_list[ (idx+1) % n ]
  call sline_style#set(name)
endfunction

