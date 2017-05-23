#!/bin/bash

CATE_BIN="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
CATE_HOME="$( cd "${CATE_BIN}/.."  && pwd )"

reset
echo
echo ESA CCI Toolbox \(Cate\) command-line interface. Type "cate -h" for help.
echo

source "${CATE_BIN}/activate" "${CATE_HOME}"
unset PROMPT_COMMAND
export PS1="\[\033[1;34m\](cate)\[\033[0m\] $ "
exec /bin/bash --norc -i
