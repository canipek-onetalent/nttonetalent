*&---------------------------------------------------------------------*
*& Report zot_09_p_report
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_09_p_report.


INCLUDE zot_09_i_report_top.
INCLUDE zot_09_i_report_sel.
INCLUDE zot_09_i_report_cls.
INCLUDE zot_09_i_report_mdl.

INITIALIZATION.
go_main = lcl_main_controller=>get_instance( ).



AT SELECTION-SCREEN OUTPUT.

LOOP AT screen.
IF r_sat = abap_true
AND screen-group1 = 'P1'.
screen-active = 0.
modify screen.
elseif r_sas = abap_true
AND screen-group1 = 'P2'.
screen-active = 0.
modify screen.
endif.
ENDLOOP.

*  IF r_sat = abap_true.
*    LOOP AT SCREEN.
*    IF SCREEN-group1 = 's_1'.
*          screen-active = '0'.
*          screen-invisible = '1'.
*          MODIFY SCREEN.
*    ENDIF.
*    ENDLOOP.
*  ELSEIF r_sas = abap_true.
*    LOOP AT SCREEN.
*    IF SCREEN-group1 = 's_2'.
*          screen-active = '0'.
*          screen-invisible = '1'.
*          MODIFY SCREEN.
*    ENDIF.
*
*    ENDLOOP.
*  ENDIF.

END-OF-SELECTION.

  CASE abap_true.
    WHEN r_sat.
      SELECT eban~banfn,
             eban~bnfpo,
             eban~bsart,
             eban~matnr,
             eban~menge,
             eban~meins
             FROM eban
             INNER JOIN ekpo
             ON ekpo~banfn EQ eban~banfn
             AND ekpo~bnfpo EQ eban~bnfpo
             WHERE eban~banfn IN @s_satno
             AND eban~bsart EQ @p_sattur
             INTO TABLE @lt_sat_report.
    WHEN r_sas.
      SELECT ekpo~ebeln,
             ekpo~ebelp,
             ekpo~matnr,
             ekpo~menge,
             ekpo~meins

             FROM ekpo INNER JOIN eban
             ON @eban-banfn = @ekpo-banfn AND @eban-bnfpo = @ekpo-bnfpo
             WHERE ekpo~ebeln IN @s_sasno
             INTO TABLE @lt_sas_report.
  ENDCASE.



    IF r_sat EQ abap_true.
    DATA(lt_sat) = VALUE slis_t_fieldcat_alv( ( fieldname = 'MATNR' seltext_m = 'Malzeme No' )
                                              ( fieldname = 'MENGE' seltext_m = 'SAT Miktarı' )
                                              ( fieldname = 'MEINS' seltext_m = 'Ölçü Miktarı' )
                                              ( fieldname = 'BANFN' seltext_m = 'SAT No' )
                                              ( fieldname = 'BNFPO' seltext_m = 'SAT Kalem No' ) ).
    CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
      EXPORTING
        i_callback_program = sy-repid
        it_fieldcat        = lt_sat
      TABLES
        t_outtab           = lt_sat_report. "lt_eban.


  ELSEIF r_sas EQ abap_true.

    DATA(lt_sas) = VALUE slis_t_fieldcat_alv( ( fieldname = 'MATNR' seltext_m = 'Malzeme No' )
                                              ( fieldname = 'MENGE' seltext_m = 'SAT Miktarı' )
                                              ( fieldname = 'MEINS' seltext_m = 'Ölçü Miktarı' )
                                              ( fieldname = 'MATKL' seltext_m = 'Malzeme Grubu' )
                                              ( fieldname = 'EBELN' seltext_m = 'Satın Alma Belge No' ) ).

    CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
      EXPORTING
        i_callback_program = sy-repid
        it_fieldcat        = lt_sas
      TABLES
        t_outtab           = lt_ekpo.

  ENDIF.
