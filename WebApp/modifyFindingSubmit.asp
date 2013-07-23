<%
	Set sqlconnection = Server.CreateObject("ADODB.Connection")	Set rs = Server.CreateObject("ADODB.recordset")
		
		dbquantity=request("dbquantity")
		dbpolypsize=request("dbpolypsize")
		dbpolyplength=request("dbpolyplength")
		dbhowtaken=request("dbhowtaken")
		'if trim(request("dbhowtaken")) = "" then
			dbhowtaken="1"
		'else
			'lookup id
			'dbhowtaken=request("dbhowtaken")
		'end if
		'if trim(request("dbparttaken")) = "" then
			dbparttaken="1"
		'else
			'lookup id
			'dbparttaken=request("dbparttaken")
		'end if
		
		if trim(request("dbdestroyed")) = "on" then
			dbdestroyed="1"
		else
			dbdestroyed="0"
		end if	
		dbcolor=request("dbcolor")
		dbcustomcolor=request("dbcustomcolor")
		if trim(request("dbignoredestroyed")) = "on" then
			dbignoredestroyed="1"
		else
			dbignoredestroyed="0"
		end if
		dbdysplasia=request("dbdysplasia")
		dbpathologytext=request("dbpathologytext")
		dbpolypid=request("polypid")
		dbpolypno=cint(request("polypidno"))+1
	
if (request("from")="main") then

		
		sqlconnection.ConnectionTimeout=60
		sqlconnection.Open session("dbColonDSN"),session("dbUsername"),session("dbPassword")

		
		if request("ftype")="add" then
			'Response.Write "INSERT INTO polyps (operationid,polypno,quantity,polypsize,polyplength,howtaken,parttaken,destroyed,color,customcolor,ignoredestroyed,pathologytext) VALUES ('{" + Session("operation_id") + "}'," + cstr(dbpolypno) + "," + dbquantity + ",'" + dbpolypsize + "mm','" + dbpolyplength + "cm','" + dbhowtaken + "','" + dbparttaken + "'," + dbdestroyed + ",'" + replace(dbcolor,"P","''") + "','" + dbcustomcolor + "'," + dbignoredestroyed + ",'" + dbpathologytext + "')"
			rs.Open "INSERT INTO polyps (operationid,polypno,quantity,polypsize,polyplength,howtaken,parttaken,destroyed,color,customcolor,ignoredestroyed,pathologytext) VALUES ('{" + Session("operation_id") + "}'," + cstr(dbpolypno) + "," + dbquantity + ",'" + dbpolypsize + "mm','" + dbpolyplength + "cm','" + dbhowtaken + "','" + dbparttaken + "'," + dbdestroyed + ",'" + replace(dbcolor,"P","''") + "','" + dbcustomcolor + "'," + dbignoredestroyed + ",'" + dbpathologytext + "')", sqlconnection
		elseif request("ftype")="modify" then
			'Response.Write "UPDATE polyps SET operationid='{" + Session("operation_id") + "}',quantity=" + dbquantity + ",polypsize='" + dbpolypsize + "cm',polyplength='" + dbpolyplength + "cm',howtaken='" + dbhowtaken + "',parttaken='" + dbparttaken + "',destroyed=" + dbdestroyed + ",color='" + replace(dbcolor,"P","''") + "',customcolor='" + dbcustomcolor + "',ignoredestroyed=" + dbignoredestroyed + ",dysplasia=" + dbdysplasia + ",pathologytext='" + dbpathologytext + "' WHERE polypid='"+ replace(replace(request("polypid"),"{",""),"}","") +"'"
			rs.Open "UPDATE polyps SET operationid='{" + Session("operation_id") + "}',quantity=" + dbquantity + ",polypsize='" + dbpolypsize + "mm',polyplength='" + dbpolyplength + "cm',howtaken='" + dbhowtaken + "',parttaken='" + dbparttaken + "',destroyed=" + dbdestroyed + ",color='" + replace(dbcolor,"P","''") + "',customcolor='" + dbcustomcolor + "',ignoredestroyed=" + dbignoredestroyed + ",pathologytext='" + dbpathologytext + "' WHERE polypid='"+ replace(replace(request("polypid"),"{",""),"}","") +"'", sqlconnection
		elseif request("ftype")="delete" then
			'Response.Write "UPDATE polyps SET operationid='{" + Session("operation_id") + "}',quantity=" + dbquantity + ",polypsize='" + dbpolypsize + "cm',polyplength='" + dbpolyplength + "cm',howtaken='" + dbhowtaken + "',parttaken='" + dbparttaken + "',destroyed=" + dbdestroyed + ",color='" + replace(dbcolor,"P","''") + "',customcolor='" + dbcustomcolor + "',ignoredestroyed=" + dbignoredestroyed + ",dysplasia=" + dbdysplasia + ",pathologytext='" + dbpathologytext + "' WHERE polypid='"+ replace(replace(request("polypid"),"{",""),"}","") +"'"
			rs.Open "DELETE FROM polyps WHERE polypid='"+ replace(replace(request("polypid"),"{",""),"}","") +"'", sqlconnection
		end if
		
		
		
		Response.Redirect "findings.asp"
