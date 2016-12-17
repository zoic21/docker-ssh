# ~/.profile: executed by Bourne-compatible login shells.
alias c="/root/scripts/shell/connection/connection.sh"
alias m="/root/scripts/shell/connection/multissh.sh"
if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi

mesg n
