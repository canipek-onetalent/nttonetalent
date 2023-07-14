*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZOT_09_T_ZMN....................................*
DATA:  BEGIN OF STATUS_ZOT_09_T_ZMN                  .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZOT_09_T_ZMN                  .
CONTROLS: TCTRL_ZOT_09_T_ZMN
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZOT_09_T_ZMN                  .
TABLES: ZOT_09_T_ZMN                   .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
