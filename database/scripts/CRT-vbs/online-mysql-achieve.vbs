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
	crt.Screen.Send "ssh" & chr(8) & chr(8) & chr(8) & chr(8) & chr(8) & chr(8) & "sud " & chr(8) & chr(8) & chr(8) & chr(8) & chr(8) & chr(8) & "sudo -s" & chr(13)
	crt.Screen.WaitForString "[root@Backup-Jo1 " & chr(126) & "]# "
	crt.Screen.Send "cd /backup/jo_backendserver_backup/10.1.0.203/data/slowlog" & chr(13)
	crt.Screen.WaitForString "[root@Backup-Jo1 slowlog]# "
	crt.Screen.Send "ll" & chr(13)
End Sub
