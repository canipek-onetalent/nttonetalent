*&---------------------------------------------------------------------*
*& Report zot_09_p_sports
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_09_p_sports.

INCLUDE zot_09_i_sports_top.

DATA: gt_A TYPE TABLE OF gty_grup,
      gt_B TYPE TABLE OF gty_grup,
      gt_C TYPE TABLE OF gty_grup,
      gt_D TYPE TABLE OF gty_grup.

gt_sports = VALUE #( BASE gt_sports ( id = 1
                                      takim_adi = 'Liverpool'
                                      ulke_adi = 'EN'
                                      torba = 1
                                      )
                                      ( id = 2
                                      takim_adi = 'Bayern'
                                      ulke_adi = 'DE'
                                      torba = 1
                                      )
                                      ( id = 3
                                      takim_adi = 'Inter'
                                      ulke_adi = 'IT'
                                      torba = 1
                                      )
                                      ( id = 4
                                      takim_adi = 'PSG'
                                      ulke_adi = 'FR'
                                      torba = 1
                                       )
                                      ( id = 5
                                      takim_adi = 'ManC'
                                      ulke_adi = 'EN'
                                      torba = 2
                                      )
                                      ( id = 6
                                      takim_adi = 'PSV'
                                      ulke_adi = 'NE'
                                      torba = 2
                                       )
                                       ( id = 7
                                      takim_adi = 'Porto'
                                      ulke_adi = 'PO'
                                      torba = 2
                                       )
                                       ( id = 8
                                      takim_adi = 'Real Madrid'
                                      ulke_adi = 'ES'
                                      torba = 2
                                       )
                                       ( id = 9
                                      takim_adi = 'Dortmund'
                                      ulke_adi = 'DE'
                                      torba = 3
                                       )
                                       ( id = 10
                                      takim_adi = 'Galatasaray'
                                      ulke_adi = 'TR'
                                      torba = 3
                                       )
                                       ( id = 11
                                      takim_adi = 'Marsilya'
                                      ulke_adi = 'FR'
                                      torba = 3
                                       )
                                       ( id = 12
                                      takim_adi = 'Ajax'
                                      ulke_adi = 'NL'
                                      torba = 3
                                       )
                                       ( id = 13
                                      takim_adi = 'AEK'
                                      ulke_adi = 'GR'
                                      torba = 4
                                       )
                                       ( id = 14
                                      takim_adi = 'Roma'
                                      ulke_adi = 'IT'
                                      torba = 4
                                       )
                                       ( id = 15
                                      takim_adi = 'Steua B.'
                                      ulke_adi = 'RO'
                                      torba = 4
                                       )
                                       ( id = 16
                                      takim_adi = 'Atletico Madrid'
                                      ulke_adi = 'ES'
                                      torba = 4
                                       ) ).

DO 16 TIMES.

  LOOP AT gt_sports INTO DATA(ls_db).

    INCLUDE zot_09_i_random.
    READ TABLE gt_sports INTO DATA(ls_read) WITH KEY id = lv_randint.
    IF sy-subrc = 0.                                  " Aynı ID tekrar seçilmeyecek

      IF lines( gt_A ) < 4.                           " Gruptaki takım sayısı 4'ü geçmeyecek
        IF ls_read-ulke_adi NE ls_db-ulke_adi.        " Grupta aynı ülkeden takım bulunmayacak
          IF ls_read-torba EQ lv_control_a.           " Torbalardan sırayla takım seçilecek (1 seçildiyse 2, 2 seçildiyse 3)
            APPEND ls_read-takim_adi TO gt_A.         " Takımı ekle
            lv_control_a = lv_control_a + 1.          " Sırada seçilecek torbayı yeniden ata
            DELETE gt_sports WHERE id  = ls_read-id.  " Seçilen takımı interval table'dan kaldır
          ENDIF.
        ENDIF.
      ENDIF.
    ENDIF.





    INCLUDE zot_09_i_random.

    READ TABLE gt_sports INTO DATA(ls_read2) WITH KEY id = lv_randint.
    IF sy-subrc = 0.

      IF lines( gt_B ) < 4.
        IF ls_read2-ulke_adi NE ls_db-ulke_adi.
          IF ls_read2-torba EQ lv_control_b.
            APPEND ls_read2-takim_adi TO gt_B.
            lv_control_b = lv_control_b + 1.
            DELETE gt_sports WHERE id  = ls_read2-id.
          ENDIF.
        ENDIF.
      ENDIF.
    ENDIF.




    INCLUDE zot_09_i_random.

    READ TABLE gt_sports INTO DATA(ls_read3) WITH KEY id = lv_randint.
    IF sy-subrc = 0.

      IF lines( gt_C ) < 4.
        IF ls_read3-ulke_adi NE ls_db-ulke_adi.
          IF ls_read3-torba EQ lv_control_c.
            APPEND ls_read3-takim_adi TO gt_C.
            lv_control_c = lv_control_c + 1.
            DELETE gt_sports WHERE id  = ls_read3-id.
          ENDIF.
        ENDIF.
      ENDIF.
    ENDIF.



    INCLUDE zot_09_i_random.
    READ TABLE gt_sports INTO DATA(ls_read4) WITH KEY id = lv_randint.
    IF sy-subrc = 0.

      IF lines( gt_C ) < 4.
        IF ls_read3-ulke_adi NE ls_db-ulke_adi.
          IF ls_read3-torba EQ lv_control_d.
            APPEND ls_read4-takim_adi TO gt_D.
            lv_control_D = lv_control_D + 1.
            DELETE gt_sports WHERE id  = ls_read4-id.
          ENDIF.
        ENDIF.
      ENDIF.
    ENDIF.

  ENDLOOP.

ENDDO.

cl_demo_output=>write( gt_A ).
cl_demo_output=>write( gt_B ).
cl_demo_output=>write( gt_C ).
cl_demo_output=>write( gt_D ).
cl_demo_output=>display(  ).
