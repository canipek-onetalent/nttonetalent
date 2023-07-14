*&---------------------------------------------------------------------*
*& Report zot_09_fibonacci
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_09_fibonacci.


SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.
  PARAMETERS: p_max TYPE i,
              p_satir TYPE int1.


SELECTION-SCREEN END OF BLOCK b1.


  DATA: lv_sayi1 TYPE i VALUE 0,
        lv_sayi2 TYPE i VALUE 1,
        lv_sayi TYPE i.


START-OF-SELECTION.


IF p_satir LE 9 AND p_satir GT 0.
IF p_max LE 10000 AND p_max GT 0.



WHILE lv_sayi < p_max.

    DO p_satir TIMES.

        lv_sayi = lv_sayi1 + lv_sayi2.


        IF lv_sayi GE p_max.
            EXIT.
        ELSE.

        ENDIF.

        WRITE lv_sayi.

        lv_sayi1 = lv_sayi2.
        lv_sayi2 = lv_sayi.


     ENDDO.

    WRITE /.

ENDWHILE.


ELSE.
MESSAGE 'Maksimum değer için 1 ile 10000 arasında bir sayı giriniz.' TYPE 'W'.
ENDIF.
ELSE.
MESSAGE 'Kırılım sayısı için 1 ile 9 arasında bir sayı giriniz.' TYPE 'W'.
ENDIF.
