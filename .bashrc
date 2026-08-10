PS1="\W>"

export SHELL=/bin/bash
export PATH=$HOME/bin:$PATH:$HOME/.local/bin
export EDITOR=emacs
export BROWSER=chromium
unset  MAIL
export TEXINPUTS=".:"
if [ -f .ssh/SSH_ENV ] ; then . .ssh/SSH_ENV ; fi

alias cp='cp -i' # Usage: cp $source $target ; Force interactive copy to avoid error.
alias mv='mv -i' # Usage: mv $source $target ; Force interactive move to avoid error.
rm() { # Usage: rm $files ; Removes files by moving them to the desktop trask.
  TRASH=$HOME/.local/share/Trash/files
  mkdir -p $TRASH
  /bin/mv $* $TRASH
}
pushd() { # Usage: pushd $directory ; Silent pushd.
  command pushd "$@" > /dev/null
}
popd() { # Usage: ppopd : Silent popd.
  command popd > /dev/null
}
alias c='$HOME/clean; clear' # Usage: c ; Cleans temporary files and clean the terminal screen.
alias s='xdg-open' # Usage: s $file ; Opens a file with the default application
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
confirm() { # Usage: confirm $message [$exit] ; Asks a true/false question ; returns the boolean answer ; exits if false, with $exit=y.
    read -p "$1? (y/N) : " -n 1 -e rep ; if [ "$rep" = "y" ] ; then true ; else if [ \! -z "$exit" ] ; then exit ; fi ; false ; fi
}
update() { # Usage: update ; Performs the proper apt update.
  ## Note: Also avoids to use bin/update by mistake.
  sudo apt update -q -y  ; sudo apt full-upgrade -q -y ; sudo apt autoremove -q -y
}
