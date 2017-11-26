;Dynamic Script Runner
;*************************************
;**** Diretory Of Script To Run ******
Directory = %A_ScriptDir%\Scripts
;***************************************************************
;**** Install msvcr100.dll & AutoHotkey.dll to Exe Directory ****
FileInstall, .\Required Files\msvcr100.dll, %A_ScriptDir%\msvcr100.dll, 1
FileInstall, .\Required Files\AutoHotkey.dll, %A_ScriptDir%\AutoHotkey.dll, 1
;**** Get Name Of Exe Change to AHK ****
SplitPath, A_ScriptName,,,, ScriptName
ScriptPath = %Directory%\%ScriptName%.ahk
;**** Set Script Name To Expression ****
Script := ScriptPath
;**** load AutoHotkey.dll ****
AhkDllPath := A_ScriptDir . "\AutoHotkey.dll"
hModule := DllCall("LoadLibrary", "Str", AhkDllPath)
;**** run main script from dll thread ****
DllCall(AhkDllPath . "\ahkdll", "Str", Script, "Str", "", "Str", "", "Cdecl UPTR")
Sleep, 500
;**** wait for main script to close ****
while (DllCall(AhkDllPath . "\ahkReady"))
   Sleep, 1000
DllCall("FreeLibrary", "UInt", hModule)
;**** Delete msvcr100.dll from working Directory ****
FileDelete, %A_ScriptDir%\msvcr100.dll
;**** Delete AutoHotkey.dll from working Directory ****
FileDelete, %A_ScriptDir%\AutoHotkey.dll

ExitApp
