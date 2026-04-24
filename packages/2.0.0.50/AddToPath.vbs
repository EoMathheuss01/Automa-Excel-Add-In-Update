Option Explicit

Dim objShell
Set objShell = CreateObject("Shell.Application")

Function IsRunAsAdministrator()
    IsRunAsAdministrator = False
    If WScript.Arguments.Named.Exists("elevated") Then
        IsRunAsAdministrator = True
    End If
End Function

Function ResolveInstallDirectory()
    Dim shell
    Dim registryInstallDir

    Set shell = CreateObject("WScript.Shell")
    registryInstallDir = ""

    On Error Resume Next
    registryInstallDir = shell.RegRead("HKCU\Software\Automa\ExcelAddin\InstallLocation")
    On Error GoTo 0

    If Not IsEmpty(registryInstallDir) Then
        registryInstallDir = Trim(CStr(registryInstallDir))
    End If

    If Len(registryInstallDir) > 0 Then
        ResolveInstallDirectory = registryInstallDir
    Else
        ResolveInstallDirectory = Left(WScript.ScriptFullName, InStrRev(WScript.ScriptFullName, "\") - 1)
    End If
End Function

If Not IsRunAsAdministrator() Then
    objShell.ShellExecute "wscript.exe", Chr(34) & WScript.ScriptFullName & Chr(34) & " /elevated", "", "runas", 1
    WScript.Quit
Else
    Set objShell = CreateObject("WScript.Shell")

    Dim installDir
    installDir = ResolveInstallDirectory()

    Dim currentPath
    currentPath = objShell.RegRead("HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment\Path")

    If InStr(1, currentPath, installDir, vbTextCompare) = 0 Then
        Dim newPath
        newPath = currentPath & ";" & installDir
        objShell.RegWrite "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment\Path", newPath, "REG_EXPAND_SZ"
        MsgBox "O caminho da instalacao foi adicionado ao PATH do Windows.", vbInformation
    Else
        MsgBox "O caminho da instalacao ja estava presente no PATH do Windows.", vbInformation
    End If
End If

Set objShell = Nothing
