" Test completion from the same filetype.

new
call SameFiletypeComplete#Expr()    " Initialize script variables.

source ../helpers/completetest.vim
call vimtest#StartTap()
call vimtap#Plan(7)

call IsMatchesInIsolatedLine('Complete', [], 'no matches in untyped buffer')

set filetype=java
call SameFiletypeComplete#Expr()    " Initialize script variables.
call IsMatchesInIsolatedLine('Complete', ['CompleteJava'], 'match for Complete in Java buffer')
call IsMatchesInIsolatedLine('Serial', ['SerializedCollection', 'SerializedObject'], 'matches for Serial in Java buffer')

set filetype=cpp
call SameFiletypeComplete#Expr()    " Initialize script variables.
call IsMatchesInIsolatedLine('Complete', ['CompleteCpp'], 'match for Complete in C++ buffer')
call IsMatchesInIsolatedLine('Serial', ['SerializedPointer', 'SerializedArray'], 'matches for Serial in C++ buffer')

set filetype=python
call SameFiletypeComplete#Expr()    " Initialize script variables.
call IsMatchesInIsolatedLine('Complete', [], 'no matches for Complete in Python buffer')
call IsMatchesInIsolatedLine('Serial', [], 'no matches for Serial in Python buffer')

call vimtest#Quit()
