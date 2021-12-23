;Лабораторная работа №3
;Выполнил ст. гр. УИС-311 Баклашкин А.А.
;Вариант 12
; A="Б"
; B="А"
; R=BH
; i=6
; j=5
; k=4
;=========================================
.486
.model flat, stdcall
option casemap: none
.stack 100h
;=========================================
include <\masm32\include\windows.inc>
include <\masm32\include\user32.inc>
include <\masm32\include\kernel32.inc>
includelib <\masm32\lib\user32.lib>
includelib <\masm32\lib\kernel32.lib>
;=========================================
.data
A db 'Б'
B db 'а'
tit db 'Result: ',0
rez db ? ,0
;=========================================
.code
main:
mov bh,A ; Помеcтить значение А в регистр Bh
and bh,B ; Логическое умножение А и B
or bh,B ; Логическое сложение
;(A AND B) OR B => Bh
test bh,01000000b ; Проверка значения 6-го бита в регистре Bh
jz int1 ; Переход к метке int1, если он равен 0
and bh,11110111b ; Записываем 0 в 4-ой бит регистра Bh
jmp int2 ; Переход к операции инвертирования
int1:
or bh,10000000b ;Записываем 1 в 7-ой бит регистра Bh
int2:
xor bh,00100000b ;Инвертирируем 5-й бит регистра BL
ror bh,4 ; Циклически меняем местами
cmp bh, 32 ;Сравниваем Bh с 32
jnb fin ;Переходим на метку, если не меньше 32
or bh, 00100000b ;Прибавляем 32 к Bh
fin: mov rez, bh ;Запись кода символа в rez
INVOKE MessageBox, 0, OFFSET rez, OFFSET tit, 0
invoke ExitProcess, 0
end main