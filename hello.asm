;Лабораторная работа №1 
;Выполнил ст. гр. УИС-311 Баклашкин А.А.
;Программа 1 (HELLO.ASM)
.486 
.model flat, stdcall ;Тип используемой модели памяти (5)
option casemap: none 
.stack 100h ;Определяется сегмент стека размером 256 байт (7)
;Подключение необходимых системных модулей и библиотек (8)
include I:\masm32\include\windows.inc; (9)
include I:\masm32\include\user32.inc; (10)
include I:\masm32\include\kernel32.inc; (11)
includelib I:\masm32\lib\user32.lib; (12)
includelib I:\masm32\lib\kernel32.lib; (13)
.data ;Начало сегмента данных (14)
tit db 'Привет, мир',0 ;Переменная - заголовок окна (15)
hello db'Здравствуйте, я Баклашкин Алексей!',0;Резервируется память (16)
 ;для переменной Hello
.code ;Начало сегмента кода (17)
main: ;Метка, обозначающая точку входа в программу (18
push 0 ;Дескриптор окна (19)
push offset tit ;Заголовок окна (20)
push offset hello ;Текст для вывода (21)
push 0 ;Стиль окна (0 – окно с кнопкой ОК) (22)
call MessageBox ;Вызов функции вывода на экран (23)
push 0 ;Код завершения (24)
call ExitProcess ;Завершаем работу программы (25)
end main 