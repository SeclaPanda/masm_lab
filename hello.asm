;������������ ������ �1 
;�������� ��. ��. ���-311 ��������� �.�.
;��������� 1 (HELLO.ASM)
.486 
.model flat, stdcall ;��� ������������ ������ ������ (5)
option casemap: none 
.stack 100h ;������������ ������� ����� �������� 256 ���� (7)
;����������� ����������� ��������� ������� � ��������� (8)
include I:\masm32\include\windows.inc; (9)
include I:\masm32\include\user32.inc; (10)
include I:\masm32\include\kernel32.inc; (11)
includelib I:\masm32\lib\user32.lib; (12)
includelib I:\masm32\lib\kernel32.lib; (13)
.data ;������ �������� ������ (14)
tit db '������, ���',0 ;���������� - ��������� ���� (15)
hello db'������������, � ��������� �������!',0;������������� ������ (16)
 ;��� ���������� Hello
.code ;������ �������� ���� (17)
main: ;�����, ������������ ����� ����� � ��������� (18
push 0 ;���������� ���� (19)
push offset tit ;��������� ���� (20)
push offset hello ;����� ��� ������ (21)
push 0 ;����� ���� (0 � ���� � ������� ��) (22)
call MessageBox ;����� ������� ������ �� ����� (23)
push 0 ;��� ���������� (24)
call ExitProcess ;��������� ������ ��������� (25)
end main 