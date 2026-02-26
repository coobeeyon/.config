status --is-interactive; and direnv hook fish | source
set -x BROWSER firefox
set -gx PATH $HOME/.bun/bin $HOME/go/bin $PATH

# OpenClaw Completion
source "/home/mdaum/.openclaw/completions/openclaw.fish"
