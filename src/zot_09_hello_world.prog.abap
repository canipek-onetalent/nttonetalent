*&---------------------------------------------------------------------*
*& Report zot_09_hello_world
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_09_hello_world.

WRITE: 'HELLO',
       'WORLD'.

DATA: sayi1 TYPE i,
      sayi2 TYPE i,
      kalan TYPE i.

sayi1 = 10.
sayi2 = 3.

kalan = sayi1 MOD sayi2.

WRITE: 'Kalan:', kalan..
