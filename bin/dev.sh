#!/bin/sh

set -o errexit
set -e

# Fail fast if we're not on OS X >= 10.6.0.

if [ "$(uname -s)" != "Darwin" ]; then
  echo "Sorry, DEV requires Mac OS X to run." >&2
  exit 1
fi

# Fail if we don't have Homebrew or MacPorts installed

if ! command -v brew >/dev/null 2>&1 && ! command -v port >/dev/null 2>&1; then
  echo "Sorry, DEV requires Homebrew or MacPorts to run."
  exit 1
fi

echo "***********************************"
echo "Installing .dev"
echo "***********************************"

# Install using Homebrew

if command -v brew >/dev/null 2>&1; then
  
  echo "*** Installing dnsmasq with Homebrew..."
  brew install dnsmasq

  echo "*** Configurating dnsmasq..."
  echo 'address=/.dev/127.0.0.1' > $(brew --prefix)/etc/dnsmasq.conf

  echo "*** Installing dnsmasq into LaunchDaemons..."
  sudo cp -v $(brew --prefix dnsmasq)/homebrew.mxcl.dnsmasq.plist /Library/LaunchDaemons
  sudo launchctl load -w /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist

else # Install using MacPorts
  
  MACPORTSDIR=/opt/local
  
  if [ ! -d $MACPORTSDIR ]; then
    echo "Sorry, $MACPORTSDIR doesn't seem to exist. Please set MACPORTSDIR in this script."
    exit 1
  fi
  
  echo "*** Installing dnsmasq with MacPorts..."
  sudo port install dnsmasq

  echo "*** Configurating dnsmasq..."
  sudo bash -c 'echo "address=/.dev/127.0.0.1" > $MACPORTSDIR/etc/dnsmasq.conf'

  echo "*** Installing dnsmasq into LaunchDaemons..."
  sudo port load dnsmasq

fi

echo "*** Registerering .dev into /etc/resolver..."
[ -d /etc/resolver ] || sudo mkdir -v /etc/resolver
sudo bash -c 'echo "nameserver 127.0.0.1\n" > /etc/resolver/dev'

echo 'Running self-check to see if .dev is working'
if ping -oc 100 'kenneth.dev' > /dev/null; then
    echo "*** Everything looks good. Enjoy the ride!"
else
    echo "*** Sorrrry. Something went wrong. Don't blame me."
fi

echo 'Done. Im getting out of there.'
