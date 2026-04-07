function ralph
    set -l schema '{"type":"object","properties":{"continue":{"type":"boolean"},"summary":{"type":"string"}},"required":["continue","summary"]}'
    set -l prompt "$argv"
    set -l iteration 0

    while true
        set iteration (math $iteration + 1)
        echo "--- Iteration $iteration ---"
        set -l output (claude -p $prompt --output-format json --json-schema $schema)
        set -l result (echo $output | jq -r '.result')
        set -l structured (echo $output | jq '.structured_output')
        set -l summary (echo $structured | jq -r '.summary')
        set -l should_continue (echo $structured | jq -r '.continue')

        echo $result
        echo ""
        echo "Summary: $summary"

        if test $should_continue = "false"
            echo "--- Done after $iteration iteration(s) ---"
            return 0
        end

        echo "Continuing..."
        echo ""
    end
end
