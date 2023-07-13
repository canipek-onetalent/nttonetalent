*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZOT_09_T_TWITTER................................*
DATA:  BEGIN OF STATUS_ZOT_09_T_TWITTER              .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZOT_09_T_TWITTER              .
CONTROLS: TCTRL_ZOT_09_T_TWITTER
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZOT_09_T_TWITTER              .
TABLES: ZOT_09_T_TWITTER               .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
