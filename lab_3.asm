;������������ ������ �3
;�������� ��. ��. ���-311 ��������� �.�.
;������� 12
; A="�"
; B="�"
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
A db '�'
B db '�'
tit db 'Result: ',0
rez db ? ,0
;=========================================
.code
main:
mov bh,A ; ����c���� �������� � � ������� Bh
and bh,B ; ���������� ��������� � � B
or bh,B ; ���������� ��������
;(A AND B) OR B => Bh
test bh,01000000b ; �������� �������� 6-�� ���� � �������� Bh
jz int1 ; ������� � ����� int1, ���� �� ����� 0
and bh,11110111b ; ���������� 0 � 4-�� ��� �������� Bh
jmp int2 ; ������� � �������� ��������������
int1:
or bh,10000000b ;���������� 1 � 7-�� ��� �������� Bh
int2:
xor bh,00100000b ;������������� 5-� ��� �������� BL
ror bh,4 ; ���������� ������ �������
cmp bh, 32 ;���������� Bh � 32
jnb fin ;��������� �� �����, ���� �� ������ 32
or bh, 00100000b ;���������� 32 � Bh
fin: mov rez, bh ;������ ���� ������� � rez
INVOKE MessageBox, 0, OFFSET rez, OFFSET tit, 0
invoke ExitProcess, 0
end main