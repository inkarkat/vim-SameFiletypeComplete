" Test completion from the same filetype and also the local buffer.

new
call SameFiletypeComplete#Expr()    " Initialize script variables.

runtime tests/helpers/completetest.vim
call vimtest#StartTap()
call vimtap#Plan(1)

split +setf\ java scratch
call setline(1, 'CompleteHere')
call SameFiletypeComplete#Expr()    " Initialize script variables.
call IsMatchesInIsolatedLine('Complete', ['CompleteHere', 'CompleteJava'], 'matches for Complete in Java buffers')

call vimtest#Quit()
