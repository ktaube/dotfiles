# My vim dotfiles

## Cheatsheet

### [eunuch.vim](https://github.com/tpope/vim-eunuch)

* `:Remove`: Delete a buffer and the file on disk simultaneously.
* `:Unlink`: Like `:Remove`, but keeps the now empty buffer.
* `:Move`: Rename a buffer and the file on disk simultaneously.
* `:Rename`: Like `:Move`, but relative to the current file's containing directory.
* `:Chmod`: Change the permissions of the current file.
* `:Mkdir`: Create a directory, defaulting to the parent of the current file.
* `:Find`: Run `find` and load the results into the quickfix list.
* `:Locate`: Run `locate` and load the results into the quickfix list.
* `:Wall`: Write every open window.  Handy for kicking off tools like [guard][].
* `:SudoWrite`: Write a privileged file with `sudo`.
* `:SudoEdit`: Edit a privileged file with `sudo`.
* File type detection for `sudo -e` is based on original file name.
* New files created with a shebang line are automatically made executable.
* New init scripts are automatically prepopulated with `/etc/init.d/skeleton`.

### [fugitive.vim](https://github.com/tpope/vim-fugitive)


    :Gstatus                Bring up the output of git-status in the preview
                            window.  The following maps, which work on the cursor
                            line file where sensible, are provided:

                            g?    show this help
                            <C-N> next file
                            <C-P> previous file
                            <CR>  |:Gedit|
                            -     |:Git| add
                            -     |:Git| reset (staged files)
                            cA    |:Gcommit| --amend --reuse-message=HEAD
                            ca    |:Gcommit| --amend
                            cc    |:Gcommit|
                            cva   |:Gcommit| --amend --verbose
                            cvc   |:Gcommit| --verbose
                            D     |:Gdiff|
                            ds    |:Gsdiff|
                            dp    |:Git!| diff (p for patch; use :Gw to apply)
                            dp    |:Git| add --intent-to-add (untracked files)
                            dv    |:Gvdiff|
                            O     |:Gtabedit|
                            o     |:Gsplit|
                            p     |:Git| add --patch
                            p     |:Git| reset --patch (staged files)
                            q     close status
                            r     reload status
                            S     |:Gvsplit|

    :Gcommit [args]         A wrapper around git-commit.  If there is nothing
                            to commit, |:Gstatus| is called instead.  Unless the
                            arguments given would skip the invocation of an editor
                            (e.g., -m), a split window will be used to obtain a
                            commit message, or a new tab if -v is given.  Write
                            and close that window (:wq or |:Gwrite|) to finish the
                            commit.  Unlike when running the actual git-commit
                            command, it is possible (but unadvisable) to alter the
                            index with commands like git-add and git-reset while a
                            commit message is pending.


    :Gdiff [revision]       Perform a |vimdiff| against the current file in the
                            given revision.  With no argument, the version in the
                            index is used (which means a three-way diff during a
                            merge conflict, making it a git-mergetool
                            alternative).  The newer of the two files is placed
                            to the right or bottom, depending on 'diffopt' and
                            the width of the window relative to 'textwidth'.  Use
                            |do| and |dp| and write to the index file to simulate
                            "git add --patch".

    :Gblame [flags]         Run git-blame on the file and open the results in a
                            scroll bound vertical split.  You can give any of
                            ltfnsewMC as flags and they will be passed along to
                            git-blame.  The following maps, which work on the
                            cursor line commit where sensible, are provided:

                            g?    show this help
                            A     resize to end of author column
                            C     resize to end of commit column
                            D     resize to end of date/time column
                            q     close blame and return to blamed window
                            gq    q, then |:Gedit| to return to work tree version
                            <CR>  q, then open commit
                            o     open commit in horizontal split
                            O     open commit in new tab
                            -     reblame at commit
                            ~     reblame at [count]th first grandparent
                            P     reblame at [count]th parent (like HEAD^[count])


### [surround.vim]('http://github.com/tpope/vim-surround')

    Old text                  Command     New text ~
    "Hello *world!"           ds"         Hello world!
    [123+4*56]/2              cs])        (123+456)/2
    "Look ma, I'm *HTML!"     cs"<q>      <q>Look ma, I'm HTML!</q>
    if *x>3 {                 ysW(        if ( x>3 ) {
    my $str = *whee!;         vllllS'     my $str = 'whee!';

command | effect
--------|-------
ds      | delete surroundings. The next character given determines the target to delete.
cs      | change surrounding. It takes two arguments, a target like with `ds`, and a replacement.
ys      | takes a valid Vim motion or text object as the first object, and wraps it using the second argument as with `cs`.

Punctuation marks: `(, ), {, }, [, ], <, and >`

Letter | Mark
-------|-----
b      | )
B      | }
r      | ]
a      | >

