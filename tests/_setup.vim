call vimtest#AddDependency('vim-ingo-library')
"call vimtest#AddDependency('vim-CompleteHelper')

runtime plugin/SameFiletypeComplete.vim

set completefunc=SameFiletypeComplete#SameFiletypeComplete
edit +setf\ java Complete.java
split +setf\ cpp Complete.cpp
