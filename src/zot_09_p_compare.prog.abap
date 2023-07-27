*&---------------------------------------------------------------------*
*& Report zot_09_p_compare
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_09_p_compare.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.

  PARAMETERS: p_TEXT1 TYPE c LENGTH 6,
              p_TEXT2 TYPE c LENGTH 6,
              p_TEXT3 TYPE c LENGTH 6,
              p_TEXT4 TYPE c LENGTH 6,
              p_TEXT5 TYPE c LENGTH 6.

SELECTION-SCREEN END OF BLOCK b1.

DATA: lv_search_char   TYPE string,
      lv_target_string TYPE string,
      lv_field1        TYPE string,
      lv_control       TYPE bool VALUE abap_true,
      lv_control2      TYPE i VALUE 0,
      gv_text          TYPE c LENGTH 6,
      lv_row_to_delete TYPE i.

TYPES: BEGIN OF ty_control,
         field TYPE c LENGTH 6,
       END OF ty_control.

DATA: lt_control TYPE TABLE OF ty_control,
      ls_control TYPE ty_control.

DO 5 TIMES.

  CASE sy-index.
    WHEN 1.
      gv_text = p_TEXT1.
    WHEN 2.
      gv_text = p_TEXT2.
    WHEN 3.
      gv_text = p_TEXT3.
    WHEN 4.
      gv_text = p_TEXT4.
    WHEN 5.
      gv_text = p_TEXT5.
  ENDCASE.

  ls_control-field = gv_text.
  APPEND ls_control TO lt_control.

ENDDO.

CLEAR gv_text.

TYPES: BEGIN OF ty_internal_table,
         field1 TYPE c LENGTH 6,
         field2 TYPE c LENGTH 6,
       END OF ty_internal_table.

DATA: lt_internal_table TYPE TABLE OF ty_internal_table,
      ls_structure      TYPE ty_internal_table.

DO 5 TIMES.

  CASE sy-index.
    WHEN 1.
      gv_text = p_TEXT1.
    WHEN 2.
      gv_text = p_TEXT2.
    WHEN 3.
      gv_text = p_TEXT3.
    WHEN 4.
      gv_text = p_TEXT4.
    WHEN 5.
      gv_text = p_TEXT5.
  ENDCASE.

  ls_structure-field1 = p_text1.
  ls_structure-field2 = gv_text.
  APPEND ls_structure TO lt_internal_table.

  ls_structure-field1 = p_text2.
  ls_structure-field2 = gv_text.
  APPEND ls_structure TO lt_internal_table.

  ls_structure-field1 = p_text3.
  ls_structure-field2 = gv_text.
  APPEND ls_structure TO lt_internal_table.

  ls_structure-field1 = p_text4.
  ls_structure-field2 = gv_text.
  APPEND ls_structure TO lt_internal_table.

  ls_structure-field1 = p_text5.
  ls_structure-field2 = gv_text.
  APPEND ls_structure TO lt_internal_table.

ENDDO.

DO 5 TIMES.
  lv_row_to_delete = ( sy-index - 1 ) * 5 + 1.
  DELETE lt_internal_table INDEX lv_row_to_delete.
ENDDO.

CLEAR ls_structure.

LOOP AT lt_internal_table INTO ls_structure.


  DO 6 TIMES.
    lv_target_string = ls_structure-field2.
    lv_field1 = ls_structure-field1.

    lv_search_char = lv_field1+lv_control2(1).

    FIND lv_search_char IN lv_target_string.
    IF sy-subrc NE 0.
      lv_control = abap_false.
      EXIT.
    ENDIF.

    CLEAR: lv_search_char, lv_target_string, lv_field1.

    lv_target_string = ls_structure-field1.
    lv_field1 = ls_structure-field2.

    lv_search_char = lv_field1+lv_control2(1).
    lv_control2 += 1.

    FIND lv_search_char IN lv_target_string.
    IF sy-subrc NE 0.
      lv_control = abap_false.
      EXIT.
    ENDIF.

    lv_control = abap_true.
    CLEAR: lv_search_char, lv_target_string.

  ENDDO.

  IF lv_control = abap_true.
    WRITE: ls_structure-field1, ls_structure-field2, /.
    DELETE lt_control WHERE field EQ ls_structure-field1 OR field EQ ls_structure-field2.
    DELETE lt_internal_table WHERE field1 EQ ls_structure-field2 AND field2 EQ ls_structure-field1.
  ENDIF.

  lv_control = abap_true.
  lv_control2 = 0.
  CLEAR: lv_search_char, lv_target_string, lv_field1.

ENDLOOP.

LOOP AT lt_control INTO ls_control.
  WRITE: ls_control-field, / .
ENDLOOP.
