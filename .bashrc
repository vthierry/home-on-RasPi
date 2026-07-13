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
gitsync() { #Usage: gitsync $message ; Synchronizes with the current repository adding a commit message.
    if [ -z "$*" ] ; then m="minor modification" ; else m="$*" ; fi
    git -q pull ; git commit -a -m "$m" ; git -q push ; git status -s
}
alias c='$HOME/clean; clear' # Usage: c ; Cleans temporary files and clean the terminal screen.
alias s='xdg-open' # Usage: s $file ; Opens a file with the default application
m() { # Usage: m $target-or-file ; Makes a target file using the current or a parent makefile
    for d in "." ".." "../.." "../../.." "../../../.." 
    do if [ -f $d/makefile ] ; then if [ \( -z "$1" \) -o \( \! -z "`grep -e '^$1:' $d/makefile`" \) ] ; then
      make -s --no-print-directory -C $d $* ; exit $?
    fi ; fi ; done
   echo "make.sh: *** No rule to make target '$1'.  Stop." ; exit -1
   ## - Only makefile file is considered here (allowing one to skip the command using a Makefile file).
   ## - The make command is used without echo
}
pdfcompress() { # Usage: pdfcompress $pdf-file ; Compresses a pdf file.
    gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile="compressed_$1" "$1"
}
videocompress() { # Usage: videocompress $video-file ; Compresses a video file.
    ffmpeg -i "$1" -vcodec libx265 -tag:v hvc1 "compressed_$1"
}
subst() { # Usage: subst $pattern $replacement < $input > $output ; Replaces a string using Javascript regular expressions.
    nodejs --eval 'console.log(require("fs").readFileSync(require("process").stdin.fd, "utf-8").replace(new RegExp(process.argv[1], "gms"), process.argv[2]).trim());' "$1" "$2"
}
html2wp() { # Usage: html2wp < $input > $output ; Converts a complex html styles file to simple html to be used in wordpress.
    subst '</?(span|font)[^>]*>' '' | subst ' (class|style|align) *= *"[^"]*"' ''
}
videodownload() { # Usage: videodownload $url ; Downloads a video
    ~/bin/yt-dlp $*
    ## Uses the https://github.com/yt-dlp/yt-dlp software
}
