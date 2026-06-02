Option Explicit

Dim objShell
Set objShell = CreateObject("Shell.Application")

' Função para verificar se o script está sendo executado como administrador
Function IsRunAsAdministrator()
    IsRunAsAdministrator = False
    If WScript.Arguments.Named.Exists("elevated") Then
        IsRunAsAdministrator = True
    End If
End Function

' Verificar se o script está sendo executado como administrador
If Not IsRunAsAdministrator() Then
    ' Se não estiver sendo executado como administrador, solicitar elevação
    objShell.ShellExecute "wscript.exe", Chr(34) & WScript.ScriptFullName & Chr(34) & " /elevated", "", "runas", 1
    WScript.Quit
Else
    ' Se estiver sendo executado como administrador, continuar com o script normalmente    
	Set objShell = CreateObject("WScript.Shell")

	' Obter o diretório de instalação do programa (o diretório atual do script)
	Dim installDir
	installDir	= Left(WScript.ScriptFullName, InStrRev(WScript.ScriptFullName, "\") - 1)

	' Obter o valor atual da variável PATH
	Dim currentPath
	currentPath = objShell.RegRead("HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment\Path")

	' Verificar se o diretório de instalação já está na variável PATH
	If InStr(1, currentPath, installDir, vbTextCompare) = 0 Then
		' Adicionar o diretório de instalação à variável PATH
		dim newPath
		newPath = currentPath & ";" & installDir
		objShell.RegWrite "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment\Path", newPath, "REG_EXPAND_SZ"
	End If
	MsgBox "A instalacao foi concluida com sucesso.", vbInformation
End If

Set objShell = Nothing
