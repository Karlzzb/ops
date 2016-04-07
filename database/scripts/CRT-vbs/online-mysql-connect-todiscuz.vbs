#$language = "VBScript"
#$interface = "1.0"

crt.Screen.Synchronous = True

' This automatically generated script may need to be
' edited in order to work correctly.

Sub Main
	crt.Screen.Send "ssh 10.1.0.5" & chr(13)
	crt.Screen.WaitForString "wsadmin@10.1.0.5's password: "
	crt.Screen.Send "Da4neqGT0odiBZv2BxRi" & chr(13)
	crt.Screen.WaitForString "[wsadmin@Zabbix ~]$"
	crt.Screen.Send "/usr/local/webserver/mysql/bin/mysql -uroot -hlocalhost -p -S /data/db/mysql6980/mysql.sock" & chr(13)
	crt.Screen.WaitForString "Enter password: "
	crt.Screen.Send "b1ba8e46c4a2a2598a846acc1257b9c52a73f872" & chr(13)
End Sub