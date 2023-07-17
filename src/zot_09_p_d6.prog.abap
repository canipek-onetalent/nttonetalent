*&---------------------------------------------------------------------*
*& Report zot_09_p_d6
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_09_p_d6.

TYPES: BEGIN OF lty_material,
         matnr TYPE matnr, "Malzeme ID
         maktx TYPE maktx, "Malzeme Açıklaması
         matkl TYPE matkl, "Malzeme Grubu
         menge TYPE menge_d, "Miktar
         meins TYPE meins, "Ölçü Birimi
       END OF lty_material.
*
*DATA: lt_material TYPE TABLE OF lty_material,
*      ls_material TYPE lty_material.
**"APPEND
*ls_material-matnr = '01'.
*ls_material-maktx = 'Çekiç'.
*ls_material-matkl = 'Hırdavat'.
*ls_material-menge = 5.
*ls_material-meins = 'PC'.
*APPEND ls_material TO lt_material.
*
*"BASE
*lt_material = VALUE #( BASE lt_material (   matnr = '02'
*                                           maktx = 'Tornavida'
*                                           matkl = 'Hırdavat'
*                                           menge = 10
*                                           meins = 'PC' )
*
*                                          (  matnr = '02'
*                                           maktx = 'Tornavida'
*                                           matkl = 'Hırdavat'
*                                           menge = 10
*                                           meins = 'PC' ) ).
* DATA(ls_material_2) = VALUE lty_material(  matnr = '02'
*                         maktx = 'Tornavida'
*                        matkl = 'Hırdavat'
*                        menge = 10
*                        meins = 'PC' ).
*"INSERT
*ls_material-matnr = '03'.
*ls_material-maktx = 'Lastik'.
*ls_material-matkl = 'Hırdavat'.
*ls_material-menge = 15.
*ls_material-meins = 'PC'.
*INSERT ls_material INTO TABLE lt_material.
*
*BREAK-POINT.
*
*DATA: lt_material_s TYPE SORTED TABLE OF lty_material WITH NON-UNIQUE KEY matnr.
*
*lt_material_s = VALUE #( BASE lt_material_s ( matnr = ''
*                                              maktx = 'Tornavida'
*                                              matkl = 'Hırdavat'
*                                              menge = 10
*                                              meins = 'PC' ) ).
*BREAK-POINT.
*DATA: lv_matnr TYPE numc2.
*DO 5 TIMES.
*  lv_matnr += 1.
*  ls_material-matnr = lv_matnr.
*  ls_material-maktx = 'Çekiç'.
*  ls_material-matkl = 'Hırdavat'.
*  ls_material-menge = 6.
*  ls_material-meins = 'PC'.
*  APPEND ls_material TO lt_material.
*  CLEAR: ls_material.
*ENDDO.
*
DATA: lt_material_kirtasiye TYPE TABLE OF lty_material,
      lt_material_hirdavat  TYPE TABLE OF lty_material.
*
*
*BREAK-POINT.
*
*
**DATA: lv_matnr TYPE numc2.
*
*
*lv_matnr += 1.
*lt_material_kirtasiye =
*VALUE #( BASE lt_material_kirtasiye ( matnr = lv_matnr
*                                      maktx = 'Kalem'
*                                      matkl = 'Kırtasiye'
*                                      menge = 10
*                                      meins = 'PC' ) ).
*
*lv_matnr += 1.
*lt_material_kirtasiye =
*VALUE #( BASE lt_material_kirtasiye ( matnr = lv_matnr
*                                      maktx = 'Silgi'
*                                      matkl = 'Kırtasiye'
*                                      menge = 5
*                                      meins = 'KG' ) ).
*lv_matnr += 1.
*lt_material_kirtasiye =
*VALUE #( BASE lt_material_kirtasiye ( matnr = lv_matnr
*                                      maktx = 'Sulu boya'
*                                      matkl = 'Kırtasiye'
*                                      menge = 5
*                                      meins = 'M3' ) ).
*
*lv_matnr += 1.
*lt_material_hirdavat =
*VALUE #( BASE lt_material_hirdavat (  matnr = lv_matnr
*                                      maktx = 'Çivi'
*                                      matkl = 'Hırdavat'
*                                      menge = 10
*                                      meins = 'KG' ) ).
*lv_matnr += 1.
*lt_material_hirdavat =
*VALUE #( BASE lt_material_hirdavat (  matnr = lv_matnr
*                                      maktx = 'Balta'
*                                      matkl = 'Hırdavat'
*                                      menge = 10
*                                      meins = 'PC' ) ).


*DATA: ls_material_kirtasiye type lty_material.

LOOP AT lt_material_kirtasiye INTO DATA(ls_material_kirtasiye).

  READ TABLE lt_material_hirdavat INTO DATA(ls_material_hirdavat)
  WITH KEY meins = ls_material_kirtasiye-meins.

  IF sy-subrc EQ 0.
    ls_material_kirtasiye-menge = 15 .
    MODIFY lt_material_kirtasiye FROM ls_material_kirtasiye
    TRANSPORTING menge WHERE meins = 'M3'.
    "m3
  ENDIF.

ENDLOOP.
BREAK-POINT.
*DATA: lt_material_buffer TYPE TABLE OF lty_material.
*
*TYPES: BEGIN OF lty_malzeme,
*         type  TYPE char1,
*         matnr TYPE matnr,
*         maktx TYPE maktx,
*       END OF lty_malzeme.
*
*DATA lt_malzeme TYPE TABLE OF lty_malzeme.
*MOVE lt_material_kirtasiye TO lt_malzeme.
*MOVE-CORRESPONDING lt_material_kirtasiye TO lt_malzeme.
*
*MOVE lt_material_kirtasiye TO lt_material_buffer.
*
*READ TABLE lt_material INTO ls_material WITH KEY maktx = 'Tornavida'.
*IF sy-subrc EQ 0 .
*  lt_material = VALUE #( BASE lt_material (
*                         matnr = '99'
*                         maktx = 'Kalem'
*                         matkl = 'Kırtasiye'
*                         menge = ls_material-menge
*                         meins = ls_material-meins ) ) .
*ENDIF.
