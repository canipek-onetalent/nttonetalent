*&---------------------------------------------------------------------*
*& Report zot_09_p_ogr_not
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_09_p_ogr_not.



DATA: gt_ogr   TYPE zot_09_tt_ogr_not,
      gs_ogr   TYPE zot_09_s_ogr_not,
      gs_sinif TYPE zot_09_s_sinif,
      gs_ders  TYPE zot_09_s_ders,
      gs_not   TYPE zot_09_s_not.


DATA(lt_table) = VALUE zot_09_TT_OGR_NOT( ( ogr_id        = '256'
                                            ogr_ad        = 'Can İpek'
                                            ogr_dogum     = '20020706'
                                            ogr_bolum     = 'Statistics'
                                            ogr_not = VALUE zot_09_s_sinif(
                                            s2_not  = VALUE zot_09_s_ders(
                                            ders_1  = VALUE zot_09_s_not(
                                            vize_1  = '42'
                                            vize_2  = '30'
                                            final   = '40'
                                            butunleme = '75')
                                            ders_2    = VALUE zot_09_s_not(
                                            vize_1    = '70'
                                            vize_2    = '35'
                                            final = '20'
                                            butunleme = '68') ) ) ) ).

cl_demo_output=>display( lt_table ).

*gs_ogr-OGR_ID = 256.
*gs_ogr-OGR_AD = 'Can'.
*gs_ogr-OGR_DOGUM = '20020706'.
*gs_ogr-OGR_BOLUM = 'Statistics'.
*gs_ogr-OGR_NOT = .
*
*INSERT gs_ogr INTO TABLE gt_ogr.

BREAK otcipek.
