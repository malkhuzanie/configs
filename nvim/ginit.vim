function! ChangeFontSize(delta) abort
  let l:repl = printf('\=eval(submatch(0)+%d)', a:delta)
  let &guifont = substitute(&guifont, '\d\+', l:repl, '')
endfunction
nnoremap <C-=> :call ChangeFontSize(1)<CR>
nnoremap <C--> :call ChangeFontSize(-1)<CR>
