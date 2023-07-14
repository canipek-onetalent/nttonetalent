*&---------------------------------------------------------------------*
*& Report zot_09_sirali_dizim
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_09_sirali_dizim.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.
  PARAMETERS: p_max TYPE int1,
              p_satir TYPE int1.

  DATA p_sayi TYPE i.
  p_sayi = 1.

SELECTION-SCREEN END OF BLOCK b1.



START-OF-SELECTION.


IF p_max LE 100 AND p_max GT 0.
IF p_satir LE 9 AND p_satir GT 0.
    WHILE p_sayi LT p_max.

      IF p_max - p_sayi > p_satir.

        DO p_satir TIMES.
          WRITE p_sayi.
          p_sayi = p_sayi + 1.
          ENDDO.

        WRITE /.

      ELSE.
          DO p_max - p_sayi + 1 TIMES.
          WRITE p_sayi.
          p_sayi = p_sayi + 1.
          ENDDO.
      ENDIF.

    ENDWHILE.
ELSE.
MESSAGE 'Kırılım sayısı için 1 ile 9 arasında bir sayı giriniz.' TYPE 'W'.
ENDIF.
ELSE.
MESSAGE 'Maksimum değer için 1 ile 100 arasında bir sayı giriniz.' TYPE 'W'.
ENDIF.
