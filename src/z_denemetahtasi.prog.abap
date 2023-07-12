*&---------------------------------------------------------------------*
*& Report z_denemetahtasi
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_denemetahtasi.


DATA: lv_number1 TYPE i VALUE 10,
      lv_number2 TYPE i VALUE 5,
      lv_op      TYPE c VALUE '*',
      lv_result  TYPE i.

CALL FUNCTION 'ZOT_09_D3_FUNC'
  EXPORTING
    iv_number1   = lv_number1
    iv_number2   = lv_number2
    iv_operation = lv_op
  IMPORTING
    ev_result    = lv_result
  EXCEPTIONS
    cx_sy_zerodivide = 1
    cx_sy_assign_cast_error.
