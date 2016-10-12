@echo off

set ECT_BIN=%~dp0

rem Make ECT_HOME=%ECT_BIN%\.. an absolute path:
pushd .
cd %ECT_BIN%\..
set ECT_HOME=%CD%
popd

call "%ECT_BIN%\activate.bat" "%ECT_HOME%"
if errorlevel 1 exit 1

prompt $G$S

echo.
@echo Welcome to the CCI Toolbox command-line interface. Type "ect -h" to get help.
echo.

cmd /K ""
