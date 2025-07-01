function sourcenv
    if test (count $argv) -eq 0
        echo "Usage: sourcenv <env_file>"
        return 1
    end
    
    if not test -f $argv[1]
        echo "Error: File '$argv[1]' not found"
        return 1
    end
    
    for line in (cat $argv[1] | grep -v '^#' | grep -v '^\s*$')
        set items (string split -m 1 '=' $line)
        if test (count $items) -eq 2
            set -gx $items[1] $items[2]
            echo "Set $items[1]"
        else
            echo "Warning: Skipping invalid line: $line"
        end
    end
end
