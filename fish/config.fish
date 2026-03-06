if not set -q SSH_AUTH_SOCK
    eval (ssh-agent -c)
    ssh-add
end

status --is-interactive; and direnv hook fish | source
set -x BROWSER firefox
set -gx PATH $HOME/.bun/bin $HOME/go/bin $PATH

# OpenClaw Completion
if test -f "$HOME/.openclaw/completions/openclaw.fish"
    source "$HOME/.openclaw/completions/openclaw.fish"
end
