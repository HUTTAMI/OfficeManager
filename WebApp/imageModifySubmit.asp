<%
if Session("grantAccess") <> 1 then 
	Response.Redirect "login.html"
end if
%>

<%		
Set sqlconnection = Server.CreateObject("ADODB.Connection")Set rs = Server.CreateObject("ADODB.recordset")
			sqlconnection.ConnectionTimeout=60
sqlconnection.Open session("dbColonDSN"),session("dbUsername"),session("dbPassword")

rs.Open "UPDATE operation_pics SET photocaption='"+ request("dbphotocaption") +"', location='"+ request("dblocation") +"', distance='"+ request("dbdistance") +"',object='"+ request("dbobject") +"' WHERE photoid="+ request("dbphotoid"), sqlconnection
			
sqlconnection.close
%>
<HTML>
<HEAD>
<META http-equiv="refresh" content="0;url=test2.htm?updateImage=<%=request("dbphotocaption")%>?imageFilename=<%=request("dbfilename")%>">
</HEAD>
</HTML>