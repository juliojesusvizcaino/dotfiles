## Modified to source the generated file directly (so it isn't created every time)
if command -v starship 1>/dev/null 2>&1
  # # starship init fish | source
  # source /home/julio/.config/fish/starship.fish
  starship init fish | source
end
# status --is-login; and status --is-interactive; and exec byobu-launcher

fish_vi_key_bindings

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin /home/julio/.ghcup/bin $PATH # ghcup-env

zoxide init fish | source

fish_add_path ~/.local/share/mise/shims
~/.local/bin/mise activate fish | source

fzf --fish | source
