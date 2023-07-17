*&---------------------------------------------------------------------*
*& Report zot_09_p_internal_tables
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_09_p_internal_tables.

DATA: lt_mat_int TYPE TABLE OF ZOT_00_T_MATERIA,
      ls_mat_int TYPE ZOT_00_T_MATERIA.

SELECT * FROM ZOT_00_T_MATERIA INTO TABLE lt_mat_int.

DATA: lt_mat TYPE TABLE OF ZOT_00_T_MATERIA,
      ls_mat TYPE ZOT_00_T_MATERIA,
      lv_matnr TYPE c.

SELECT MAX( matnr ) FROM ZOT_00_T_MATERIA INTO lv_matnr.


DO 5 TIMES.

  lv_matnr += 1.
  ls_mat-matnr = lv_matnr.
  CASE sy-index.
  WHEN 1.
    ls_mat-maktx = 'Levye'.
  WHEN 2.
    ls_mat-maktx = 'Çivi'.
  WHEN 3.
    ls_mat-maktx = 'Çekiç'.
  WHEN 4.
    ls_mat-maktx = 'Pense'.
  WHEN 5.
    ls_mat-maktx = 'Vida'.
  ENDCASE.
  ls_mat-matkl = 'C'.
  ls_mat-menge = CEIL( ( sy-index * sy-index * 26 / 3 ) ). " Like a random number.
  ls_mat-meins = 'ST'.

  APPEND ls_mat TO lt_mat.
  CLEAR: ls_mat.
ENDDO.

LOOP AT lt_mat_int INTO ls_mat WHERE meins = 'ST'.
    ls_mat-menge = ls_mat-menge + 10.
ENDLOOP.

DATA lt_combined_table TYPE TABLE OF ZOT_00_T_MATERIA.


LOOP AT lt_mat_int INTO ls_mat_int.
  APPEND ls_mat_int TO lt_combined_table.
ENDLOOP.

LOOP AT lt_mat INTO ls_mat.
  APPEND ls_mat TO lt_combined_table.
ENDLOOP.

DATA:  lt_mat2 TYPE TABLE OF ZOT_00_T_MATERIA,
       ls_mat2 TYPE ZOT_00_T_MATERIA.

LOOP AT lt_combined_table INTO ls_mat.
  ls_mat2-matkl = ls_mat-matkl.
  ls_mat2-menge = ls_mat-menge.
  COLLECT ls_mat2 INTO lt_mat2.
  CLEAR ls_mat2.
ENDLOOP.

DELETE lt_combined_table WHERE menge < 10.

SORT lt_combined_table ASCENDING BY menge.

SORT lt_mat2 DESCENDING BY menge.

cl_demo_output=>display_data( lt_combined_table ).
cl_demo_output=>display_data( lt_mat2 ).
