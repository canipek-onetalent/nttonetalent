*&---------------------------------------------------------------------*
*& Report zot_09_p_cl
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_09_p_cl.

INCLUDE zot_09_i_sports_top.


DO 16 TIMES.

  LOOP AT gt_sports INTO DATA(ls_db).

    INCLUDE zot_09_i_random.
    READ TABLE gt_sports INTO DATA(ls_read) WITH KEY id = lv_randint.
    IF sy-subrc = 0.

      IF lines( gt_agrup ) < 4.
        IF ls_read-ulke_adi NE ls_db-ulke_adi.
          IF ls_read-torba EQ lv_control_a.
            APPEND ls_read-takim_adi TO gt_agrup.
            lv_control_a = lv_control_a + 1.
            DELETE gt_sports WHERE id  = ls_read-id.
          ENDIF.
        ENDIF.
      ENDIF.
    ENDIF.





    INCLUDE zot_09_i_random.

    READ TABLE gt_sports INTO DATA(ls_read2) WITH KEY id = lv_randint.
    IF sy-subrc = 0.


      IF lines( gt_bgrup ) < 4.
        IF ls_read2-ulke_adi NE ls_db-ulke_adi.
          IF ls_read2-torba EQ lv_control_b.
            APPEND ls_read2-takim_adi TO gt_bgrup.
            lv_control_b = lv_control_b + 1.
            DELETE gt_sports WHERE id  = ls_read2-id.
          ENDIF.

        ENDIF.
      ENDIF.
    ENDIF.




    INCLUDE zot_09_i_random.

    READ TABLE gt_sports INTO DATA(ls_read3) WITH KEY id = lv_randint.
    IF sy-subrc = 0.


      IF lines( gt_cgrup ) < 4.
        IF ls_read3-ulke_adi NE ls_db-ulke_adi.
          IF ls_read3-torba EQ lv_control_c.
            APPEND ls_read3-takim_adi TO gt_cgrup.
            lv_control_c = lv_control_c + 1.
            DELETE gt_sports WHERE id  = ls_read3-id.
          ENDIF.

        ENDIF.
      ENDIF.
    ENDIF.




    INCLUDE zot_09_i_random.
    READ TABLE gt_sports INTO DATA(ls_read4) WITH KEY id = lv_randint.
    IF sy-subrc = 0.

      IF lines( gt_cgrup ) < 4.
        IF ls_read3-ulke_adi NE ls_db-ulke_adi.
          IF ls_read3-torba EQ lv_control_d.
            APPEND ls_read4-takim_adi TO gt_dgrup.
            lv_control_D = lv_control_D + 1.
            DELETE gt_sports WHERE id  = ls_read4-id.
          ENDIF.

        ENDIF.
      ENDIF.
    ENDIF.

  ENDLOOP.

*  IF lv_control LT 16.
*    CLEAR: gt_agrup,
*           gt_bgrup,
*           gt_cgrup,
*           gt_dgrup.
*  ELSE.
*    EXIT.
*  ENDIF.


ENDDO.

cl_demo_output=>write( gt_agrup ).
cl_demo_output=>write( gt_bgrup ).
cl_demo_output=>write( gt_cgrup ).
cl_demo_output=>write( gt_dgrup ).
cl_demo_output=>display(  ).
