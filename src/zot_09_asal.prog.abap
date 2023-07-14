*&---------------------------------------------------------------------*
*& Report zot_09_asal
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_09_asal.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.
  PARAMETERS: p_ilk TYPE i,
              p_son TYPE i.

DATA lv_num TYPE i VALUE 2.

SELECTION-SCREEN END OF BLOCK b1.

START-OF-SELECTION.

IF p_ilk > p_son.
    MESSAGE 'ilk değer son değerden büyük olamaz!' TYPE 'W'.
ELSE.

WHILE p_ilk LE p_son.

    WHILE lv_num LE p_ilk.
        IF p_ilk MOD lv_num NE 0.
            lv_num = lv_num + 1.

        ELSEIF lv_num = p_ilk.
            WRITE / lv_num.
            lv_num = p_ilk + 1.

        ELSE.
            lv_num = p_ilk + 1.

        ENDIF.
    ENDWHILE.

    p_ilk = p_ilk + 1.
    lv_num = 2.

    ENDWHILE.
ENDIF.
