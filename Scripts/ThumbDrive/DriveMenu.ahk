
#SingleInstance
#NoTrayIcon

Gui, color, 000000
Menu, Tray, Click, 1
Menu, Tray, Add, Restore, Restore
Menu, Tray, Default, Restore
OnMessage(0x112, "WM_SYSCOMMAND")
Gui,-SysMenu
Gui,Add,Button,gButton1_Press x200 y4 w100 h23,Owner
Gui,Add,Button,gButton2_Press x200 y34 w100 h23,Documents
Gui,Add,Button,gButton3_Press x200 y64 w100 h23,Music
Gui,Add,Button,gButton4_Press x200 y93 w100 h23,Pictures
Gui,Add,Button,gButton5_Press x200 y122 w100 h23,Videos
Gui,Add,Button,gButton6_Press x280 y370 w23 h23,--
Gui,Add,Button,gButton7_Press x200 y152 w100 h23,Scripts
Gui,Show,x448 y235 w309 h399 ,

SetWorkingDir, %A_ScriptDir%\Software
Dir = %A_WorkingDir%\
  LoopNum := 0
  Loop, %Dir%*.exe
  {
    if StrLen(A_LoopFileName) + 1 - InStr(A_LoopFileName, "exe", StartingPos = 0) = 3
    {
      LoopNum++
    }
  }
  LoopNum++
  if LoopNum > 40
  {
    LoopNum := 40
  }
  Gui, Add, ListView,  r%LoopNum% x5 y4 w185 h390  gMyListView, Applications
  Gui, Add, Button, Hidden Default, OK
  ImageListID := IL_Create(10)
  LV_SetImageList(ImageListID)
  Loop, %Dir%*.exe
  {
	
    LNKFile := A_LoopFileFullPath
    IL_Add(ImageListID, LNKFile, 1)
	}

  LoopNum := 0
  Loop, %Dir%*.exe
  {
    LoopNum++
    LV_Add("Icon" . LoopNum, SubStr(A_LoopFileName, 1, InStr(A_LoopFileName, ".exe", StartingPos = 0) - 1), 1)
	}
  LV_ModifyCol(1, "Sort")
  LV_ModifyCol(1, 180)
  Gui, Show,, ThumbDrive
  return
  MyListView:
  if A_GuiEvent = DoubleClick
  {
    LV_GetText(RowText, A_EventInfo)
    LV_GetText(RowText2, A_EventInfo, 2)
    if RowText2 = 1
      Run "%Dir%\%RowText%.exe"
    else
      Run "%Dir%\%RowText%.exe"
   SetTimer, Minimize, -1
  }
  return

Button1_Press:
	Run, %A_ScriptDir%\Owner Files
	SetTimer, Minimize, -1
return
Button2_Press:
	Run, %A_ScriptDir%\Owner Files\Documents
	SetTimer, Minimize, -1
return
Button3_Press:
	Run, %A_ScriptDir%\Owner Files\Music
	SetTimer, Minimize, -1
return
Button4_Press:
	Run, %A_ScriptDir%\Owner Files\Pictures
	SetTimer, Minimize, -1
return
Button5_Press:
	Run, %A_ScriptDir%\Owner Files\Videos
	SetTimer, Minimize, -1
return
Button6_Press:
	SetTimer, Minimize, -1
return
Button7_Press:
	Run, %A_ScriptDir%\Scripts.exe
	SetTimer, Minimize, -1
return

WM_SYSCOMMAND(wParam)
{
	If (wParam = 61472) ; minimize
		SetTimer, Minimize, -1
	Else If (wParam = 61728) ; restore
		SetTimer, Restore, -1
}

Minimize:
	Critical
	Gui, Hide
	Menu, Tray, Icon
Return
   
Restore:
	Critical
	Menu, Tray, NoIcon
	Gui, Show
Return

GuiEscape:
GuiClose:
OnExit:
