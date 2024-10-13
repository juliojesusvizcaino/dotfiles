# My Dotfiles

```sh
stow .
```


```sh
sh <(curl -L https://nixos.org/nix/install) --daemon
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
# Kitty doesn't work, it needs nixGL: https://github.com/nix-community/nixGL
nix-channel --add https://github.com/nix-community/nixGL/archive/main.tar.gz nixgl
nix-channel --update
```
