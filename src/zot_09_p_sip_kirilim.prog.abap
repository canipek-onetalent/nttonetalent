*&---------------------------------------------------------------------*
*& Report zot_09_p_sip_kirilim
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_09_p_sip_kirilim.


INCLUDE zot_09_i_sip_kirilim_top.

TABLES: vbap,vbak.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.

  SELECT-OPTIONS: s_sno FOR vbak-vbeln,
                    s_sveren FOR vbak-kunnr,
                    s_sturu FOR vbak-auart,
                    s_btar FOR vbak-audat.

SELECTION-SCREEN END OF BLOCK b1.

SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE TEXT-001.

  SELECT-OPTIONS: s_malz FOR vbap-matnr,
                   s_uyer FOR vbap-werks,
                   s_ktip FOR vbap-pstyv,
                   s_malg FOR vbap-matkl,
                   s_parti FOR vbap-charg.

SELECTION-SCREEN END OF BLOCK b2.

SELECTION-SCREEN BEGIN OF BLOCK b3 WITH FRAME TITLE TEXT-001.

  PARAMETERS : p_sturu  AS CHECKBOX DEFAULT 'X',   " vbak-audat
               p_malz   AS CHECKBOX DEFAULT 'X',   " vbap-matnr
               p_sveren AS CHECKBOX,               " vbak-kunnr
               p_malg   AS CHECKBOX,               " vbap-matkl
               p_parti  AS CHECKBOX.               " vbap-charg

SELECTION-SCREEN END OF BLOCK b3.


SELECT vbak~vbeln,
       vbak~kunnr,
       vbak~auart,
       vbak~audat,
       vbap~matnr,
       vbap~werks,
       vbap~pstyv,
       vbap~matkl,
       vbap~charg
       FROM vbak
       INNER JOIN vbap
       ON vbap~vbeln EQ vbak~vbeln
       WHERE vbak~vbeln IN @s_sno
       AND vbak~kunnr IN @s_sveren
       AND vbak~auart IN @s_sturu
       AND vbak~audat IN @s_btar
       AND vbap~matnr IN @s_malz
       AND vbap~werks IN @s_uyer
       AND vbap~pstyv IN @s_ktip
       AND vbap~matkl IN @s_malg
       AND vbap~charg IN @s_parti
       INTO TABLE @lt_sip_kirilim.



    IF p_sturu EQ abap_true.
    DATA(lt_sip) = VALUE slis_t_fieldcat_alv( ( fieldname = 'audat' seltext_m = 'Sipariş Türü' )
                                              ( fieldname = 'matnr' seltext_m = 'Malzeme No' )
                                              ( fieldname = 'kunnr' seltext_m = 'Sipariş Veren' )
                                              ( fieldname = 'matkl' seltext_m = 'Mal Grubu' )
                                              ( fieldname = 'charg' seltext_m = 'Parti' ) ).
    CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
      EXPORTING
        i_callback_program = sy-repid
        it_fieldcat        = lt_sip
      TABLES
        t_outtab           = lt_sip_kirilim.

  ENDIF.
