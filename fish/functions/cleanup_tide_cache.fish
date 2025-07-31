function cleanup_tide_cache --description "Clean up old tide prompt cache"
    for var in (set | grep "^_tide_prompt_" | cut -d" " -f1)
        if test (count (string split "_" $var)) -gt 3  # Only remove numbered caches
            set -e $var
        end
    end
end
