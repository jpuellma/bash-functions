# bash-functions
Useful Bash utility files.

These files define utility functions and other aliases and useful strings which can be used in Bash scripts. These files are meant to be _sourced_, either as part of the initial login/bashrc or as part of the initialization steps of a script which will use these functions. None of the files in this repo should actually make any changes to a system when executed, other than to set and define environment variables, aliases, and functions.

Below, find descriptions of the contents underneath the filename in which the function is defined.

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
