rem Use PEP 440 compliant version identifier
set VERSION=1.1.0.dev1
set VERSION_DIR=%USERPROFILE%\.cate\%VERSION%
mkdir "%VERSION_DIR%"
echo %PREFIX% > "%VERSION_DIR%\cate.location"
