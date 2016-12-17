# ~/.profile: executed by Bourne-compatible login shells.
alias c="/root/helper/ssh/connection.sh"
alias m="/root/helper/ssh/multissh.sh"
if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi

mesg n
