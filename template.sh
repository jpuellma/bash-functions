#!/usr/bin/env bash
debugon=${debugon:-false}
# set -o errexit
# set -o pipefail
# set -o nounset
# set -o xtrace


# Global vars
__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
__file="${__dir}/$(basename "${BASH_SOURCE[0]}")"
__name="$(basename ${__file})"


function_template() {
# Template function.
# Input: None.
# Output: None.
# Returns: 0 for success; 1 on error.
    log_debug "Begin ${FUNCNAME[0]}()."
    local return_value
    do_stuff
    let return_value=return_value+$?
    log_debug "End ${FUNCNAME[0]}(). Returning ${return_value}."
    return ${return_value}
}  # end function_template()


log_debug() {
# Print formatted message _only_ if debug flag is set.
# Input: String
# Output: Formatted string.
# Returns: 0
    if [ "${debugon}" == "true" ]; then
        printf 'Debug [%s: %s]: %s\n' "${__name}" "${FUNCNAME[1]}" "$*" > /dev/stderr
    fi
}  # end log_debug()


log_error() {
# Print formatted error message.
# Input: String
# Output: Formatted string.
# Returns: 0
    printf 'Error [%s: %s]: %s\n' "${__name}" "${FUNCNAME[1]}" "$*" > /dev/stderr
}  # end log_error()


log_info() {
# Print formatted message.
# Input: String
# Output: Formatted string.
# Returns: 0
    printf '[%s]: %s\n' "${__name}" "$*"
}  # end log_info()


do_get_args() {
# Read cmdline args and set global variables.
# Input: "$@"
# Output: None.
# Returns: 0
    log_debug "Begin ${FUNCNAME[0]}()."
    local return_value
    log_debug "End ${FUNCNAME[0]}(). Returning ${return_value}."
    return ${return_value}
}  # end do_get_args()


do_print_usage() {
# Print a usage message for this tool.
# Input: None.
# Output: Formatted usage message (multiline).
# Returns: 0
    log_debug "Begin ${FUNCNAME[0]}."
    cat << eof
Usage: ${__name} [ option1| option2 | option3 ]
    start - Starts the service.
    stop - Stops the service.
    restart - Stops, then starts, the service.
    status - Reports current status of service.
eof
    log_debug "End ${FUNCNAME[0]}."
}  # end do_print_usage()


do_stop() {
# Stop a service.
# Input: None.
# Output: None.
# Returns: 0 if success. >0 if failure.
    log_debug "Begin ${FUNCNAME[0]}()."
    local return_value
    log_debug "End ${FUNCNAME[0]}(). Returning ${return_value}."
    return ${return_value}
}  # end do_stop()


do_start() {
# Start a service.
# Input: None.
# Output: None.
# Returns: 0 if success. >0 if failure.
    log_debug "Begin ${FUNCNAME[0]}()."
    local return_value
    log_debug "End ${FUNCNAME[0]}(). Returning ${return_value}."
    return ${return_value}
}  # end do_start()


do_restart() {
# Stop and then start a service.
# Input: None.
# Output: None.
# Returns: 0 if successfully started. >0 if failed to start.
    log_debug "Begin ${FUNCNAME[0]}()."
    local return_value
    do_stop
    let return_value=return_value+$?
    do_start
    log_debug "End ${FUNCNAME[0]}(). Returning ${return_value}."
    return ${return_value}
}  # end do_restart()


do_get_pid() {
# Read a pidfile and return the PID found inside.
# Input: Optional: String indicating the pidfile to read.
# If no input, assumes pidfile is "${__dir}/pidfile".
# Output: None.
# Return: A valid PID, if found. Otherwise, -1.
    log_debug "Begin ${FUNCNAME[0]}()."
    local pid_file return_value
    if ! [ -z "$1" ]; then
        pid_file="${1}"
    else
        pid_file="${__dir}/pidfile"
    fi
    log_debug "pid_file is \"${pid_file}\"."
    log_debug "End ${FUNCNAME[0]}(). Returning ${return_value}."
    return ${return_value}
}  # end do_get_pid()


