@echo off

set CATE_BIN=%~dp0

rem Make CATE_HOME=%CATE_BIN%\.. an absolute path:
pushd .
cd %CATE_BIN%\..
set CATE_HOME=%CD%
popd

call "%CATE_BIN%\activate.bat" "%CATE_HOME%"
if errorlevel 1 exit 1

prompt $G$S

echo.
@echo ESA CCI Toolbox (CLI) command-line interface. Type "cate -h" to get help.
echo.

cmd /K ""
