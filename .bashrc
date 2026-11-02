PS1="\W>"

export SHELL=/bin/bash
export PATH=.:$HOME/bin:$PATH:$HOME/.local/bin
export EDITOR=emacs # TO BE ADAPTED TO YOUR PREFERED EDITOR
export BROWSER=google-chrome
unset  MAIL
export TEXINPUTS=".:"

alias cp='cp -i' # Usage: cp $source $target ; Forces interactive copy to avoid error.
alias mv='mv -i' # Usage: mv $source $target ; Forces interactive move to avoid error.
rm() { # Usage: rm $files ; Removes files by moving them into the desktop trash.
  t=~/.local/share/Trash
  for p in $* ; do if [ -e "$p" ] ; then
    f="`basename $p`" ; while [ -e "$t/files/$f" ] ; do f="+$f" ; done
    echo -e "[Trash Info]\nPath=`realpath $p`\nDeletionDate=`date -Iminutes`" > $t/info/$f.trashinfo
    /bin/mv $p $t/files/$f
  else echo "rm: cannot remove '$p': No such file or directory" ; fi ; done
}
pushd() { # Usage: pushd $directory ; Silent pushd.
  command pushd "$*" > /dev/null
}
popd() { # Usage: popd : Silent popd.
  command popd > /dev/null
}
alias c='clean; clear' # Usage: c ; Cleans temporary files and clean the terminal screen.
alias e='($EDITOR &)' # Usage e ; Starts the prefered editor.
alias f='pcmanfm' # Usage: f ; Opens the file manager for the current directory.
alias k='killall' # Usage: k ; Kill all processes of a given name.
alias m='~/bin/make' # Usage: m ; Runs make in the current directory.
alias r='find -type f -a -mmin -60 -a ! -path "*/.cache/*" -a ! -path "*/.config/google-chrome/*" -a ! -path "*/.config/GIMP/*" -a ! -path "*/.thunderbird/*"' # Usage: r ; Lists files modified since less than 60 minuts, to be tuned depending on the usage
alias s='xdg-open' # Usage: s $file ; Shows a file with the default application.
alias w='console man' # Usage: w ; Opens the man page of a given command.

update() { # Usage: update ; Performs the proper apt update.
  ## Note: Also avoids to use bin/update by mistake.
  sudo apt update -q -y  ; sudo apt full-upgrade -q -y ; sudo apt autoremove -q -y
}
