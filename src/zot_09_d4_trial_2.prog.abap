*&---------------------------------------------------------------------*
*& Report zot_09_d4_trial_2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_09_d4_trial_2.
SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.
  PARAMETERS: p_sayi1 TYPE i,
              p_sayi2 TYPE i.
SELECTION-SCREEN END OF BLOCK b1.
SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE TEXT-002.
  PARAMETERS: p_topla RADIOBUTTON GROUP g1,
              p_cikar RADIOBUTTON GROUP g1,
              p_carp  RADIOBUTTON GROUP g1,
              p_bol   RADIOBUTTON GROUP g1.
SELECTION-SCREEN END OF BLOCK b2.
START-OF-SELECTION.
IF p_bol = 'X' AND p_sayi2 = 0.
    MESSAGE 'Error in division by zero' TYPE 'E'.
    EXIT.
  ENDIF.
DATA(gv_sayi1) = p_sayi1.
DATA(gv_sayi2) = p_sayi2.
DATA gv_sonuc TYPE p decimals 5.
if p_topla = 'X'.
     gv_sonuc = gv_sayi1 + gv_sayi2.
elseif p_cikar = 'X'.
     gv_sonuc = gv_sayi1 - gv_sayi2.
  elseif p_carp = 'X'.
     gv_sonuc = gv_sayi1 * gv_sayi2.
  elseif p_bol = 'X'.
     gv_sonuc = gv_sayi1 / gv_sayi2.
 endif.

  cl_demo_output=>write( gv_sonuc ).
  cl_demo_output=>display( ).
