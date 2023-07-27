*&---------------------------------------------------------------------*
*& Report zot_09_p_d7
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_09_p_d7.

TABLES: eban, ekko, ekpo.


SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME.

PARAMETERS: r_rad1 RADIOBUTTON GROUP g1,
            r_rad2 RADIOBUTTON GROUP g1.

SELECTION-SCREEN END OF BLOCK b1.

SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE text-001.

SELECT-OPTIONS: s_banfn FOR eban-banfn,
                s_bsart FOR eban-bsart.

SELECTION-SCREEN END OF BLOCK b2.

SELECTION-SCREEN BEGIN OF BLOCK b3 WITH FRAME TITLE text-002.

SELECT-OPTIONS: s_ebeln   FOR ekko-ebeln,
                s_bsrt_2  FOR ekko-bsart.

SELECTION-SCREEN END OF BLOCK b3.

START-OF-SELECTION.

IF r_rad1 EQ abap_true.

SELECT banfn,
       bnfpo,
       bsart,
       matnr,
       menge,
       meins
FROM eban INTO TABLE @DATA(lt_eban) WHERE banfn IN @s_banfn AND bsart IN @s_bsrt_2.

ELSEIF r_rad2 EQ abap_true.

SELECT e1~ebeln,
       e1~ebelp,
       e1~matnr,
       e1~menge,
       e1~meins
FROM ekpo AS e1
INNER JOIN ekko AS e2 ON e1~ebeln = e2~ebeln
INTO TABLE @DATA(lt_ekpo) WHERE e2~ebeln IN @s_ebeln AND e2~bsart IN @s_bsrt_2.

"line color
"top_of_page

ENDIF.
