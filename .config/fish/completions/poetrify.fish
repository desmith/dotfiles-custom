function __fish_poetrify_edc9bf8bfa7236c7_complete_no_subcommand
    for i in (commandline -opc)
        if contains -- $i generate help
            return 1
        end
    end
    return 0
end

# global options
complete -c poetrify -n '__fish_poetrify_edc9bf8bfa7236c7_complete_no_subcommand' -l ansi -d 'Force ANSI output'
complete -c poetrify -n '__fish_poetrify_edc9bf8bfa7236c7_complete_no_subcommand' -l help -d 'Display this help message'
complete -c poetrify -n '__fish_poetrify_edc9bf8bfa7236c7_complete_no_subcommand' -l no-ansi -d 'Disable ANSI output'
complete -c poetrify -n '__fish_poetrify_edc9bf8bfa7236c7_complete_no_subcommand' -l no-interaction -d 'Do not ask any interactive question'
complete -c poetrify -n '__fish_poetrify_edc9bf8bfa7236c7_complete_no_subcommand' -l quiet -d 'Do not output any message'
complete -c poetrify -n '__fish_poetrify_edc9bf8bfa7236c7_complete_no_subcommand' -l verbose -d 'Increase the verbosity of messages: "-v" for normal output, "-vv" for more verbose output and "-vvv" for debug'
complete -c poetrify -n '__fish_poetrify_edc9bf8bfa7236c7_complete_no_subcommand' -l version -d 'Display this application version'

# commands
complete -c poetrify -f -n '__fish_poetrify_edc9bf8bfa7236c7_complete_no_subcommand' -a generate -d 'Generate pyproject.toml from the source file'
complete -c poetrify -f -n '__fish_poetrify_edc9bf8bfa7236c7_complete_no_subcommand' -a help -d 'Display the manual of a command'

# command options

# generate
complete -c poetrify -A -n '__fish_seen_subcommand_from generate' -l dry-run -d 'Only display the generated command.'
complete -c poetrify -A -n '__fish_seen_subcommand_from generate' -l src -d 'source file'
complete -c poetrify -A -n '__fish_seen_subcommand_from generate' -l workspace -d 'Working space'

# help
