#!/bin/zsh

offline=`dig 8.8.8.8 +time=1 +short google.com A | grep -c "no servers could be reached"`
if [[ "$offline" == "0" ]]; then
  rm ~/.offline 2&> /dev/null
else
  touch ~/.offline
fi
