#!/usr/bin/env bash
debugon=${debugon:-false}
# set -o errexit
# set -o pipefail
# set -o nounset
# set -o xtrace


log_debug() {
    if [ "${debugon}" == "true" ]; then
        printf 'Debug [%s: %s]: %s\n' "${__name}" "${FUNCNAME[1]}" "$*" > /dev/stderr
    fi
}


log_error() {
    printf 'Error [%s: %s]: %s\n' "${__name}" "${FUNCNAME[1]}" "$*" > /dev/stderr
}


log_info() {
    printf '[%s]: %s\n' "${__name}" "$*"
}


do_get_args() {
    log_debug "Begin ${FUNCNAME[0]}()."
    local ret_val
    log_debug "End ${FUNCNAME[0]}()."
    return ${ret_val}
}


do_print_usage() {
    log_debug "Begin ${FUNCNAME[0]}."
    local ret_val
    cat << eof
Usage: ${__name} [ option1| option2 | option3 ]
    option1 - Does thing1
    option2 - Does thing2
    option3 - Does thing3
eof
    log_debug "End ${FUNCNAME[0]}."
    return ${ret_val}
}


do_stop() {
    log_debug "Begin ${FUNCNAME[0]}()."
    local ret_val
    log_debug "End ${FUNCNAME[0]}()."
    return ${ret_val}
}


do_start() {
    log_debug "Begin ${FUNCNAME[0]}()."
    local ret_val
    log_debug "End ${FUNCNAME[0]}()."
    return ${ret_val}
}


do_restart(){
    log_debug "Begin ${FUNCNAME[0]}()."
    local ret_val
    do_stop
    let ret_val=ret_val+$?
    do_start
    log_debug "End ${FUNCNAME[0]}()."
    return ${ret_val}
}


main() {
    log_debug "Begin ${FUNCNAME[0]}()."
    return_value=0
    __dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    __file="${__dir}/$(basename "${BASH_SOURCE[0]}")"
    __name="$(basename ${__file})"
    log_debug "__dir is ${__dir}."
    log_debug "__file is ${__file}."
    log_debug "__name is ${__name}."
    # DO WORK HERE
    log_debug "End ${FUNCNAME[0]}()."
    return ${return_value}
}


# Only invoke main() if we were NOT sourced. This allows other scripts to source this file and cherry-pick functions.
[ "$0" = "${BASH_SOURCE[0]}" ] && nature=executed || nature=sourced
if [ _${nature} != _"sourced" ]; then
    log_debug "Not sourced. Invoking main function."
    main "$@"
else
    log_debug "Being read as source. Skipping main() execution."
fi
