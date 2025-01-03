# My Dotfiles

```sh
stow .
```

## Kitty

```sh
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
stow -d ~/.local/kitty.app/ .
```

## Nushell

[download url](https://www.nushell.sh/book/installation.html)

```sh
sudo apt install pkg-config libssl-dev build-essential
rustup update
cargo install nu --locked
```

## Ansible

```sh
uv pip install --system ansible
ansible-galaxy role install yethal.nushell
ansible-galaxy role install chriscroome.kitty
ansible-playbook --ask-become-pass bootstrap.yml
```
