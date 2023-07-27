*&---------------------------------------------------------------------*
*& Include zot_09_i_sip_kirilim_top
*&---------------------------------------------------------------------*

TYPES: BEGIN OF gty_sip_kirilim,
       vbeln TYPE vbeln,
       kunnr TYPE kunnr,
       auart TYPE auart,
       audat TYPE audat,
       matnr TYPE matnr,
       werks TYPE werks,
       pstyv TYPE pstyv,
       matkl TYPE matkl,
       charg TYPE charg_d,
       END OF gty_sip_kirilim.


DATA: ls_sip_kirilim TYPE gty_sip_kirilim,
      lt_sip_kirilim TYPE TABLE OF gty_sip_kirilim.
