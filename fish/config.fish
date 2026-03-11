if not set -q SSH_AUTH_SOCK
    eval (ssh-agent -c)
    ssh-add
end

status --is-interactive; and direnv hook fish | source
set -x BROWSER firefox
set -x CLAUDE_CODE_DISABLE_TERMINAL_TITLE 1
set -gx PATH $HOME/.bun/bin $HOME/go/bin $PATH
