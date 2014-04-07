" Test repeat of same filetype completion.

source ../helpers/insert.vim

new +setf\ cpp
call SetCompletion("\<C-x>=")

call InsertRepeat('Comple', 0, 0)

call InsertRepeat('{ voi', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
call InsertRepeat('voi', 0, 0, 0, 0, 0, 0, 0)
call InsertRepeat('voi', 0, 0, 0, 0, 0, 0)
call InsertRepeat('voi', 0, 0, 0, 0, 0)

call vimtest#SaveOut()
call vimtest#Quit()
