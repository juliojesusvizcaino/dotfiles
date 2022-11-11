# zellij things (better tmux, but I can's send tasks to different sessions :( )
# if status is-interactive
#     # eval (zellij setup --generate-auto-start fish | string collect)
#     if not set -q ZELLIJ
#         if test "$ZELLIJ_AUTO_ATTACH" = true
#             set sessions ( zellij list-sessions )
#             set n (count $sessions)
#             if test $n -eq 0
#                 zellij attach -c
#             else if test $n -eq 1
#                 zellij attach -c
#             else
#                 zellij attach -c (echo $sessions | tr ' ' '\n' | fzf)
#             end
#         else
#             zellij
#         end
#
#         if test "$ZELLIJ_AUTO_EXIT" = true
#             kill $fish_pid
#         end
#     end
# end

# pyenv init
if command -v pyenv 1>/dev/null 2>&1
    pyenv init - | source
end

direnv hook fish | source

# if command -v conda 1>/dev/null 2>&1
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /home/julio/mambaforge/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<
# end

if command -v starship 1>/dev/null 2>&1
    starship init fish | source
end
# status --is-login; and status --is-interactive; and exec byobu-launcher
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH




# TokyoNight Color Palette
set -l foreground c0caf5
set -l selection 364a82
set -l comment 565f89
set -l red f7768e
set -l orange ff9e64
set -l yellow e0af68
set -l green 9ece6a
set -l purple 9d7cd8
set -l cyan 7dcfff
set -l pink bb9af7

# Syntax Highlighting Colors
set -g fish_color_normal $foreground
set -g fish_color_command $cyan
set -g fish_color_keyword $pink
set -g fish_color_quote $yellow
set -g fish_color_redirection $foreground
set -g fish_color_end $orange
set -g fish_color_error $red
set -g fish_color_param $purple
set -g fish_color_comment $comment
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $green
set -g fish_color_escape $pink
set -g fish_color_autosuggestion $comment

# Completion Pager Colors
set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $cyan
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment
set -g fish_pager_color_selected_background --background=$selection

fish_vi_key_bindings

zoxide init fish | source
