PS1="\W>"

export SHELL=/bin/bash
export PATH=$HOME/bin:$PATH:$HOME/.local/bin
export EDITOR=emacs
export BROWSER=chromium
unset  MAIL
export TEXINPUTS=".:"

alias cp='cp -i' # Usage: cp $source $target ; Force interactive copy to avoid error.
alias mv='mv -i' # Usage: mv $source $target ; Force interactive move to avoid error.
rm() { # Usage: rm $files ; Removes files by moving them to the desktop trask.
  TRASH=$HOME/.local/share/Trash/files
  /bin/mv $* $TRASH
}
pushd() { # Usage: pushd $directory ; Silent pushd.
  command pushd "$@" > /dev/null
}
popd() { # Usage: ppopd : Silent popd.
  command popd > /dev/null
}
gitsync() { # Usage: gitsync $message ; Synchronizes with the current repository adding a commit message.
  needfor git
  if [ -z "$*" ] ; then m="minor modification" ; else m="$*" ; fi
  git pull -q ; git commit -q -a -m "$m" ; git push -q ; git status -s
}
alias c='$HOME/clean; clear' # Usage: c ; Cleans temporary files and clean the terminal screen.
alias s='xdg-open' # Usage: s $file ; Opens a file with the default application
m() { # Usage: m $target-or-file ; Makes a target file using the current or a parent makefile
  for d in "." ".." "../.." "../../.." "../../../.." 
  do if [ -f $d/makefile ]
    then if [ \( -z "$1" \) -o \( \! -z "`grep -e '^$1:' $d/makefile`" \) ]
      then make -s --no-print-directory -C $d $* ; exit $?
  fi ; fi ; done
  echo "make.sh: *** No rule to make target '$1'.  Stop." ; exit -1
  ## - Only makefile file is considered here (allowing one to skip the command using a Makefile file).
  ## - The make command is used without echo
}
nospace() { # Usage: nospace $filename ; Removes blanks and hiding-dot in file name.
  f="`echo $* | sed 's/ /_/g' | sed 's/\/\./\//g'`"
  if [ "$*" \!= "$f" ] ; then mv "$*" "$f" ; fi
}
needfor() { # Usage: needfor package ; Tests if a package is installed before used, and proposes to install otherwise.
  if ! dpkg-query -Wf'${db:Status}' "$1" 2>/dev/null ; then
    read -p "The '$1' package is not installed ? Shall we ? (y/N): " -n 1 -e rep ; if [ "$rep" = "y" ] ; then
										     apt install "$1" ; else exit ; fi
  fi
}

