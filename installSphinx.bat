@ECHO off
REM Command file for local python installation

REM get the installation file:
set VERSION=2.7.10
set TARGET=%~dp0\python-%VERSION%
set URL=https://www.python.org/ftp/python/%VERSION%/python-%VERSION%.msi

ECHO. 
ECHO Downloading: %URL% to %TEMP% ...
powershell.exe -Command (new-object System.Net.WebClient).DownloadFile('%URL%','%TEMP%/python-%VERSION%.msi')
ECHO done.
ECHO. 
ECHO Installing Python ...
msiexec /a %TEMP%\python-%VERSION%.msi /qb TARGETDIR="%TARGET%"
ECHO done.
ECHO Installing Sphinx ...
%TARGET%\python.exe -m ensurepip
%TARGET%\python.exe -m pip install -U pip
%TARGET%\python.exe -m pip install -U sphinx
%TARGET%\python.exe -m pip install -U sphinxcontrib-inlinesyntaxhighlight
ECHO done.
ECHO. 
ECHO Cleaning up ...
del %TEMP%\python-%VERSION%.msi
ECHO done.

PAUSE
