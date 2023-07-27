*&---------------------------------------------------------------------*
*& Include zot_09_i_report_sel
*&---------------------------------------------------------------------*


TABLES: eban, ekpo.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.

  SELECT-OPTIONS s_satno FOR eban-banfn MODIF ID p1.
  PARAMETERS p_sattur TYPE eban-bsart MODIF ID p1.

SELECTION-SCREEN END OF BLOCK b1.



SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE TEXT-002.

  SELECT-OPTIONS s_sasno FOR ekpo-ebeln MODIF ID p2.
  PARAMETERS p_sastur TYPE ekpo-matkl MODIF ID p2.

SELECTION-SCREEN END OF BLOCK b2.



SELECTION-SCREEN BEGIN OF BLOCK b3 WITH FRAME TITLE TEXT-003.

    PARAMETERS: r_sat RADIOBUTTON GROUP gr1 USER-COMMAND a DEFAULT 'X',
                r_sas RADIOBUTTON GROUP gr1.

SELECTION-SCREEN END OF BLOCK b3.
