# llvm-cov-3
# Autogenerated from man page /usr/share/man/man1/llvm-cov-3.8.1.gz
complete -c llvm-cov-3 -o fprofile-arcs -o ftest-coverage --description 'instrumentation.'
complete -c llvm-cov-3 -s a -l all-blocks --description 'Display all basic blocks.'
complete -c llvm-cov-3 -s b -l branch-probabilities --description 'Display conditional branch probabilities and a summary of branch information.'
complete -c llvm-cov-3 -s c -l branch-counts --description 'Display branch counts instead of probabilities (requires -b).'
complete -c llvm-cov-3 -s f -l function-summaries --description 'Show a summary of coverage for each function instead of just one summary for …'
complete -c llvm-cov-3 -l help --description 'Display available options (--help-hidden for more).'
complete -c llvm-cov-3 -s l -l long-file-names --description 'For coverage output of files included from the main source file, add the main…'
complete -c llvm-cov-3 -s n -l no-output --description 'Do not output any . gcov files.  Summary information is still displayed.'
complete -c llvm-cov-3 -s o -l object-directory -l object-file --description 'Find objects in DIR or based on FILE\'s path.'
complete -c llvm-cov-3 -s p -l preserve-paths --description 'Preserve path components when naming the coverage output files.'
complete -c llvm-cov-3 -s u -l unconditional-branches --description 'Include unconditional branches in the output for the --branch-probabilities o…'
complete -c llvm-cov-3 -o version --description 'Display the version of llvm-cov.'
complete -c llvm-cov-3 -o show-line-counts --description 'Show the execution counts for each line.'
complete -c llvm-cov-3 -o show-expansions --description 'Expand inclusions, such as preprocessor macros or textual inclusions, inline …'
complete -c llvm-cov-3 -o show-instantiations --description 'For source regions that are instantiated multiple times, such as templates in…'
complete -c llvm-cov-3 -o show-regions --description 'Show the execution counts for each region by displaying a caret that points t…'
complete -c llvm-cov-3 -o show-line-counts-or-regions --description 'Show the execution counts for each line if there is only one region on the li…'
complete -c llvm-cov-3 -o use-color --description 'Enable or disable color output.  By default this is autodetected.'
complete -c llvm-cov-3 -o arch --description 'If the covered binary is a universal binary, select the architecture to use.'
complete -c llvm-cov-3 -o name --description 'Show code coverage only for functions with the given name.'
complete -c llvm-cov-3 -o name-regex --description 'Show code coverage only for functions that match the given regular expression.'
complete -c llvm-cov-3 -o line-coverage-gt --description 'Show code coverage only for functions with line coverage greater than the giv…'
complete -c llvm-cov-3 -o line-coverage-lt --description 'Show code coverage only for functions with line coverage less than the given …'
complete -c llvm-cov-3 -o region-coverage-gt --description 'Show code coverage only for functions with region coverage greater than the g…'
complete -c llvm-cov-3 -o region-coverage-lt --description 'Show code coverage only for functions with region coverage less than the give…'
