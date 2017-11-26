Gui, color, 000000
Gui,Add,Button,gButton1_Press x4 y4 w100 h23,ahk
Gui,Add,Button,gButton2_Press x4 y34 w100 h23,bat
Gui,Add,Button,gButton3_Press x4 y64 w100 h23,vbs
Gui,Add,Button,gButton3_Press x4 y94 w100 h23,Exit
Gui,Show, w110 h125 ,Scripts

 return
Button1_Press:
	Run, %A_ScriptDir%\Software\AutoHotKey\Scripts
	ExitApp
return
Button2_Press:
	Run, %A_ScriptDir%\Software\BatchMaker\BatchFiles
	ExitApp
return
Button3_Press:
	Run, %A_ScriptDir%\Software\ExeFromVbs\Vbs Files
	ExitApp
return
Button3_Press:
	ExitApp
return
GuiClose:
ExitApp