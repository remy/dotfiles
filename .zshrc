# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="remy"
# ZSH_THEME="demo"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git brew sublime heroku z zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

globalias() {
   if [[ $LBUFFER =~ ' [A-Z0-9]+$' ]]; then
     zle _expand_alias
   fi
   zle self-insert
}

zle -N globalias

bindkey " " globalias
bindkey "^ " magic-space           # control-space to bypass completion
bindkey -M isearch " " magic-space # normal space during searches

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

source $HOME/.exports

# import a list of paths
export PATH=$PATH:$(eval echo $(cat $HOME/.paths | sed 's:#.*$::g' | sed '/^\s*$/d' | sed -e :a -e '$!N; s/\n/:/; ta'))

# .extra contains private keys and isn't included in this repo
for source in .zshenv .extra .aliases .functions .travis/travis.sh; do
  [ -f $HOME/$source ] && source $HOME/$source;
done

source <(npm completion)

# welcome!
hash ponysay &>2 && ponysay -o
