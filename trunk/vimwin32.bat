@echo off
set VIMPATH=D:\vim
rem echo %VIMPATH%
copy .vimrc %VIMPATH%\_vimrc /Y
xcopy .vim\* %VIMPATH%\vimfiles\ /S/Y