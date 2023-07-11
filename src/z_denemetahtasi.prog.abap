*&---------------------------------------------------------------------*
*& Report z_denemetahtasi
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_denemetahtasi.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.
  PARAMETERS: p_val1 TYPE i,
              p_val2 TYPE i.

SELECTION-SCREEN COMMENT 2(10) Sayı_1 FOR FIELD p_val1.
SELECTION-SCREEN COMMENT 2(10) Sayı_2 FOR FIELD p_val2.

SELECTION-SCREEN END OF BLOCK b1.

SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE TEXT-002.
  PARAMETERS: p_topla RADIOBUTTON GROUP g1,
              p_cikar RADIOBUTTON GROUP g1,
              p_carp  RADIOBUTTON GROUP g1,
              p_bol   RADIOBUTTON GROUP g1,
              p_ort   RADIOBUTTON GROUP g1.
DATA p_sonuc TYPE p DECIMALS 2.
SELECTION-SCREEN END OF BLOCK b2.

START-OF-SELECTION.

IF p_val1 IS INITIAL OR p_val2 IS INITIAL.
  MESSAGE 'Boş değer girişi yapılamaz' TYPE 'W'.
ELSE.
  CASE 'X'.
    WHEN p_topla.
      p_sonuc = p_val1 + p_val2.
    WHEN p_cikar.
      p_sonuc = p_val1 - p_val2.
    WHEN p_carp.
      p_sonuc = p_val1 * p_val2.
    WHEN p_bol.
      TRY.
        p_sonuc = p_val1 / p_val2.
      CATCH cx_sy_zerodivide.
        MESSAGE 'Sıfıra bölme işlemi yapılamaz' TYPE 'E'.
      ENDTRY.
    WHEN p_ort.
      p_sonuc = ( p_val1 + p_val2 ) / 2.
  ENDCASE.

  WRITE p_sonuc.
ENDIF.
