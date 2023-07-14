*&---------------------------------------------------------------------*
*& Report zot_09_d3
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_09_d3.

*DATA: lv_number1 TYPE i VALUE 10,
*      lv_number2 TYPE i VALUE 5,
*      lv_op      TYPE c VALUE '*',
*      lv_result  TYPE i.
*
*CALL FUNCTION 'ZOT_09_D3_FUNC'
*  EXPORTING
*    iv_number1   = lv_number1
*    iv_number2   = lv_number2
*    iv_operation = lv_op
*  IMPORTING
*    ev_result    = lv_result
*  EXCEPTIONS
*    cx_sy_zerodivide = 1
*    cx_sy_assign_cast_error.
*
*
*
**************** DICTIONARY ******************
*
*
*TYPES: BEGIN OF lty_personel,
*       deneme TYPE zot_09_e_deneme,
*       int TYPE zot_09_e_deneme_2,
*       END OF lty_personel.
*
*DATA: ls_deneme TYPE zot_09_s_deneme,
*      lt_deneme TYPE TABLE OF zot_09_s_deneme.


DATA: lv_date1 TYPE dats,
      lv_date2 TYPE dats,
      lv_diff  TYPE i,
      lv_years TYPE i,
      lv_months TYPE i,
      lv_days   TYPE i.

lv_date1 = '20200714'.  " İlk tarih
lv_date2 = '20230801'.  " İkinci tarih

IF lv_date1 > lv_date2.
  lv_diff = lv_date1 - lv_date2.
ELSE.
  lv_diff = lv_date2 - lv_date1.
ENDIF.

lv_years = lv_diff / 365.              " Yıl hesabı
lv_months = ( lv_diff MOD 365 ) / 30.  " Ay hesabı
lv_days = ( lv_diff MOD 365 ) MOD 30.  " Gün hesabı

WRITE: 'Fark:', lv_years, 'Y', lv_months, 'A', lv_days, 'G'.
