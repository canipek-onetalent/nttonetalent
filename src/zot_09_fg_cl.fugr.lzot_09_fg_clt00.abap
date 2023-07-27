*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZOT_09_T_CL.....................................*
DATA:  BEGIN OF STATUS_ZOT_09_T_CL                   .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZOT_09_T_CL                   .
CONTROLS: TCTRL_ZOT_09_T_CL
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZOT_09_T_CL                   .
TABLES: ZOT_09_T_CL                    .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
