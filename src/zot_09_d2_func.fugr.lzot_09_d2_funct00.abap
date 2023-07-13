*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZOT_09_T_P_ATUR.................................*
DATA:  BEGIN OF STATUS_ZOT_09_T_P_ATUR               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZOT_09_T_P_ATUR               .
CONTROLS: TCTRL_ZOT_09_T_P_ATUR
            TYPE TABLEVIEW USING SCREEN '0001'.
*...processing: ZOT_09_T_P_EGTM.................................*
DATA:  BEGIN OF STATUS_ZOT_09_T_P_EGTM               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZOT_09_T_P_EGTM               .
CONTROLS: TCTRL_ZOT_09_T_P_EGTM
            TYPE TABLEVIEW USING SCREEN '0003'.
*...processing: ZOT_09_T_P_ILTSM................................*
DATA:  BEGIN OF STATUS_ZOT_09_T_P_ILTSM              .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZOT_09_T_P_ILTSM              .
CONTROLS: TCTRL_ZOT_09_T_P_ILTSM
            TYPE TABLEVIEW USING SCREEN '0004'.
*...processing: ZOT_09_T_P_MAST.................................*
DATA:  BEGIN OF STATUS_ZOT_09_T_P_MAST               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZOT_09_T_P_MAST               .
CONTROLS: TCTRL_ZOT_09_T_P_MAST
            TYPE TABLEVIEW USING SCREEN '0002'.
*.........table declarations:.................................*
TABLES: *ZOT_09_T_P_ATUR               .
TABLES: *ZOT_09_T_P_EGTM               .
TABLES: *ZOT_09_T_P_ILTSM              .
TABLES: *ZOT_09_T_P_MAST               .
TABLES: ZOT_09_T_P_ATUR                .
TABLES: ZOT_09_T_P_EGTM                .
TABLES: ZOT_09_T_P_ILTSM               .
TABLES: ZOT_09_T_P_MAST                .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
