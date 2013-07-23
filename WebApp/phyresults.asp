<%
if Session("grantAccess") <> 1 then 
	Response.Redirect "login.html"
end if
%>

<HTML>
<HEAD>
<TITLE></TITLE>
</HEAD>
<BODY>
<CENTER>
<a name="colonoscopies"></a>
<TABLE WIDTH=600>
<TR>
<TD colspan=1><B>Colonoscopies:</B></TD>
<TD colspan=5 align=right><A href="#egds">Go to EGDs</A></TD>
</TR>


			<%			total_colonoscopies=0			
			Set sqlconnection = Server.CreateObject("ADODB.Connection")			Set rs = Server.CreateObject("ADODB.recordset")
						sqlconnection.ConnectionTimeout=60
			sqlconnection.Open session("dbColonDSN"),session("dbUsername"),session("dbPassword")
			
			rs.Open "SELECT operationdate, (lname+', '+fname) as patientname, primphone as patientphone, followupdate, dob FROM colonoscopy WHERE attendingphysician=" + Request("physician") + " AND operationdate BETWEEN '" + Request("startdate") + "' AND '" + Request("enddate") + "' ORDER BY " + Request("orderByStr"), sqlconnection
			
			if (not rs.EOF) then
				do until rs.EOF
					total_colonoscopies=total_colonoscopies+1
					Response.Write "<TR>" + vbcrlf
					Response.Write "<TD width=100>"
					if not isnull(rs.Fields("operationdate")) then
						Response.Write Cstr(rs.Fields("operationdate"))
					else
						Response.Write "Null"
					end if
					Response.Write "</TD>" + vbcrlf
					Response.Write "<TD width=200><CENTER>"
					if not isnull(rs.Fields("patientname")) then
						Response.Write Cstr(rs.Fields("patientname"))
					else
						Response.Write "Null"
					end if
					Response.Write "</CENTER></TD>" + vbcrlf
					Response.Write "<TD width=100><CENTER>"
					if not isnull(rs.Fields("patientphone")) then
						Response.Write Cstr(rs.Fields("patientphone"))
					else
						Response.Write "Null"
					end if
					Response.Write "</CENTER></TD>" + vbcrlf
					Response.Write "<TD width=250>"
					if not isnull(rs.Fields("followupdate")) then
						Response.Write Cstr(rs.Fields("followupdate"))
					else
						Response.Write "<center>Null</center>"
					end if
					Response.Write "</TD>" + vbcrlf
					Response.Write "<TD width=50 align=right>"
					if not isnull(rs.Fields("dob")) then
						Response.Write Cstr(rs.Fields("dob"))
					else
						Response.Write "Null"
					end if
					Response.Write "</TD>" + vbcrlf
					Response.Write "</TR>" + vbcrlf
					rs.MoveNext
				loop
				Response.Write "</TABLE>" + vbcrlf
				Response.Write "<BR>" + vbcrlf
				Response.Write "<TABLE WIDTH=600>" + vbcrlf
				Response.Write "<TR>" + vbcrlf
				Response.Write "<TD width=200><FONT size=-1><B>Total colonoscopies: " + Cstr(total_colonoscopies) + "</B></FONT></TD>" + vbcrlf
			else
				Response.Write "</TABLE>" + vbcrlf
				Response.Write "<BR>" + vbcrlf
				Response.Write "<TABLE WIDTH=600>" + vbcrlf
				Response.Write "<TR>" + vbcrlf
				Response.Write "<TD width=200><FONT size=-1><B>No data found!</B></FONT></TD>" + vbcrlf
			end if

			rs.close
			sqlconnection.close
			%>
			
			
</TR>
</TABLE>
<BR> 
<BR>
<a name="egds"></a>
<TABLE WIDTH=600>
<TR>
<TD colspan=1><B>EGDs:</B></TD>
<TD colspan=5 align=right><A href="#colonoscopies">Go to Colonoscopies</A></TD>
</TR>

			<%			total_egds=0			
			Set sqlconnection = Server.CreateObject("ADODB.Connection")			Set rs = Server.CreateObject("ADODB.recordset")
						sqlconnection.ConnectionTimeout=60
			sqlconnection.Open session("dbColonDSN"),session("dbUsername"),session("dbPassword")
			
			rs.Open "SELECT operationdate, (lname+', '+fname) as patientname, primphone as patientphone, followupdate, dob FROM egd WHERE attendingphysician=" + Request("physician") + " AND operationdate BETWEEN '" + Request("startdate") + "' AND '" + Request("enddate") + "' ORDER BY operationdate", sqlconnection
			
			if (not rs.EOF) then
				do until rs.EOF
					total_egds=total_egds+1
					Response.Write "<TR>" + vbcrlf
					Response.Write "<TD width=100>"
					if not isnull(rs.Fields("operationdate")) then
						Response.Write Cstr(rs.Fields("operationdate"))
					else
						Response.Write "Null"
					end if
					Response.Write "</TD>" + vbcrlf
					Response.Write "<TD width=200><CENTER>"
					if not isnull(rs.Fields("patientname")) then
						Response.Write Cstr(rs.Fields("patientname"))
					else
						Response.Write "Null"
					end if
					Response.Write "</CENTER></TD>" + vbcrlf
					Response.Write "<TD width=100><CENTER>"
					if not isnull(rs.Fields("patientphone")) then
						Response.Write Cstr(rs.Fields("patientphone"))
					else
						Response.Write "Null"
					end if
					Response.Write "</CENTER></TD>" + vbcrlf
					Response.Write "<TD width=250>"
					if not isnull(rs.Fields("followupdate")) then
						Response.Write Cstr(rs.Fields("followupdate"))
					else
						Response.Write "<center>Null</center>"
					end if
					Response.Write "</TD>" + vbcrlf
					Response.Write "<TD width=50 align=right>"
					if not isnull(rs.Fields("dob")) then
						Response.Write Cstr(rs.Fields("dob"))
					else
						Response.Write "Null"
					end if
					Response.Write "</TD>" + vbcrlf
					Response.Write "</TR>" + vbcrlf
					rs.MoveNext
				loop
				Response.Write "</TABLE>" + vbcrlf
				Response.Write "<BR>" + vbcrlf
				Response.Write "<TABLE WIDTH=600>" + vbcrlf
				Response.Write "<TR>" + vbcrlf
				Response.Write "<TD width=200><FONT size=-1><B>Total EGDs: " + Cstr(total_egds) + "</B></FONT></TD>" + vbcrlf
			else
				Response.Write "</TABLE>" + vbcrlf
				Response.Write "<BR>" + vbcrlf
				Response.Write "<TABLE WIDTH=600>" + vbcrlf
				Response.Write "<TR>" + vbcrlf
				Response.Write "<TD width=200><FONT size=-1><B>No data found!</B></FONT></TD>" + vbcrlf
			end if

			rs.close
			sqlconnection.close
			%>
			
			
</TR>
</TABLE>
</CENTER>
</BODY>
</HTML>
