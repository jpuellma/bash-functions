# bash-functions
Useful Bash utility functions.

These files define useful utility functions which can be used in Bash scripts. These files are meant to be _sourced_.

Below, find descriptions of the functions underneath the filename in which the function is defined.

Right now, all functions are defined in a single `functions.sh`, but in the future this may be split into multiple files based on what the functions are for.

## functions.sh
### `reverse_array()`
Reverses the elements of an array.
- Input: An array of strings, separated by whitespace.
- Output: The same array, reversed.

### `format_call_stack()`
Formats a function call stack for printing in log messages.
- Input: A whitespace separated list of function names, typically "${FUNCNAME[*]}".
- Output: The same list, reversed, with the log_* function names and redundant main calls removed and spaces replaced with '->' indicators.

### `log_debug()`
Prints a formatted debug message if and only if the global `debugon` variable is set to "`true`".

### `log_debug()`
Prints a formatted informational message.

### `log_error()`
Prints a formatted error message.
