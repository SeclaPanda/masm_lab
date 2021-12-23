;Лабораторная работа №2
;Выполнил ст. гр. УИС-311 Баклашкин Алексей
;Вариант 12
;    -43+6X, X<=40
;Y=  10-200/X, 40<X<=150
;    X+99, X>150
;=========================================
.486
.model flat, stdcall
option casemap: none
.stack 100h
;=========================================
include <\masm32\include\kernel32.inc>
includelib <\masm32\lib\kernel32.lib>
;=========================================
.data
x db 151
y db ?
myerr db 0
;=========================================
.code
main:
cmp x, 40 ; х<=40 ?
ja int2 ; если x>40 перейти к метке int2
; вычисление -43+6x
mov bl, 6
mov al, x 
mul bl ; al:=ax*bl=6X
mov bl, 43
sub al, bl; al:=-43 + 6x
jc osh ; если есть перенос - ошибка, перейти к метке osh
jmp fin ; перейти к метке fin
;=========================================
int2:
cmp x, 150 ; х<150 ?
ja int3 ; если x>150 перейти к метке int3
; вычисление 10-200/X
mov ax, 200
mov bl, x
xor edx,edx
div bl; al:=200/X
mov bl, al 
mov al, 10
sub al, bl; al:=10-200/X
jc osh ; если есть перенос - ошибка, перейти к метке osh
jmp fin ; перейти к метке fin
; вычисление X+99
int3:
movzx ax, x
add ax, 99 ; al:=X+99
jnc fin ; если флаг переноса не установлен перейти к fin
osh: mov myerr, 1 ; установить код ошибки
jmp exit ; перейти к метке exit
;=========================================
fin: mov y, al ; сформировать результат в переменной y
exit: mov al, myerr ; код завершения программы
invoke ExitProcess, al
end main