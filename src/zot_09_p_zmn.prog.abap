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

DATA: lv_datid1 TYPE i,
      lv_datid2 TYPE i,
      lv_diff  TYPE p,
      lv_tdiff TYPE p,

      lv_years TYPE p,
      lv_months TYPE p,
      lv_days   TYPE p,

      lv_hrs TYPE p,
      lv_mins TYPE p,
      lv_secs TYPE p.

lv_datid1 = s_datid-low.   " İlk tarih
lv_datid2 = s_datid-high.  " İkinci tarih


WHILE lv_datid1 LE lv_datid2.

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
              lv_years = FLOOR( lv_diff / 365 ).              " Yıl hesabı
              lv_months = FLOOR( ( lv_diff MOD 365 ) / 30 ).  " Ay hesabı
              lv_days = ( lv_diff MOD 365 ) MOD 30.           " Gün hesabı


              lv_tdiff = lv_endtime - lv_starttime.
              lv_hrs = FLOOR( lv_tdiff / 3600 ).              " Saat hesabı
              lv_mins = FLOOR( ( lv_tdiff MOD 3600 ) / 60 ).  " Dakika hesabı
              lv_secs = ( lv_tdiff MOD 3600 ) MOD 60.         " Saniye hesabı

              WRITE: | Entry of index { lv_datid1 }: |,
                     COND #( WHEN lv_years NE 0 THEN | { lv_years } Years | ) .
              WRITE  COND #( WHEN lv_months NE 0 THEN | { lv_months } Months |  ) .
              WRITE  COND #( WHEN lv_days NE 0 THEN | { lv_days } Days |  ) .
              WRITE  COND #( WHEN lv_hrs NE 0 THEN | { lv_hrs } Hours |  ) .
              WRITE  COND #( WHEN lv_mins NE 0 THEN | { lv_mins } Mins |  ) .
              WRITE  COND #( WHEN lv_secs NE 0 THEN | { lv_secs } Seconds |  ) .

              NEW-LINE.

              lv_datid1 = lv_datid1 + 1.

        ELSE.
           MESSAGE 'Please enter an index interval between 0 and 4.' TYPE 'W'.

        ENDIF.
ENDWHILE.

MESSAGE | Fields whose value is calculated as "0" won't be printed as mentioned in the assignment. - Can İpek | TYPE 'I'.