do_print_failed() {
# Print formatted failure message.
# Input: None.
# Output: String.
# Returns: 0.
    log_debug "Begin ${FUNCNAME[0]}()."
    printf "\e[31m[FAILED]\e[39;49m\n"
    log_debug "End ${FUNCNAME[0]}()."
}  # end do_print_failed()


do_print_success() {
# Print formatted success message.
# Input: None.
# Output: String.
# Returns: 0.
    log_debug "Begin ${FUNCNAME[0]}()."
    printf "\e[32m[SUCCESS]\e[39;49m\n"
    log_debug "End ${FUNCNAME[0]}()."
}  # end do_print_success()


is_pid_running() {
# Checks if a process is running or not.
# Input: An integer PID.
# Output: None.
# Returns: 0 if pid is running. 1 if invalid pid or if no such pid is running.
    log_debug "Begin ${FUNCNAME[0]}()."
    local return_value
    let return_value=0
    ps -p ${1} >& /dev/null
    let return_value=return_value+$?
    log_debug "End ${FUNCNAME[0]}(). Returning ${return_value}."
    return ${return_value}
}  # end is_pid_running()


get_pid_from_pidfile() {
# Gets a process id from a file.
# Input: filename
# Output: None.
# Returns: The PID from the file or -1 if error.
    log_debug "Begin ${FUNCNAME[0]}()."
    local pid pid_file return_value
    let return_value=0
    pid_file=${1:-""}
    log_debug "pid_file is \"${pid_file}\"."
    pid=$(cat ${pid_file}) || log_error "Could not retrieve PID from file ${pid_file}."
    if is_valid_pid ${pid} ; then
        return_value=${pid}
    else
        let return_value=-1
    fi
    let return_value=return_value+$?
    log_debug "End ${FUNCNAME[0]}(). Returning ${return_value}."
    return ${return_value}
}  # end get_pid_from_pidfile()


is_valid_pid() {
# Check is a provided value is a valid PID.
# Only checks first word passed. If more than one arg is passed, additional args are ignored.
# Input: Integer PID.
# Output: None.
# Returns: 0 if valid; 1 if not.
    log_debug "Begin ${FUNCNAME[0]}(). Input is \"$*\"."
    local pid pid_max return_value
    pid_max=$(cat /proc/sys/kernel/pid_max >& /dev/null) || pid_max=99999
    log_debug "pid_max is ${pid_max}."
    pid=$1
    log_debug "pid is ${pid}."
    case ${pid} in
        ''|*[!0-9]*)
            let return_value=1
            ;;
        *)
            if [[ ${pid} == 0 ]]; then
                let return_value=1
            elif [[ ${pid} -gt ${pid_max} ]]; then
                let return_value=1
            else
                let return_value=0
            fi
            ;;
    esac
    log_debug "End ${FUNCNAME[0]}(). Returning ${return_value}."
    return ${return_value}
}  # end is_valid_pid()


main() {
    log_debug "Begin ${FUNCNAME[0]}()."
    local return_value
    let return_value=0
    log_debug "__dir is ${__dir}."
    log_debug "__file is ${__file}."
    log_debug "__name is ${__name}."
    # DO WORK HERE
    do_get_pid
    do_print_failed
    log_debug "End ${FUNCNAME[0]}(). Returning ${return_value}."
    return ${return_value}
}  # end main()


# Only invoke main() if we were NOT sourced. This allows other scripts to source this file and cherry-pick functions.
[ "$0" = "${BASH_SOURCE[0]}" ] && nature=executed || nature=sourced
if [ "${nature}" != "sourced" ]; then
    log_debug "Not sourced. Invoking main function."
    main "$@"
else
    log_debug "Being read as source. Skipping main() execution."
fi
