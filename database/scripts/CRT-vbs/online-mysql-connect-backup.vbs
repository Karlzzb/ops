#$language = "VBScript"
#$interface = "1.0"

crt.Screen.Synchronous = True

' This automatically generated script may need to be
' edited in order to work correctly.

Sub Main
	crt.Screen.Send "ssh 10.1.0.3" & chr(13)
	crt.Screen.WaitForString "wsadmin@10.1.0.3's password: "
	crt.Screen.Send "Da4neqGT0odiBZv2BxRi" & chr(13)
	crt.Screen.WaitForString "wsadmin@Backup-Jo1:[/home/wsadmin]"
	crt.Screen.Send "mysql -uroot -p" & chr(13)
	crt.Screen.WaitForString "Enter password: "
	crt.Screen.Send "b1ba8e46c4a2a2598a846acc1257b9c52a73f872" & chr(13)
End Sub
