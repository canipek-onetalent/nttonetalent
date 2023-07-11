*&---------------------------------------------------------------------*
*& Report zot_09_calculator_in_4_lines
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_09_calculator_in_4_lines.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.
  PARAMETERS: p_val1 TYPE i, p_val2 TYPE i.
SELECTION-SCREEN END OF BLOCK b1.

SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE TEXT-002.
  PARAMETERS: p_topla RADIOBUTTON GROUP g1, p_cikar RADIOBUTTON GROUP g1, p_carp  RADIOBUTTON GROUP g1, p_bol   RADIOBUTTON GROUP g1, p_ort   RADIOBUTTON GROUP g1.
 DATA         p_sonuc TYPE i.
SELECTION-SCREEN END OF BLOCK b2.

START-OF-SELECTION.

CASE 'X'. WHEN p_topla. p_sonuc = p_val1 + p_val2.
WHEN p_cikar. p_sonuc = p_val1 - p_val2.
WHEN p_carp. p_sonuc = p_val1 * p_val2.
WHEN p_bol. p_sonuc = p_val1 / p_val2. ENDCASE. WRITE p_sonuc.
