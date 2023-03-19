while set index (contains -i -- '/home/julio/.pyenv/shims' $PATH)
set -eg PATH[$index]; end; set -e index
set -gx PATH '/home/julio/.pyenv/shims' $PATH
set -gx PYENV_SHELL fish
source '/home/julio/.pyenv/libexec/../completions/pyenv.fish'
command pyenv rehash 2>/dev/null
function pyenv
  set command $argv[1]
  set -e argv[1]

  switch "$command"
  case activate deactivate rehash shell
    source (pyenv "sh-$command" $argv|psub)
  case '*'
    command pyenv "$command" $argv
  end
end
