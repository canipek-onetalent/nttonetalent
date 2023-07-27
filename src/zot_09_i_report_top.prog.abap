*&---------------------------------------------------------------------*
*& Include zot_09_i_report_top
*&---------------------------------------------------------------------*


DATA: go_alv    TYPE REF TO cl_salv_table,
      gv_ucomm  TYPE sy-ucomm,
      gv_okcode TYPE sy-ucomm.

DATA: lt_ekpo TYPE TABLE OF ekpo,
      lt_eban TYPE TABLE OF eban.

TYPES: BEGIN OF gty_sat,
       banfn TYPE banfn,
       bnfpo TYPE bnfpo,
       bsart TYPE bsart,
       matnr TYPE matnr,
       menge TYPE menge_d,
       meins TYPE meins,
       END OF gty_sat,

       BEGIN OF gty_sas,
       ebeln TYPE ebeln,
       ebelp TYPE ebelp,
       matnr TYPE matnr,
       menge TYPE menge_d,
       meins TYPE meins,
       END OF gty_sas.


DATA: ls_sat_report TYPE gty_sat,
      lt_sat_report TYPE TABLE OF gty_sat,
      ls_sas_report TYPE gty_sas,
      lt_sas_report TYPE TABLE OF gty_sas.