elseif (request("from")="modifyColors") then
%>
<HTML>
<HEAD>
<SCRIPT>
function initDbcolors() {
	//alert("document.forms(0).dbcolor.value="+document.forms(0).dbcolor.value);
	document.forms(0).dbcolor.value='<%=dbcolor%>';
	return;
}

function colorClick(n) {
	//alert("document.forms(0).dbcolor.value="+document.forms(0).dbcolor.value+"\nn.checked="+n.checked+"\nn.name="+n.name);
	if (n.checked==true) {
		document.forms(0).dbcolor.value=document.forms(0).dbcolor.value+'P'+n.name+'P';
	}
	else {
		document.forms(0).dbcolor.value=document.forms(0).dbcolor.value.replace('P'+n.name+'P','');
	}
	return;
}
</SCRIPT>
</HEAD>
<BODY  bgcolor=lightgrey onload="initDbcolors();">
<input type="hidden" id="operation_id" name="operation_id" value="<%=Session("operation_id")%>">
<FORM action=modifyFinding.asp method="post" id=form1 name=form1>
<CENTER>
<TABLE WIDTH=* BORDER=0 CELLSPACING=0 CELLPADDING=0>
	<TR>
		<TD colspan=2 rowspan=2 align=left width=* height=350 valign=top>
		<FONT size=+1><B>Finding Descriptors</B></FONT>
	<HR width=320 align=left>
	<TABLE WIDTH=* BORDER=0 CELLSPACING=4 CELLPADDING=1>

			<%			
			Set sqlconnection = Server.CreateObject("ADODB.Connection")			Set rs = Server.CreateObject("ADODB.recordset")
						sqlconnection.ConnectionTimeout=60
			sqlconnection.Open session("dbColonDSN"),session("dbUsername"),session("dbPassword")			

			rs.Open "SELECT * FROM id_polyp_color ORDER BY text", sqlconnection
			
			if (not rs.EOF) then
				do until rs.EOF
					preLineCount=0
					Response.Write "<TR>" + vbcrlf
					do until preLineCount>=2 or rs.eof
						if InStr(1,dbcolor,"P" +  Cstr(rs.Fields("id")) + "P") > 0 then
							Response.Write "<TD width=41><INPUT type=checkbox id=" + Cstr(rs.Fields("id")) + " name=" + Cstr(rs.Fields("id")) + " style=""WIDTH: 50px; HEIGHT: 50px"" size=41 onclick=""colorClick(this);"" checked></TD>" + vbcrlf
						else
							Response.Write "<TD width=41><INPUT type=checkbox id=" + Cstr(rs.Fields("id")) + " name=" + Cstr(rs.Fields("id")) + " style=""WIDTH: 50px; HEIGHT: 50px"" size=41 onclick=""colorClick(this);""></TD>" + vbcrlf
						end if
						Response.Write "<TD><FONT size=+1>" + Cstr(rs.Fields("text")) + "</FONT></TD>" + vbcrlf
						preLineCount=preLineCount+1
						rs.MoveNext
					loop
					Response.Write "</TR>" + vbcrlf
				loop
			end if

			rs.close
			sqlconnection.close
			%>
