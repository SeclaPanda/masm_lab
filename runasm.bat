rem Командный файл для выполнения EXE программ
rem Программист Баклашкин Алексей
@echo off
    if exist "%1.obj" del "%1.obj"
    if exist "%1.exe" del "%1.exe"
echo Ассемблирование
i:\masm32\bin\ml /c /coff /Sn /Fl"%1.lst" "%1.asm"
    if errorlevel 1 goto errasm
echo Редактирование связей
i:\masm32\bin\PoLink /SUBSYSTEM:WINDOWS "%1.obj"
    if errorlevel 1 goto errlink
    dir "%1.*"
    goto TheEnd
:errlink
    echo _
    echo Link error
    goto TheEnd
:errasm
    echo _
    echo Assembly Error 
    goto TheEnd
:TheEnd
    echo Выполнение
    "%1.exe" 