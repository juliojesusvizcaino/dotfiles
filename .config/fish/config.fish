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

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/julio/miniconda3/bin/conda
    eval /home/julio/miniconda3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/home/julio/miniconda3/etc/fish/conf.d/conda.fish"
        . "/home/julio/miniconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/home/julio/miniconda3/bin" $PATH
    end
end
# <<< conda initialize <<<


if test -f /usr/bin/carapace
  set -Ux CARAPACE_BRIDGES 'zsh,fish,bash,inshellisense' # optional
  mkdir -p ~/.config/fish/completions
  carapace --list | awk '{print $1}' | xargs -I{} touch ~/.config/fish/completions/{}.fish # disable auto-loaded completions (#185)
  carapace _carapace | source
end
