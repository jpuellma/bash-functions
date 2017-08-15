debugon=false
my_name=${0}
reverse_array() {
# Input: An array of strings, separated by whitespace.
# Output: The same array, reversed.
    local array idx
    array=("$@")
    for (( idx=${#array[@]}-1 ; idx>=0 ; idx-- )) ; do
        echo -n "${array[idx]} "
    done
}


format_call_stack() {
# Formats a function call stack for printing in log messages.
# Input: A whitespace separated list of function names, typically
# "${FUNCNAME[*]}".
# Output: The same list, reversed, with the log_* function names and redundant
# main calls removed and spaces replaced with '->' indicators.
    local arrows dedupe_mains input no_logs reset_ifs reversed
    reset_ifs="${IFS}"
    IFS=" "
    input="$*"
    reversed=$(reverse_array ${input})
    dedupe_mains=${reversed/main main /main }
    no_logs=${dedupe_mains% log_*}
    arrows=${no_logs// /→}
    echo ${arrows}
    IFS="${reset_ifs}"
}


log_debug() {
    local stack
    if [ _"${debugon}" == _true ]; then
        stack=$(format_call_stack "${FUNCNAME[*]}")
        printf 'Debug [[%s: %s]]: %s\n' "${my_name}" "${stack}" "$*" > /dev/stderr
    fi
}


log_error() {
    local stack
    stack=$(format_call_stack "${FUNCNAME[*]}")
    printf 'Error [[%s: %s]]: %s\n' "${my_name}" "${stack}" "$*" > /dev/stderr
}


log_info() {
    local stack
    stack=$(format_call_stack "${FUNCNAME[*]}")
    printf '[[%s: %s]]: %s\n' "${my_name}" "${stack}" "$*"
}
