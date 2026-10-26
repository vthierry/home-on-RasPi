PS1="\W>"

export SHELL=/bin/bash
export PATH=.:$HOME/bin:$PATH:$HOME/.local/bin
export EDITOR=mousepad
export BROWSER=chromium
unset  MAIL
export TEXINPUTS=".:"

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
popd() { # Usage: popd : Silent popd.
  command popd > /dev/null
}
alias c='$HOME/bin/clean; clear' # Usage: c ; Cleans temporary files and clean the terminal screen.
alias s='xdg-open' # Usage: s $file ; Shows a file with the default application.
alias f='pcmanfm' # Usage: f ; Opens the file manager for the current directory.
alias m='~/bin/make' # Usage: m ; Runs make in the current directory.
alias k='killall' # Usage: k ; Kill all processes of a given name.
alias w='console man' # Usage: w ; Opens the man page of a given command.
update() { # Usage: update ; Performs the proper apt update.
  ## Note: Also avoids to use bin/update by mistake.
  sudo apt update -q -y  ; sudo apt full-upgrade -q -y ; sudo apt autoremove -q -y
}
