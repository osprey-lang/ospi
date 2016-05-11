@echo off

rem Path to the compiler
set OSPC="%OSP%\Osprey\bin\Release\Osprey.exe"
rem Path to the library folder
set LIB=%OSP%\lib

echo [!] Compiling osprey.interpreter...
%OSPC% /libpath "%LIB%" /import osprey.compiler /verbose /type module /out "%LIB%\osprey.interpreter\osprey.interpreter.ovm" /name osprey.interpreter /doc "%LIB%\osprey.interpreter\osprey.interpreter.ovm.json" /formatjson osprey.interpreter\src\osprey.interpreter.osp

if %ERRORLEVEL%==0 (
	echo.
	echo [!] Compiling ospi...
	%OSPC% /libpath "%LIB%" /import osprey.compiler /import osprey.interpreter /verbose /main osprey.interpreter.main /out bin\ospi.ovm /name ospi /doc bin\ospi.ovm.json /formatjson ospi\src\ospi.osp
)
