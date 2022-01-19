SAME FILETYPE COMPLETE
===============================================================================
_by Ingo Karkat_

DESCRIPTION
------------------------------------------------------------------------------

When editing multiple projects (e.g. Python and Java) concurrently, or even
when different types of files (like C source code, its Makefile, and the
corresponding HTML documentation) are open in Vim, the general insert-mode
completion i\_CTRL-N becomes less useful. It searches for keywords in open
windows, listed buffers, and other sources as defined by the 'complete'
setting; there's no way to restrict the sources to consider only buffers that
have the same filetype as the current buffer, so a lot of unrelated cruft
clutters the list of completion matches.

This plugin offers an alternative completion that works like the general one,
but lists completion candidates only from buffers that have the same
'filetype' as the current buffer. When you're editing a Python file, you'll
only get matches from other open Python files. Switch to the Makefile and all
those inapplicable Python keywords won't be offered there.

### SOURCE

- [This completion type was motivated by this Stack Overflow question:](http://stackoverflow.com/questions/12610516/can-vims-keyword-completion-be-limited-to-only-same-filetype)

### SEE ALSO

- Check out the CompleteHelper.vim plugin page ([vimscript #3914](http://www.vim.org/scripts/script.php?script_id=3914)) for a full
  list of insert mode completions powered by it.

USAGE
------------------------------------------------------------------------------

    In insert mode, invoke the completion via CTRL-X =
    You can then search forward and backward via CTRL-N / CTRL-P, as usual.

    CTRL-X =                Find matches for words that start with the
                            keyword in front of the cursor, looking only into
                            buffers with the same 'filetype'.
                            Further use of CTRL-X = will copy the words following
                            the previous expansion.

INSTALLATION
------------------------------------------------------------------------------

The code is hosted in a Git repo at
    https://github.com/inkarkat/vim-SameFiletypeComplete
You can use your favorite plugin manager, or "git clone" into a directory used
for Vim packages. Releases are on the "stable" branch, the latest unstable
development snapshot on "master".

This script is also packaged as a vimball. If you have the "gunzip"
decompressor in your PATH, simply edit the \*.vmb.gz package in Vim; otherwise,
decompress the archive first, e.g. using WinZip. Inside Vim, install by
sourcing the vimball or via the :UseVimball command.

    vim SameFiletypeComplete*.vmb.gz
    :so %

To uninstall, use the :RmVimball command.

### DEPENDENCIES

- Requires Vim 7.0 or higher.
- Requires the ingo-library.vim plugin ([vimscript #4433](http://www.vim.org/scripts/script.php?script_id=4433)), version 1.010 or
  higher.
- Requires the CompleteHelper.vim plugin ([vimscript #3914](http://www.vim.org/scripts/script.php?script_id=3914)), version 1.40 or
  higher.

CONFIGURATION
------------------------------------------------------------------------------

For a permanent configuration, put the following commands into your vimrc:

By default, the 'complete' option controls which buffers will be scanned for
completion candidates. You can override that either for the entire plugin, or
only for particular buffers; see CompleteHelper\_complete for supported
values.

    let g:SameFiletypeComplete_complete = '.,w,b,u'

If you want to use a different mapping, map your keys to the
&lt;Plug&gt;(SameFiletypeComplete) mapping target _before_ sourcing the script (e.g.
in your vimrc):

    imap <C-x>= <Plug>(SameFiletypeComplete)

TODO
------------------------------------------------------------------------------

- How to handle compound filetypes (e.g. "c.doxygen")? Right now, the filetype
  must match exactly.

### IDEAS

- Allow multiple filetypes to be searched via a buffer-local
  b:SameFiletypeComplete\_Filetypes variable, e.g. to include "java" in "jsp".

### CONTRIBUTING

Report any bugs, send patches, or suggest features via the issue tracker at
https://github.com/inkarkat/vim-SameFiletypeComplete/issues or email (address
below).

HISTORY
------------------------------------------------------------------------------

##### 1.01    RELEASEME
- Make repeat across lines work.

__You need to update to CompleteHelper.vim
  ([vimscript #3914](http://www.vim.org/scripts/script.php?script_id=3914)) version 1.40!__
- Remove default g:SameFiletypeComplete\_complete configuration and default to
  'complete' option value instead.

##### 1.00    27-Sep-2012
- First published version.

------------------------------------------------------------------------------
Copyright: (C) 2012-2022 Ingo Karkat -
The [VIM LICENSE](http://vimdoc.sourceforge.net/htmldoc/uganda.html#license) applies to this plugin.

Maintainer:     Ingo Karkat &lt;ingo@karkat.de&gt;
