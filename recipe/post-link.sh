#!/bin/bash

# http://conda.pydata.org/docs/building/build-scripts.html

if [ `uname` != Darwin ]
then
    APP_DIR="${HOME}/.local/share/applications"
    DESKTOP_TEMPLATE="${PREFIX}/share/ect/ect.desktop-template"

    mkdir -p "${APP_DIR}"
    cat "${DESKTOP_TEMPLATE}" | sed -e "s,\${PREFIX},${PREFIX},g"  > "${APP_DIR}/ect.desktop"
fi