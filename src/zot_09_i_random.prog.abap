*&---------------------------------------------------------------------*
*& Include zot_09_i_random
*&---------------------------------------------------------------------*


CALL FUNCTION 'QF05_RANDOM_INTEGER'
  EXPORTING
    ran_int_max = 16
    ran_int_min = 1
  IMPORTING
    ran_int = lv_randint
  EXCEPTIONS
    invalid_input = 1
    OTHERS = 2.
