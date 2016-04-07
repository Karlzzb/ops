#$language = "VBScript"
#$interface = "1.0"

crt.Screen.Synchronous = True

' This automatically generated script may need to be
' edited in order to work correctly.

Sub Main
	crt.Screen.Send "ssh 10.1.0.201" & chr(13)
	crt.Screen.WaitForString "wsadmin@10.1.0.201's password: "
	crt.Screen.Send "Da4neqGT0odiBZv2BxRi" & chr(13)
	crt.Screen.WaitForString "wsadmin@Db-Jo1:[/home/wsadmin]"
	crt.Screen.Send "mysql -uroot -p" & chr(13)
	crt.Screen.WaitForString "Enter password: "
	crt.Screen.Send "496bfc621ade673369f21fd1ec6a94b7637fd315" & chr(13)
End Sub