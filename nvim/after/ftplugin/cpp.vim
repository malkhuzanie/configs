set cindent
set cinoptions=4
set equalprg=clang-format\ -style='file:/home/tomato/.clang-format'

autocmd BufWritePre * :normal magg=G`a
nnoremap <silent> <buffer> <F9> :call <SID>compile_run_cpp()<CR>

function! s:compile_run_cpp() abort
  let src_path = expand('%:p:~')
  let src_noext = expand('%:p:~:r')
  " The building flags
  let _flag = '-DLOCAL -Wall -g -Wextra -std=c++20 -lbsd -Wno-unused-variable -Wno-unused-but-set-variable' 

  if executable('g++')
    let prog = 'g++'
  elseif executable('g++')
    let prog = 'g++'
  else
    echoerr 'No C++ compiler found on the system!'
  endif
  call s:create_term_buf('h', 10)
  execute printf('term %s %s %s -o %s && %s', prog, _flag, src_path, src_noext, src_noext)
  startinsert
endfunction

function s:create_term_buf(_type, size) abort
  set splitbelow
  set splitright
  if a:_type ==# 'v'
    vnew
  else
    new
  endif
  execute 'resize ' . a:size
endfunction
