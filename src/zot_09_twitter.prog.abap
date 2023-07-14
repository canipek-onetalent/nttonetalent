*&---------------------------------------------------------------------*
*& Report zot_09_twitter
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_09_twitter.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.
  PARAMETERS: p_id TYPE ZOT_09_E_TW_ID,
              p_text TYPE ZOT_09_E_TW_TEXT.

  DATA: lv_msg TYPE string,
        lt_09_t_twitter TYPE TABLE OF zot_09_t_twitter.

SELECTION-SCREEN END OF BLOCK b1.

SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE TEXT-002.
  PARAMETERS: p_t_post RADIOBUTTON GROUP g1 MODIF ID rad,
              p_t_del RADIOBUTTON GROUP g1 MODIF ID rad,
              p_t_chng  RADIOBUTTON GROUP g1 MODIF ID rad,
              p_t_view   RADIOBUTTON GROUP g1 MODIF ID rad..
  DATA p_sonuc TYPE p DECIMALS 2.
SELECTION-SCREEN END OF BLOCK b2.



START-OF-SELECTION.


  CASE 'X'.

    WHEN p_t_post.


        DATA gs_newrow TYPE zot_09_t_twitter.

        gs_newrow-twitter_id = p_id.
        gs_newrow-twitter_text = p_text.

        SELECT SINGLE twitter_text
        FROM zot_09_t_twitter
        INTO @lv_msg
        WHERE twitter_id = @p_id.



        IF sy-subrc = 0.
        MESSAGE 'ID Already Exists!' TYPE 'W'.
        ELSE.
        INSERT ZOT_09_T_TWITTER FROM gs_newrow.
        ENDIF.



    WHEN p_t_del.


        SELECT SINGLE twitter_text
        FROM zot_09_t_twitter
        INTO @lv_msg
        WHERE twitter_id = @p_id.

        IF sy-subrc = 0.
        DELETE FROM zot_09_t_twitter WHERE twitter_id = p_id.
        ELSE.
        MESSAGE 'ID Does Not Exists!' TYPE 'W'.
        ENDIF.



    WHEN p_t_chng.


        SELECT SINGLE twitter_text
        FROM zot_09_t_twitter
        INTO @lv_msg
        WHERE twitter_id = @p_id.

        IF sy-subrc = 0.
        UPDATE zot_09_t_twitter SET twitter_text = p_text
        WHERE twitter_id EQ p_id.
        ELSE.
        MESSAGE 'ID Does Not Exists!' TYPE 'W'.
        ENDIF.



    WHEN p_t_view.


        SELECT SINGLE twitter_text
        FROM zot_09_t_twitter
        INTO @DATA(lv_value)
        WHERE twitter_id = @p_id.

        IF sy-subrc = 0.
        WRITE: lv_value.
        ENDIF.


  ENDCASE.
