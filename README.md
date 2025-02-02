==========================================
# RETURN TO [HOMEPAGE](https://pauljohnsgit.github.io/Paul-Johns/)
==========================================

# Full List Of Commands
[VIEW LIST](https://autohotkey.com/docs_1.0/commands.htm)

# Autohotkey - The Application
[DOWNLOAD](https://raw.githubusercontent.com/Pauljohnsgit/AHK/master/AutoHotkey.zip)

# DynamicEXE - for quick scripting
[DOWNLOAD EXE](https://raw.githubusercontent.com/Pauljohnsgit/AHK/master/Scripts/DynamicScriptExe/AScriptDir.exe) or [DOWNLOAD FULL SCRIPT](https://raw.githubusercontent.com/Pauljohnsgit/AHK/master/Scripts/DynamicScriptExe/DynamicScriptExe.zip)

```AutoHotKey
Directory = %A_ScriptDir%
FileInstall, .\Required Files\msvcr100.dll, %A_ScriptDir%\msvcr100.dll, 1
FileInstall, .\Required Files\AutoHotkey.dll, %A_ScriptDir%\AutoHotkey.dll, 1
SplitPath, A_ScriptName,,,, ScriptName
ScriptPath = %Directory%\%ScriptName%.ahk
Script := ScriptPath
AhkDllPath := A_ScriptDir . "\AutoHotkey.dll"
hModule := DllCall("LoadLibrary", "Str", AhkDllPath)
DllCall(AhkDllPath . "\ahkdll", "Str", Script, "Str", "", "Str", "", "Cdecl UPTR")
Sleep, 500
while (DllCall(AhkDllPath . "\ahkReady"))
   Sleep, 1000
DllCall("FreeLibrary", "UInt", hModule)
FileDelete, %A_ScriptDir%\msvcr100.dll
FileDelete, %A_ScriptDir%\AutoHotkey.dll
ExitApp
```
# RunAsAdmin - script to force for admin evaluation
[DOWNLOAD SCRIPT](https://raw.githubusercontent.com/Pauljohnsgit/AHK/master/Scripts/RunAsAdmin/RunAsAdmin.zip)
```AutoHotKey
RunAsAdmin() {
  Loop, %0%  ; For each parameter:
    {
      param := %A_Index%  ; Fetch the contents of the variable whose name is contained in A_Index.
      params .= A_Space . param
    }
  ShellExecute := A_IsUnicode ? "shell32\ShellExecute":"shell32\ShellExecuteA"
      
  if not A_IsAdmin
  {
      If A_IsCompiled
         DllCall(ShellExecute, uint, 0, str, "RunAs", str, A_ScriptFullPath, str, params , str, A_WorkingDir, int, 1)
      Else
         DllCall(ShellExecute, uint, 0, str, "RunAs", str, A_AhkPath, str, """" . A_ScriptFullPath . """" . A_Space . params, str, A_WorkingDir, int, 1)
      ExitApp
  }
}

RunAsAdmin()
```

# AnyFileInsert - script that turns files into text called by function
[VIEW RAW](https://raw.githubusercontent.com/Pauljohnsgit/AHK/master/Scripts/AnyFileInsert/AnyFileInsert.ahk)

# ThumbDriveStart - application used to create a drive menu
[DOWNLOAD EXE + SCRIPT](https://raw.githubusercontent.com/Pauljohnsgit/AHK/master/Scripts/ThumbDrive/ThumbDriveStart.zip)

# 7zipExtract - simple script for unzipping files
[DOWNLOAD EXE + SCRIPT](https://raw.githubusercontent.com/Pauljohnsgit/AutoHotKey/master/Scripts/7zipExtract/7zipExtract.zip)

# TxtEncrypter
[VIEW RAW](https://raw.githubusercontent.com/Pauljohnsgit/AutoHotKey/master/Scripts/TxtEncrypter/TxtEncrypter.ahk)
