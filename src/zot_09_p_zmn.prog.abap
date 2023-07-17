*&---------------------------------------------------------------------*
*& Report zot_09_p_zmn
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_09_p_zmn.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.


  TABLES: ZOT_09_T_ZMN.
  SELECT-OPTIONS: s_datid FOR zot_09_t_zmn-zmn_id.

SELECTION-SCREEN END OF BLOCK b1.

DATA: gv_datid1 TYPE i,
      gv_datid2 TYPE i,
      lv_diff  TYPE DATS,
      lv_tdiff TYPE p,

      lv_years TYPE p,
      lv_months TYPE p,
      lv_days   TYPE p,

      lv_hrs TYPE p,
      lv_mins TYPE p,
      lv_secs TYPE p,

      lv_enddate TYPE DATS,
      lv_startdate TYPE DATS,

      lv_integer TYPE i.

IF s_datid is INITIAL.
gv_datid1 = 0.   " İlk tarih
gv_datid2 = 4.  " İkinci tarih


ELSE.
gv_datid1 = s_datid-low.   " İlk tarih
gv_datid2 = s_datid-high.  " İkinci tarih

ENDIF.

WHILE gv_datid1 LE gv_datid2.

        SELECT SINGLE end_date " Bitiş günü
        FROM ZOT_09_T_ZMN
        INTO @lv_enddate
        WHERE zmn_id EQ @gv_datid1.

        SELECT SINGLE start_date " Başlangıç günü
        FROM ZOT_09_T_ZMN
        INTO @lv_startdate
        WHERE zmn_id EQ @gv_datid1.

        SELECT SINGLE end_time " Bitiş saniyesi
        FROM ZOT_09_T_ZMN
        INTO @DATA(lv_endtime)
        WHERE zmn_id EQ @gv_datid1.

        SELECT SINGLE start_time " Başlangıç saniyesi
        FROM ZOT_09_T_ZMN
        INTO @DATA(lv_starttime)
        WHERE zmn_id EQ @gv_datid1.


        IF sy-subrc = 0.

              lv_diff = lv_enddate - lv_startdate.
              lv_integer = lv_diff.

*********  Bu bölümün neden yanlış sonuç verdiği dersete sorulacak  ***********

*              lv_years = lv_diff+0(4).                           " Yıl
*              lv_months = lv_diff+4(2).                          " Ay
*              lv_days = lv_diff+6(2).                            " Gün

*******************************************************************************

              lv_years = FLOOR( lv_integer / 365 ).                 " Yıl
              lv_months = FLOOR( ( lv_integer MOD 365 ) / 30 ).     " Ay
              lv_days = ( lv_integer MOD 365 ) MOD 30.              " Gün


              lv_tdiff = lv_endtime - lv_starttime.
              lv_hrs = FLOOR( lv_tdiff / 3600 ).                    " Saat
              lv_mins = FLOOR( ( lv_tdiff MOD 3600 ) / 60 ).        " Dakika
              lv_secs = ( lv_tdiff MOD 3600 ) MOD 60.               " Saniye

              WRITE: | Entry of index { gv_datid1 }: |,
                     COND #( WHEN lv_years NE 0 THEN | { lv_years } Years | ) .
              WRITE  COND #( WHEN lv_months NE 0 THEN | { lv_months } Months |  ) .
              WRITE  COND #( WHEN lv_days NE 0 THEN | { lv_days } Days |  ) .
              WRITE  COND #( WHEN lv_hrs NE 0 THEN | { lv_hrs } Hours |  ) .
              WRITE  COND #( WHEN lv_mins NE 0 THEN | { lv_mins } Mins |  ) .
              WRITE  COND #( WHEN lv_secs NE 0 THEN | { lv_secs } Seconds |  ) .

              NEW-LINE.

              gv_datid1 = gv_datid1 + 1.

        ELSE.
           MESSAGE 'Please enter an index interval between 0 and 4.' TYPE 'W'.

        ENDIF.
ENDWHILE.

MESSAGE | Fields whose value is calculated as "0" won't be printed as mentioned in the assignment. - Can İpek | TYPE 'I'.
