#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ECT_BIN="$( cd "${DIR}/../../.."  && pwd )"

open "${ECT_BIN}/ect-cli.command"
