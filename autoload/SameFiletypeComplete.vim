" SameFiletypeComplete.vim: Insert mode completion from buffers with the same filetype.
"
" DEPENDENCIES:
"   - CompleteHelper.vim autoload script
"   - Complete/Repeat.vim autoload script
"
" Copyright: (C) 2012-2014 Ingo Karkat
"   The VIM LICENSE applies to this script; see ':help copyright'.
"
" Maintainer:	Ingo Karkat <ingo@karkat.de>
"
" REVISION	DATE		REMARKS
"   1.01.002	07-Apr-2014	Make repeat across lines work.
"   1.00.001	27-Sep-2012	file creation
let s:save_cpo = &cpo
set cpo&vim

function! s:GetCompleteOption()
    return (exists('b:SameFiletypeComplete_complete') ? b:SameFiletypeComplete_complete : g:SameFiletypeComplete_complete)
endfunction

let s:filetype = ''
function! SameFiletypeComplete#FiletypePredicate( bufnr )
    return (getbufvar(a:bufnr, '&filetype') ==# s:filetype)
endfunction

let s:repeatCnt = 0
function! SameFiletypeComplete#SameFiletypeComplete( findstart, base )
    if s:repeatCnt
	if a:findstart
	    return col('.') - 1
	else
	    let l:matches = []

	    " Need to translate the embedded ^@ newline into the \n atom.
	    let l:previousCompleteExpr = substitute(escape(s:fullText, '\'), '\n', '\\n', 'g')

	    call CompleteHelper#FindMatches(l:matches,
	    \   '\V\<' . l:previousCompleteExpr . '\zs\%(\%(\k\@!\.\)\+\k\+\|\_s\+\%(\k\@!\.\)\*\k\+\|\_s\*\%(\k\@!\.\)\+\)',
	    \   {
	    \       'complete': s:GetCompleteOption(),
	    \       'bufferPredicate': function('SameFiletypeComplete#FiletypePredicate'),
	    \       'processor': function('CompleteHelper#Repeat#Processor')
	    \   }
	    \)
	    return l:matches
	endif
    endif

    if a:findstart
	" Locate the start of the keyword characters.
	let l:startCol = searchpos('\k*\%#', 'bn', line('.'))[1]
	if l:startCol == 0
	    let l:startCol = col('.')
	endif
	return l:startCol - 1 " Return byte index, not column.
    else
	" Find matches (starting with the optional a:base).
	let l:matches = []
	call CompleteHelper#FindMatches(l:matches, '\V\<' . escape(a:base, '\') . '\k\+', {'complete': s:GetCompleteOption(), 'bufferPredicate': function('SameFiletypeComplete#FiletypePredicate')})
	return l:matches
    endif
endfunction

function! SameFiletypeComplete#Expr()
    let s:filetype = &l:filetype " Base the predicate on the current buffer's filetype.

    set completefunc=SameFiletypeComplete#SameFiletypeComplete

    let s:repeatCnt = 0 " Important!
    let [s:repeatCnt, l:addedText, s:fullText] = CompleteHelper#Repeat#TestForRepeat()

    return "\<C-x>\<C-u>"
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
" vim: set ts=8 sts=4 sw=4 noexpandtab ff=unix fdm=syntax :
