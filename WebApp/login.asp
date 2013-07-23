<%

for each x in Session.Contents
 Session.Contents.Remove(x)
next

session("operation_id")=""
session("imageURL")="http://phax.homelinux.com/opimages/"
session("dbColonDSN")="DSN=scmec"
session("dbAppDSN")="DSN=scmec"
session("dbUsername")="root"
session("dbPassword")="1bigphax"

Set sqlconnection = Server.CreateObject("ADODB.Connection")		
Set rs = Server.CreateObject("ADODB.recordset")
sqlconnection.ConnectionTimeout=60
sqlconnection.Open session("dbAppDSN"),session("dbUsername"),session("dbPassword")

myUser = Request.Form("user")
myPass = Request.Form("pass")

sqlStatement = "SELECT * FROM userinfo WHERE userid = '" & myUser & "' AND PASSWORD='" & myPass & "'"

rs.open sqlStatement, sqlconnection	
			if (not rs.EOF) then
				checkValid = 1
			else
				checkValid = 0
			end if
rs.Close		

if (checkValid = 1) then

sqlStatement = "SELECT * from userinfo WHERE userid = '" & myUser & "' AND PASSWORD='" & myPass & "'"

rs.Open sqlStatement, sqlconnection	
			if (not rs.EOF) then
				if rs.Fields("denyaccess") = "False" Then
					Session("grantAccess") = 1
				end if
			end if
rs.Close
sqlconnection.close

Response.Redirect "selectappointment.asp"
else
%>

<HTML><BODY bgcolor=lightgrey scroll=no><BR> <BR> <BR> <BR> <BR> <BR> <BR> <BR> <CENTER><INPUT style="FONT-WEIGHT: bold; FONT-SIZE: larger; WIDTH: 312px; COLOR: black; FONT-FAMILY: monospace; HEIGHT: 60px; BACKGROUND-COLOR: grey" onclick="document.location.href='login.html'" type=button size=92 value="Login Failed!"></CENTER></BODY></HTML>

<%
end if
%>