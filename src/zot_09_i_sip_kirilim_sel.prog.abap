*&---------------------------------------------------------------------*
*& Include zot_09_i_sip_kirilim_sel
*&---------------------------------------------------------------------*


TABLES: vbap,vbak.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.

  SELECT-OPTIONS: s_sno FOR vbak-vbeln,
                    s_sveren FOR vbak-kunnr,
                    s_sturu FOR vbak-auart,
                    s_btar FOR vbak-audat.

SELECTION-SCREEN END OF BLOCK b1.

SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE TEXT-002.

  SELECT-OPTIONS: s_malz FOR vbap-matnr,
                   s_uyer FOR vbap-werks,
                   s_ktip FOR vbap-pstyv,
                   s_malg FOR vbap-matkl,
                   s_parti FOR vbap-charg.

SELECTION-SCREEN END OF BLOCK b2.

SELECTION-SCREEN BEGIN OF BLOCK b3 WITH FRAME TITLE TEXT-003.

  PARAMETERS : p_sturu  AS CHECKBOX DEFAULT 'X',   " vbak-audat
               p_malz   AS CHECKBOX DEFAULT 'X',   " vbap-matnr
               p_sveren AS CHECKBOX,               " vbak-kunnr
               p_malg   AS CHECKBOX,               " vbap-matkl
               p_parti  AS CHECKBOX.               " vbap-charg

SELECTION-SCREEN END OF BLOCK b3.
