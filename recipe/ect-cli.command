#!/bin/bash

ECT_BIN="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ECT_HOME="$( cd "${ECT_BIN}/.."  && pwd )"

reset
echo
echo Welcome to the CCI Toolbox command-line interface. Type "ect -h" to get help.
echo

source "${ECT_BIN}/activate" "${ECT_HOME}"
unset PROMPT_COMMAND
export PS1="\[\033[1;34m\](ect)\[\033[0m\] $ "
exec /bin/bash --norc -i
