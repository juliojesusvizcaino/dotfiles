# Starship Prompt
if command -v starship >/dev/null 2>&1
    source ~/.config/fish/init_starship.fish # Generated via: starship init fish > ~/.config/fish/init_starship.fish
end

# VI Key Bindings
fish_vi_key_bindings

# GHCup
set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME
# PATH additions will be consolidated below

set MANPAGER 'nvim +Man!'

# Zoxide
if command -v zoxide >/dev/null 2>&1
    source ~/.config/fish/init_zoxide.fish # Generated via: zoxide init fish > ~/.config/fish/init_zoxide.fish
end

# Custom Keybind for Zoxide integration (zi)
bind -M insert \cy zi
bind -M default \cy zi

# Mise (Rtx) - Activate manually or accept the startup cost
# If you need it always active and accept the potential slowness:
# if command -v mise >/dev/null 2>&1
~/.local/bin/mise activate fish | source
# end
# Otherwise, comment out the above block and activate manually when needed.
# PATH addition for mise shims will be consolidated below

# FZF
set -x FZF_CTRL_R_OPTS "--layout=reverse"
if command -v fzf >/dev/null 2>&1
    source ~/.config/fish/init_fzf.fish # Generated via: fzf --fish > ~/.config/fish/init_fzf.fish
end

# Conda (Keep commented out for speed)
# >>> conda initialize >>>
# ... (conda block remains commented)
# <<< conda initialize <<<

# Carapace
if command -v carapace >/dev/null 2>&1
    set -Ux CARAPACE_BRIDGES 'zsh,fish,bash,inshellisense' # Optional, set once
    source ~/.config/fish/init_carapace.fish # Generated via: carapace _carapace > ~/.config/fish/init_carapace.fish
    # Ensure uv/uvx completions generated into ~/.config/fish/completions/
    # uv generate-shell-completion fish > ~/.config/fish/completions/uv.fish
    # uvx --generate-shell-completion fish > ~/.config/fish/completions/uvx.fish
end

# PNPM
set -gx PNPM_HOME "/home/julio/.local/share/pnpm"
# PATH additions will be consolidated below

# Consolidated PATH settings (adjust order as needed)
# Ensures paths are added only once and in the desired order.
set -l ghcup_bin "$HOME/.ghcup/bin"
set -l cabal_bin "$HOME/.cabal/bin"
# set -l mise_shims "$HOME/.local/share/mise/shims"
set -l pnpm_home "$PNPM_HOME" # Already set above

fish_add_path --path $cabal_bin
fish_add_path --path $ghcup_bin
# fish_add_path --path $mise_shims # Add mise shims if using mise
fish_add_path --path $pnpm_home

# Cleanup temporary variables
set -e ghcup_bin cabal_bin mise_shims pnpm_home

# Optional: Add Byobu launcher logic if needed
# if status --is-login; and status --is-interactive; and not type -q byobu; and not set -q TMUX
#     exec byobu-launcher
# end

if command -v ast-grep >/dev/null 2>&1
  ast-grep completions fish | source
end

# opencode
fish_add_path /home/julio/.opencode/bin
fish_add_path $HOME/.local/bin

set -x BUN_INSTALL "$HOME/.bun"
fish_add_path $BUN_INSTALL/bin
