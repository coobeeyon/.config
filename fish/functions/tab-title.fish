function tab-title -d "Set the terminal tab title" -a title
    if not set -q title[1]
        echo "Usage: tab-title <title>"
        return 1
    end
    printf '\e]2;%s\a' "$title"
    function fish_title
        true
    end
end