</TABLE>
<TABLE width=320 border=0 CELLSPACING=0 CELLPADDING=0>
	<TR>
		<TD><INPUT id=exitBtn style="FONT-WEIGHT: bold; FONT-SIZE: larger; WIDTH: 105px; COLOR: white; FONT-FAMILY: monospace; HEIGHT: 76px; BACKGROUND-COLOR: black" type=button size=31 value="Back" name=exitBtn onclick="document.location.href='modifyFinding.asp'"></TD>
		<TD colspan=2 align=right><INPUT id=nextBtn style="FONT-WEIGHT: bold; FONT-SIZE: larger; WIDTH: 105px; COLOR: black; FONT-FAMILY: monospace; HEIGHT: 76px; BACKGROUND-COLOR: grey" type=submit size=31 value="Ok" name=nextBtn></TD>
	</TR>
</TABLE>
</CENTER>
<INPUT type="hidden" value="<%=request("ftype")%>" id=ftype name=ftype style="FONT-SIZE: larger; WIDTH: 200px; HEIGHT: 40px">
<INPUT type="hidden" value="<%=request("dbquantity")%>" id=dbquantity name=dbquantity style="FONT-SIZE: larger; WIDTH: 200px; HEIGHT: 40px">
<INPUT type="hidden" value="<%=request("dbpolypsize")%>" id=dbpolypsize name=dbpolypsize style="FONT-SIZE: larger; WIDTH: 200px; HEIGHT: 40px">
<INPUT type="hidden" value="<%=request("dbpolyplength")%>" id=dbpolyplength name=dbpolyplength style="FONT-SIZE: larger; WIDTH: 200px; HEIGHT: 40px">
<INPUT type="hidden" value="<%=request("dbhowtaken")%>" id=dbhowtaken name=dbhowtaken style="FONT-SIZE: larger; WIDTH: 200px; HEIGHT: 40px">
<INPUT type="hidden" value="<%=request("dbparttaken")%>" id=dbparttaken name=dbparttaken style="FONT-SIZE: larger; WIDTH: 200px; HEIGHT: 40px">
<INPUT type="hidden" value="<%=dbdestroyed%>" id=dbdestroyed name=dbdestroyed style="FONT-SIZE: larger; WIDTH: 200px; HEIGHT: 40px">
<INPUT type="hidden" value="" id=dbcolor name=dbcolor style="FONT-SIZE: larger; WIDTH: 200px; HEIGHT: 40px">
<INPUT type="hidden" value="<%=request("dbcustomcolor")%>" id=dbcustomcolor name=dbcustomcolor style="FONT-SIZE: larger; WIDTH: 200px; HEIGHT: 40px">
<INPUT type="hidden" value="<%=dbignoredestroyed%>" id=dbignoredestroyed name=dbignoredestroyed style="FONT-SIZE: larger; WIDTH: 200px; HEIGHT: 40px">
<INPUT type="hidden" value="<%=request("dbdysplasia")%>" id=dbdysplasia name=dbdysplasia style="FONT-SIZE: larger; WIDTH: 200px; HEIGHT: 40px">
<INPUT type="hidden" value="<%=request("dbpathologytext")%>" id=dbpathologytext name=dbpathologytext style="FONT-SIZE: larger; WIDTH: 200px; HEIGHT: 40px">
<INPUT type="hidden" value=modifyFindingSubmit id=from name=from style="FONT-SIZE: larger; WIDTH: 200px; HEIGHT: 40px">
<INPUT type="hidden" value="<%=dbpolypid%>" id=polypid name=polypid style="FONT-SIZE: larger; WIDTH: 200px; HEIGHT: 40px">
</FORM>
</BODY>
</HTML>
<%
elseif (request("from")="modifyPart") then
%>
<HTML>
<HEAD>
</HEAD>
<BODY  bgcolor=lightgrey>
<input type="hidden" id="operation_id" name="operation_id" value="<%=Session("operation_id")%>">
<FORM action=modifyFinding.asp method="post" id=form1 name=form1>
<CENTER>
<TABLE WIDTH=* BORDER=0 CELLSPACING=0 CELLPADDING=0>
	<TR>
		<TD colspan=2 rowspan=2 align=left width=* height=350 valign=top>
		<FONT size=+1><B>Where Taken</B></FONT>
	<HR width=320 align=left>
	<TABLE WIDTH=* BORDER=0 CELLSPACING=4 CELLPADDING=1>

			<%			
			Set sqlconnection = Server.CreateObject("ADODB.Connection")			Set rs = Server.CreateObject("ADODB.recordset")
						sqlconnection.ConnectionTimeout=60
			sqlconnection.Open session("dbColonDSN"),session("dbUsername"),session("dbPassword")			

			rs.Open "SELECT * FROM id_polyp_parttaken ORDER BY sortingOrder ASC", sqlconnection
			
			if (not rs.EOF) then
				do until rs.EOF
					preLineCount=0
					Response.Write "<TR>" + vbcrlf
					do until preLineCount>=2 or rs.eof
						if trim(request("dbparttaken"))=trim(Cstr(rs.Fields("location"))) then
						Response.Write "<TD width=41><INPUT type=radio id=dbparttaken name=dbparttaken value=""" + Cstr(rs.Fields("location")) + """ style=""WIDTH: 50px; HEIGHT: 50px"" size=41 checked></TD>" + vbcrlf
						else
						Response.Write "<TD width=41><INPUT type=radio id=dbparttaken name=dbparttaken value=""" + Cstr(rs.Fields("location")) + """ style=""WIDTH: 50px; HEIGHT: 50px"" size=41></TD>" + vbcrlf
						end if
						Response.Write "<TD><FONT size=+1>" + Cstr(rs.Fields("location")) + "</FONT></TD>" + vbcrlf
						preLineCount=preLineCount+1
						rs.MoveNext
					loop
					Response.Write "</TR>" + vbcrlf
				loop
			end if

			rs.close
			sqlconnection.close
			%>
</TABLE>
<TABLE width=320 border=0 CELLSPACING=0 CELLPADDING=0>
	<TR>
		<TD><INPUT id=exitBtn style="FONT-WEIGHT: bold; FONT-SIZE: larger; WIDTH: 105px; COLOR: white; FONT-FAMILY: monospace; HEIGHT: 76px; BACKGROUND-COLOR: black" type=button size=31 value="Back" name=exitBtn onclick="document.location.href='modifyFinding.asp'"></TD>
		<TD colspan=2 align=right><INPUT id=nextBtn style="FONT-WEIGHT: bold; FONT-SIZE: larger; WIDTH: 105px; COLOR: black; FONT-FAMILY: monospace; HEIGHT: 76px; BACKGROUND-COLOR: grey" type=submit size=31 value="Ok" name=nextBtn></TD>
	</TR>
</TABLE>
</CENTER>
<INPUT type="hidden" value="<%=request("ftype")%>" id=ftype name=ftype style="FONT-SIZE: larger; WIDTH: 200px; HEIGHT: 40px">
<INPUT type="hidden" value="<%=request("dbquantity")%>" id=dbquantity name=dbquantity style="FONT-SIZE: larger; WIDTH: 200px; HEIGHT: 40px">
<INPUT type="hidden" value="<%=request("dbpolypsize")%>" id=dbpolypsize name=dbpolypsize style="FONT-SIZE: larger; WIDTH: 200px; HEIGHT: 40px">
<INPUT type="hidden" value="<%=request("dbpolyplength")%>" id=dbpolyplength name=dbpolyplength style="FONT-SIZE: larger; WIDTH: 200px; HEIGHT: 40px">
<INPUT type="hidden" value="<%=request("dbhowtaken")%>" id=dbhowtaken name=dbhowtaken style="FONT-SIZE: larger; WIDTH: 200px; HEIGHT: 40px">
<INPUT type="hidden" value="<%=dbdestroyed%>" id=dbdestroyed name=dbdestroyed style="FONT-SIZE: larger; WIDTH: 200px; HEIGHT: 40px">
<INPUT type="hidden" value="<%=request("dbcolor")%>" id=dbcolor name=dbcolor style="FONT-SIZE: larger; WIDTH: 200px; HEIGHT: 40px">
<INPUT type="hidden" value="<%=request("dbcustomcolor")%>" id=dbcustomcolor name=dbcustomcolor style="FONT-SIZE: larger; WIDTH: 200px; HEIGHT: 40px">
<INPUT type="hidden" value="<%=dbignoredestroyed%>" id=dbignoredestroyed name=dbignoredestroyed style="FONT-SIZE: larger; WIDTH: 200px; HEIGHT: 40px">
<INPUT type="hidden" value="<%=request("dbdysplasia")%>" id=dbdysplasia name=dbdysplasia style="FONT-SIZE: larger; WIDTH: 200px; HEIGHT: 40px">
<INPUT type="hidden" value="<%=request("dbpathologytext")%>" id=dbpathologytext name=dbpathologytext style="FONT-SIZE: larger; WIDTH: 200px; HEIGHT: 40px">
<INPUT type="hidden" value=modifyFindingSubmit id=from name=from style="FONT-SIZE: larger; WIDTH: 200px; HEIGHT: 40px">
<INPUT type="hidden" value="<%=dbpolypid%>" id=polypid name=polypid style="FONT-SIZE: larger; WIDTH: 200px; HEIGHT: 40px">
</FORM>
</BODY>
</HTML>
<%
elseif (request("from")="modifyHow") then
%>
<HTML>
<HEAD>
</HEAD>
<BODY  bgcolor=lightgrey>
<input type="hidden" id="operation_id" name="operation_id" value="<%=Session("operation_id")%>">
<FORM action=modifyFinding.asp method="post" id=form1 name=form1>
<CENTER>
<TABLE WIDTH=* BORDER=0 CELLSPACING=0 CELLPADDING=0>
	<TR>
		<TD colspan=2 rowspan=2 align=left width=* height=350 valign=top>
		<FONT size=+1><B>How Taken</B></FONT>
	<HR width=320 align=left>
	<TABLE WIDTH=* BORDER=0 CELLSPACING=4 CELLPADDING=1>

			<%			
			Set sqlconnection = Server.CreateObject("ADODB.Connection")			Set rs = Server.CreateObject("ADODB.recordset")
						sqlconnection.ConnectionTimeout=60
			sqlconnection.Open session("dbColonDSN"),session("dbUsername"),session("dbPassword")			

			rs.Open "SELECT * FROM id_polyp_howtaken", sqlconnection
			
			if (not rs.EOF) then
				do until rs.EOF
					preLineCount=0
					Response.Write "<TR>" + vbcrlf
					do until preLineCount>=1 or rs.eof
						if trim(request("dbhowtaken"))=trim(Cstr(rs.Fields("text"))) then
						Response.Write "<TD width=41><INPUT type=radio id=dbhowtaken name=dbhowtaken value=""" + Cstr(rs.Fields("text")) + """ style=""WIDTH: 50px; HEIGHT: 50px"" size=41 checked></TD>" + vbcrlf
						else
						Response.Write "<TD width=41><INPUT type=radio id=dbhowtaken name=dbhowtaken value=""" + Cstr(rs.Fields("text")) + """ style=""WIDTH: 50px; HEIGHT: 50px"" size=41></TD>" + vbcrlf
						end if
						Response.Write "<TD><FONT size=+1>" + Cstr(rs.Fields("text")) + "</FONT></TD>" + vbcrlf
						preLineCount=preLineCount+1
						rs.MoveNext
					loop
					Response.Write "</TR>" + vbcrlf
				loop
			end if

			rs.close
			sqlconnection.close
			%>
</TABLE>
<TABLE width=320 border=0 CELLSPACING=0 CELLPADDING=0>
	<TR>
		<TD><INPUT id=exitBtn style="FONT-WEIGHT: bold; FONT-SIZE: larger; WIDTH: 105px; COLOR: white; FONT-FAMILY: monospace; HEIGHT: 76px; BACKGROUND-COLOR: black" type=button size=31 value="Back" name=exitBtn onclick="document.location.href='modifyFinding.asp'"></TD>
		<TD colspan=2 align=right><INPUT id=nextBtn style="FONT-WEIGHT: bold; FONT-SIZE: larger; WIDTH: 105px; COLOR: black; FONT-FAMILY: monospace; HEIGHT: 76px; BACKGROUND-COLOR: grey" type=submit size=31 value="Ok" name=nextBtn></TD>
	</TR>
</TABLE>
</CENTER>
<INPUT type="hidden" value="<%=request("ftype")%>" id=ftype name=ftype style="FONT-SIZE: larger; WIDTH: 200px; HEIGHT: 40px">
<INPUT type="hidden" value="<%=request("dbquantity")%>" id=dbquantity name=dbquantity style="FONT-SIZE: larger; WIDTH: 200px; HEIGHT: 40px">
<INPUT type="hidden" value="<%=request("dbpolypsize")%>" id=dbpolypsize name=dbpolypsize style="FONT-SIZE: larger; WIDTH: 200px; HEIGHT: 40px">
<INPUT type="hidden" value="<%=request("dbpolyplength")%>"id=dbpolyplength name=dbpolyplength style="FONT-SIZE: larger; WIDTH: 200px; HEIGHT: 40px">
<INPUT type="hidden" value="<%=request("dbparttaken")%>" id=dbparttaken name=dbparttaken style="FONT-SIZE: larger; WIDTH: 200px; HEIGHT: 40px">
<INPUT type="hidden" value="<%=dbdestroyed%>" id=dbdestroyed name=dbdestroyed style="FONT-SIZE: larger; WIDTH: 200px; HEIGHT: 40px">
<INPUT type="hidden" value="<%=request("dbcolor")%>" id=dbcolor name=dbcolor style="FONT-SIZE: larger; WIDTH: 200px; HEIGHT: 40px">
<INPUT type="hidden" value="<%=request("dbcustomcolor")%>" id=dbcustomcolor name=dbcustomcolor style="FONT-SIZE: larger; WIDTH: 200px; HEIGHT: 40px">
<INPUT type="hidden" value="<%=dbignoredestroyed%>" id=dbignoredestroyed name=dbignoredestroyed style="FONT-SIZE: larger; WIDTH: 200px; HEIGHT: 40px">
<INPUT type="hidden" value="<%=request("dbdysplasia")%>" id=dbdysplasia name=dbdysplasia style="FONT-SIZE: larger; WIDTH: 200px; HEIGHT: 40px">
<INPUT type="hidden" value="<%=request("dbpathologytext")%>" id=dbpathologytext name=dbpathologytext style="FONT-SIZE: larger; WIDTH: 200px; HEIGHT: 40px">
<INPUT type="hidden" value=modifyFindingSubmit id=from name=from style="FONT-SIZE: larger; WIDTH: 200px; HEIGHT: 40px">
<INPUT type="hidden" value="<%=dbpolypid%>" id=polypid name=polypid style="FONT-SIZE: larger; WIDTH: 200px; HEIGHT: 40px">
</FORM>
</BODY>
</HTML>
<%
end if
%>