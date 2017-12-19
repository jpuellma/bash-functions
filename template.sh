#!/usr/bin/env bash
debugon=${debugon:-false}
# set -o errexit
# set -o pipefail
# set -o nounset
# set -o xtrace


__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
__file="${__dir}/$(basename "${BASH_SOURCE[0]}")"
__name="$(basename ${__file})"


log_debug() {
    if [ "${debugon}" == "true" ]; then
        printf 'Debug [%s: %s]: %s\n' "${__name}" "${FUNCNAME[1]}" "$*" > /dev/stderr
    fi
}


log_error() {
    printf 'Error [%s: %s]: %s\n' "${__name}" "${FUNCNAME[1]}" "$*" > /dev/stderr
}


log_info() {
    printf '[%s: %s]: %s\n' "${__name}" "${FUNCNAME[1]}" "$*"
}


do_get_args() {
    log_debug "Begin ${FUNCNAME[0]}."
    log_debug "  End ${FUNCNAME[0]}."
}


do_print_usage() {
    log_debug "Begin ${FUNCNAME[0]}."
    cat << eof
Usage: ${__name} [ option1| option2 | option3 ]
    option1 - Does thing1
    option2 - Does thing2
    option3 - Does thing3
eof
    log_debug "  End ${FUNCNAME[0]}."
}


do_stop() {
    log_debug "Begin ${FUNCNAME[0]}."
    log_debug "  End ${FUNCNAME[0]}."
}


do_start() {
    log_debug "Begin ${FUNCNAME[0]}."
    log_debug "  End ${FUNCNAME[0]}."
}


do_restart(){
    log_debug "Begin ${FUNCNAME[0]}."
    do_stop
    do_start
    log_debug "  End ${FUNCNAME[0]}."
}

main() {
    log_debug "Begin ${FUNCNAME[0]}."
    log_debug "  End ${FUNCNAME[0]}."
}


# Only invoke main() if we were NOT sourced. This allows other scripts to source this file and cherry-pick functions.
[ "$0" = "${BASH_SOURCE[0]}" ] && nature=executed || nature=sourced
if [ _${nature} != _"sourced" ]; then
    log_debug "Executing main()."
    main "$@"
else
    log_debug "Being read as source. Skipping main() execution."
fi
