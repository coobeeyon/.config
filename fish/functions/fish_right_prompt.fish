function fish_right_prompt
    # Color definitions
    set -l normal (set_color normal)
    set -l gray (set_color -o 666666)
    set -l yellow (set_color -o ffbb33)
    set -l cyan (set_color -o 00d4aa)
    
    set -l right_info ""
    
    # Show command duration if it took longer than 2 seconds
    if test "$CMD_DURATION" -gt 2000
        set -l duration (math "$CMD_DURATION / 1000")
        if test $duration -ge 60
            set -l minutes (math "floor($duration / 60)")
            set -l seconds (math "$duration % 60")
            set right_info "$yellow{$minutes}m{$seconds}s$normal $right_info"
        else
            set right_info "$yellow{$duration}s$normal $right_info"
        end
    end
    
    # Show Python virtual environment if active
    if test -n "$VIRTUAL_ENV"
        set -l venv_name (basename "$VIRTUAL_ENV")
        set right_info "$cyan($venv_name)$normal $right_info"
    end
    
    # Show Node.js version if in a Node project and nvm is available
    if test -f package.json -a -n "$NVM_DIR"
        set -l node_version (node --version 2>/dev/null | string replace 'v' '')
        if test -n "$node_version"
            set right_info "$gray node:$node_version$normal $right_info"
        end
    end
    
    echo -n $right_info
end
