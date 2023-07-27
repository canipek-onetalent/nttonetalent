*&---------------------------------------------------------------------*
*& Report zot_09_p_deneme
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_09_p_deneme.


*DATA lv_randint TYPE I.
*
*
*DO 16 TIMES.
*
*CALL FUNCTION 'QF05_RANDOM_INTEGER'
*  EXPORTING
*    ran_int_max = 16
*    ran_int_min = 1
*  IMPORTING
*    ran_int = lv_randint
*  EXCEPTIONS
*    invalid_input = 1
*    OTHERS = 2.
* WRITE lv_randint.
* ENDDO.
*
*
*
*
*DESCRIBE FIELD lv_randint TYPE DATA(lv_string_type).
*
*WRITE lv_string_type.
*
*DATA: lv_numbers TYPE TABLE OF i,
*      lv_value   TYPE i VALUE 40.
*
** Veri tablosuna bazı değerler ekleyelim
*APPEND 10 TO lv_numbers.
*APPEND 20 TO lv_numbers.
*APPEND 30 TO lv_numbers.
*APPEND 40 TO lv_numbers.
*
** Değerin veri tablosunda olup olmadığını kontrol etmek
*READ TABLE lv_numbers WITH KEY table_line = lv_value TRANSPORTING NO FIELDS.
*IF sy-subrc = 0.
*  WRITE 'Değer bulundu.'.
*ELSE.
*  WRITE 'Değer bulunamadı.'.
*ENDIF.



DATA: gv_deneme TYPE c LENGTH 6,
      gv_deneme2 type i VALUE 0.

gv_deneme = '123456'.

DO 6 TIMES.

WRITE gv_deneme+gv_deneme2(1).
gv_deneme2 = sy-index.

ENDDO.
