<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<TITLE></TITLE>
</HEAD>
<BODY  bgcolor=lightgrey>
<input type="hidden" id="operation_id" name="operation_id" value="<%=Session("operation_id")%>">
<CENTER>
<FORM action="">
<TABLE WIDTH=100% BORDER=0 CELLSPACING=0 CELLPADDING=0>
	<TR>
		<TD valign=top>
		<FONT size=+1><B>Findings</B></FONT>
		<HR width=320 align=left>
		<TABLE WIDTH=100% BORDER=0 CELLSPACING=4 CELLPADDING=1>
			<TR>
			<TD colspan=2>
			<TABLE WIDTH=100% BORDER=1 CELLSPACING=4 CELLPADDING=1>
			<%			
			Set sqlconnection = Server.CreateObject("ADODB.Connection")			Set rs = Server.CreateObject("ADODB.recordset")
						sqlconnection.ConnectionTimeout=60
			sqlconnection.Open session("dbColonDSN"),session("dbUsername"),session("dbPassword")
			'Response.Write "SELECT polyps.polypsize,polyps.polyplength,id_polyp_parttaken.text FROM polyps,id_polyp_parttaken WHERE id_polyp_parttaken.id=polyps.parttaken AND polyps.operationid LIKE '"+ Session("operation_id") +"'" + "<BR>"			rs.Open "SELECT polyps.polypid, polyps.polypsize,polyps.polyplength,id_polyp_parttaken.text FROM polyps,id_polyp_parttaken WHERE id_polyp_parttaken.id=polyps.parttaken AND polyps.operationid LIKE '"+ Session("operation_id") +"'", sqlconnection	' WHERE operationid = '"+ session("operationid") +"'", sqlconnection
			polypno=0
			if (not rs.EOF) then
				do until rs.EOF
					polypno=polypno+1
					Response.Write "<TR>" + vbcrlf
					Response.Write "<TD rowspan=2 bgcolor=gray width=10 onclick=""document.location.href='modifyFinding.asp?from=modify&polypid=" + Cstr(rs.Fields("polypid")) +"';""></TD>" + vbcrlf
					Response.Write "<TD valign=top  onclick=""document.location.href='modifyFinding.asp?from=modify&polypid=" + Cstr(rs.Fields("polypid")) + "&polypno=" + cstr(polypno) + "';""><B>" + Cstr(rs.Fields("polypsize")) + " finding " + Cstr(rs.Fields("text")) + " at " + Cstr(rs.Fields("polyplength")) + "</B></TD>" + vbcrlf
					Response.Write "<TD align=left><INPUT type=""button"" value=""DEL"" id=button1 name=button1 style=""WIDTH: 50px; HEIGHT: 40px;"" onclick=""if (confirm('Delete this finding?')) {document.location.href='modifyFindingSubmit.asp?from=main&ftype=delete&polypid=" + Cstr(rs.Fields("polypid")) + "';}""></TD>" + vbcrlf
					Response.Write "</TR>" + vbcrlf
					Response.Write "<TR>" + vbcrlf
					Response.Write "<TD colspan=2></TD>" + vbcrlf
					Response.Write "</TR>" + vbcrlf
					rs.MoveNext
				loop
			else
					Response.Write "<TR>" + vbcrlf
					Response.Write "<TD valign=top><B>No findings for this procedure<B></TD>" + vbcrlf
					Response.Write "</TR>" + vbcrlf
			end if

			rs.close
			sqlconnection.close
			%>
	</TABLE>
	</TD>
	</TR>
	<TR>
		<TD colspan=2><INPUT id=nextBtn style="FONT-WEIGHT: bold; FONT-SIZE: larger; WIDTH: 105px; COLOR: black; FONT-FAMILY: monospace; HEIGHT: 76px; BACKGROUND-COLOR: grey" type=button size=31 value="Add" name=nextBtn onclick="document.location.href='modifyFinding.asp?from=add&polypno=<%=cstr(polypno)%>'"></TD>
	</TR>
	<TR>
		<TD colspan=2><HR></TD>
	</TR>
</TABLE>
<TABLE width=320 border=0 CELLSPACING=0 CELLPADDING=0>
	<TR>
		<TD><INPUT id=exitBtn style="FONT-WEIGHT: bold; FONT-SIZE: larger; WIDTH: 105px; COLOR: white; FONT-FAMILY: monospace; HEIGHT: 76px; BACKGROUND-COLOR: black" type=button size=31 value="Back" name=exitBtn onclick="document.location.href='intraopmenu.asp'"></TD>
		<TD colspan=2 align=right><INPUT id=nextBtn style="FONT-WEIGHT: bold; FONT-SIZE: larger; WIDTH: 105px; COLOR: black; FONT-FAMILY: monospace; HEIGHT: 76px; BACKGROUND-COLOR: grey" type=button size=31 value="Ok" onclick="document.location.href='intraopmenu.asp'"></TD>
	</TR>
</TABLE>
</FORM>
</CENTER>
</BODY>
</HTML>
