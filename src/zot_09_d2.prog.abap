*&---------------------------------------------------------------------*
*& Report zot_09_d2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_09_d2.

*cl_demo_output=>write( 'Hello World' ).
*
*DATA: gv_ogradi TYPE c LENGTH 3, "predefined
*      gv_ogrsoyadi TYPE char12, "data element
*      gv_tarih Type sy-datum.
*
*gv_ogradi = 'can'.
*gv_ogrsoyadi = 'ipek'.
*gv_tarih = sy-datum.
*
*cl_demo_output=>write( gv_ogradi ).
*cl_demo_output=>write( gv_ogrsoyadi ).
*cl_demo_output=>write( gv_tarih ).
*
*cl_demo_output=>write( |AD: { gv_ogradi } SOYAD: { gv_ogrsoyadi } TARIH: { gv_tarih }| ).
*
*TYPES: gty_char TYPE c LENGTH 50.
*DATA gy_new TYPE gty_char.
*
*DATA gv_langu TYPE sy-langu.
*gv_langu = sy-langu.
*
*IF gv_langu = 'T'.
*cl_demo_Output=>write( 'merhaba' ).
*ELSEIF gv_langu = 'E'.
*cl_demo_Output=>write( 'hello' ).
*ELSE.
*cl_demo_Output=>write( 'O' ).
*ENDIF.
*
*CASE gv_langu.
*WHEN 'T'.
*cl_demo_Output=>write( 'MERHABA' ).
*WHEN 'E'.
*cl_demo_Output=>write( 'HELLO' ).
*WHEN OTHERS.
*cl_demo_Output=>write( 'O' ).
*ENDCASE.
*
*
*
*DATA gv_text1 TYPE char12.
*gv_text1 = 'HI'.
*
*DATA(gv_text2) = 'HELLO WORLD'. " 11 Haneli char olarak tanımlanır.
*
*
*DO 5 TIMES.
*cl_demo_Output=>write( gv_text1 ).
*ENDDO.
*
*DATA(gv_num1) = 1923.
*
*WHILE gv_num1 LE 2023.
*cl_demo_Output=>write( |The Year Is: { gv_num1 }| ).
*gv_num1 = gv_num1 + 1.
*ENDWHILE.
*
** CLEAR lv_xyz.     Değişkene atanan değeri temizler.
*
*data: lv_number1 type i,
*      lv_number2 type i,
*      lv_bolme type i.
*
**TRY.
**  lv_bolme = lv_number1 / lv_number2.
**CATCH cx_sy_zerodivide.
**  cl_demo_output => write( 'Sıfıra bölme işlemi yapılamaz!' ).
**ENDTRY.
*
*TYPES: gty_tip TYPE c LENGTH 12.
*TYPES: BEGIN OF gty_komplex,
*       alan1 TYPE c LENGTH 10,
*       alan2 TYPE c LENGTH 12,
*       alan3 TYPE i,
*       END OF gty_komplex.
*
*TYPES: BEGIN OF gty_student,
*       name TYPE c LENGTH 10,
*       age TYPE i,
*       id TYPE c LENGTH 10,
*       bolum TYPE c LENGTH 20,
*       END OF gty_student.
*
*
*DATA: gv_alan1 TYPE gty_tip,
*      gs_komplex TYPE gty_komplex,
*      gv_alan2 TYPE gty_komplex-alan2.
*
*
*
*gv_alan1 = 'Hello World'.
*gs_komplex-alan1 = 'One'.
*gs_komplex-alan2 = 'Talent'.
*gs_komplex-alan3 = 23.
*
*
**gt_komplex = VALUE #( ( ALAN1 = 'A' alan2 = 'B' alan3 = 1 )
**                    ( ALAN1 = 'C' alan2 = 'D' alan3 = 2 )
**                    ( ALAN1 = 'E' alan2 = 'F' alan3 = 3 ) )
*
*
**APPEND VALUE #(   ) TO gt_complex.
*
*selection-screen BEGIN OF BLOCK b1 with frame title text-009.
*
*PARAMETERS: p_val1 TYPE i,
*            p_val2 TYPE i.
*
*selection-screen END OF BLOCK b1.
*
*selection-screen BEGIN OF BLOCK b2 with frame title text-002.
*
*PARAMETERS: p_topla RADIOBUTTON GROUP g1,
*            p_cikar RADIOBUTTON GROUP g1,
*            p_carp RADIOBUTTON GROUP g1,
*            p_bol RADIOBUTTON GROUP g1.
*
*selection-screen END OF BLOCK b2.
*
*cl_demo_output=>display(  ).


DATA: lv_datid1 TYPE i,
      lv_datid2 TYPE i,
      lv_diff  TYPE DATS,
      lv_tdiff TYPE p,

      lv_years TYPE p,
      lv_months TYPE p,
      lv_days   TYPE p,

      lv_hrs TYPE p,
      lv_mins TYPE p,
      lv_secs TYPE p,

      lv_string TYPE string,
      lv_integer TYPE i,

      s_datid_low TYPE i VALUE 0,
      s_datid_high TYPE i VALUE 4.

lv_datid1 = s_datid_low.   " İlk tarih
lv_datid2 = s_datid_high.  " İkinci tarih


        SELECT SINGLE end_date " Bitiş günü
        FROM ZOT_09_T_ZMN
        INTO @DATA(lv_enddate)
        WHERE zmn_id EQ @lv_datid1.

        SELECT SINGLE start_date " Başlangıç günü
        FROM ZOT_09_T_ZMN
        INTO @DATA(lv_startdate)
        WHERE zmn_id EQ @lv_datid1.

        SELECT SINGLE end_time " Bitiş saniyesi
        FROM ZOT_09_T_ZMN
        INTO @DATA(lv_endtime)
        WHERE zmn_id EQ @lv_datid1.

        SELECT SINGLE start_time " Başlangıç saniyesi
        FROM ZOT_09_T_ZMN
        INTO @DATA(lv_starttime)
        WHERE zmn_id EQ @lv_datid1.


        IF sy-subrc = 0.





              lv_diff = lv_enddate - lv_startdate.
                WRITE lv_diff.


              lv_string = lv_diff.
                WRITE lv_string.


              lv_years = lv_string+0(4).                      " Yıl
                WRITE lv_years.

              lv_months = lv_string+4(2).                     " Ay
                WRITE lv_months.

              lv_days = lv_string+6(2).                       " Gün
                WRITE lv_days.
         ENDIF.
