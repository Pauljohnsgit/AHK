;VARIABLES SHEET
;THIS LIST OF COMMANDS CAN BE CALLED USING THIS AHK FILE
;ALL VARIABLES ARE ACTIVE BY DOING SO & CAN BE RUN BY ITS VARIABLE

;NAME / VARIABLE / COMMAND

/* Date */  /* %SimpleDate% */  FormatTime, SimpleDate,, MM/dd/yy
/* Copy selected text */  /* %Copy% */  Copy = {Control down}{c}{Control up}
/* Paste from clipboard */  /* %Paste% */  Paste = {Control down}{v}{Control up}
/* Relative Path */  /* %A_LoopFileName% */  Loop, %A_ScriptDir%, 2, 1
