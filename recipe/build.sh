#!/bin/bash

$PYTHON setup.py install

if [ `uname` == Darwin ]
then
    cp $RECIPE_DIR/ect-cli.command $PREFIX/bin/
    cp -r $RECIPE_DIR/ect-cli.app $PREFIX/bin/
    sed -i -e "s,\${PKG_VERSION},${PKG_VERSION},g"  "${PREFIX}/bin/ect-cli.app/Contents/Info.plist"
else
    cp $RECIPE_DIR/ect-cli.sh $PREFIX/bin
    mkdir -p  $PREFIX/share/ect
    cp $RECIPE_DIR/ect.desktop-template $PREFIX/share/ect/
    cp $RECIPE_DIR/ect.png $PREFIX/share/ect/
fi
