#!/bin/bash

$PYTHON setup.py install

if [ `uname` == Darwin ]
then
    cp $RECIPE_DIR/ect-cli.command $PREFIX/bin/
    chmod 775 $PREFIX/bin/ect-cli.command
    cp -r $RECIPE_DIR/ect-cli.app $PREFIX/bin/
    sed -i -e "s,\${PKG_VERSION},${PKG_VERSION},g" "${PREFIX}/bin/ect-cli.app/Contents/Info.plist"
    chmod 775 "${PREFIX}/bin/ect-cli.app/Contents/MacOS/launch-ect-cli-in-terminal.sh"
else
    cp $RECIPE_DIR/ect-cli.sh $PREFIX/bin
    chmod 775 $PREFIX/bin/ect-cli.sh
    mkdir -p  $PREFIX/share/ect
    cp $RECIPE_DIR/ect.desktop-template $PREFIX/share/ect/
    cp $RECIPE_DIR/ect.png $PREFIX/share/ect/
fi
