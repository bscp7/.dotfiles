# run `install-antibody` command to install antibody
# update Antibody plugins file $HOME/bundles.txt to install new plugin
# source the result file
source ~/.zsh_plugins.sh

# Run `install-pure-prompt` command to setup pure-prompt
fpath+=("$HOME/.zsh/pure")
autoload -U promptinit; promptinit
prompt pure

# change color of the prompt
zstyle ':prompt:pure:prompt:success' color green
zstyle ':prompt:pure:prompt:error' color red

# advanced tab-completion
autoload -Uz compinit && compinit -i

# load local aliases and functions
if test -f $HOME/.aliases; then . $HOME/.aliases; fi
if test -f $HOME/.zsh_functions; then . $HOME/.zsh_functions; fi
if test -f $HOME/.zsh_install_functions; then . $HOME/.zsh_install_functions; fi

# enable fzf search from terminal https://nixos.wiki/wiki/Fzf
if [ -n "${commands[fzf-share]}" ]; then
  source "$(fzf-share)/key-bindings.zsh"
  source "$(fzf-share)/completion.zsh"
fi

# setup nix
if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then . $HOME/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# auto load nix env using direnv
eval "$(direnv hook zsh)"
