<%
	Set sqlconnection = Server.CreateObject("ADODB.Connection")	Set rs = Server.CreateObject("ADODB.recordset")
if (request("from")="add") then
	ftype="add"
	dbquantity="1"
elseif (request("from")="modify") then
	ftype="modify"
	dbpolypid=request("dbpolypid")
	Set sqlconnection = Server.CreateObject("ADODB.Connection")	Set rs = Server.CreateObject("ADODB.recordset")
				sqlconnection.ConnectionTimeout=60
	sqlconnection.Open session("dbColonDSN"),session("dbUsername"),session("dbPassword")
	'Response.Write	"SELECT * FROM polyps WHERE polypid = '"+ replace(replace(request("polypid"),"{",""),"}","") +"'"	rs.Open "SELECT polyps.quantity, polyps.polypsize, polyps.polyplength, id_polyp_howtaken.text as howtaken, id_polyp_parttaken.location as parttaken, polyps.color, polyps.customcolor, polyps.destroyed, polyps.ignoredestroyed, polyps.dysplasia, polyps.pathologytext FROM polyps, id_polyp_howtaken, id_polyp_parttaken WHERE polyps.parttaken=id_polyp_parttaken.id AND polyps.howtaken=id_polyp_howtaken.id AND polyps.polypid = '"+ replace(replace(request("polypid"),"{",""),"}","") +"'", sqlconnection
			
	if (not rs.EOF) then
		dbquantity=Cstr(rs.Fields("quantity"))
		dbpolypsize=replace(Cstr(rs.Fields("polypsize")),"cm","")
		dbpolyplength=replace(Cstr(rs.Fields("polyplength")),"cm","")
		dbhowtaken=Cstr(rs.Fields("howtaken"))
		dbparttaken=Cstr(rs.Fields("parttaken"))
		dbcolor=replace(Cstr(rs.Fields("color")),"'","P")
		dbcustomcolor=Cstr(rs.Fields("customcolor"))
		if Cstr(rs.Fields("destroyed"))="True" then
			dbdestroyed="1"
		else
			dbdestroyed="0"
		end if
		if Cstr(rs.Fields("ignoredestroyed"))="True" then
			dbignoredestroyed="1"
		else
			dbignoredestroyed="0"
		end if
		dbdysplasia=""
		dbpathologytext=Cstr(rs.Fields("pathologytext"))
		dbpolypid=request("polypid")
		
	end if

	rs.close
	sqlconnection.close
elseif (request("from")="modifyFindingSubmit") then
		ftype=request("ftype")
		dbquantity=request("dbquantity")
		dbpolypsize=request("dbpolypsize")
		dbpolyplength=request("dbpolyplength")
		dbhowtaken=request("dbhowtaken")
		dbparttaken=request("dbparttaken")
		dbdestroyed=request("dbdestroyed")
		dbcolor=trim(request("dbcolor"))
		dbcustomcolor=request("dbcustomcolor")
		dbignoredestroyed=request("dbignoredestroyed")
		dbdysplasia=request("dbdysplasia")
		dbpathologytext=request("dbpathologytext")
		dbpolypid=request("polypid")
end if
		dbpolypno=request("polypno")
%>
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<TITLE></TITLE>
</HEAD>
<BODY  bgcolor=lightgrey>
<input type="hidden" id="operation_id" name="operation_id" value="<%=Session("operation_id")%>">
<CENTER>
<FORM action="modifyFindingSubmit.asp">
<input type="hidden" id="from" name="from" value="main">
<input type="hidden" id="ftype" name="ftype" value="<%=ftype%>">
<input type="hidden" id="polypid" name="polypid" value="<%=dbpolypid%>">
<input type="hidden" id="polypno" name="polypno" value="<%=dbpolypno%>">
<TABLE WIDTH=100% BORDER=0 CELLSPACING=0 CELLPADDING=0>
	<TR>
		<TD colspan=2 rowspan=2 align=left  align=left width=* height=350 valign=top>
		<FONT size=+1><B>Modify Finding</B></FONT>
		<HR width=320 align=left>
		<TABLE WIDTH=100% BORDER=0 CELLSPACING=4 CELLPADDING=1>
	<TR>
		<TD><B>Quantity</B></TD>
		<TD><INPUT type="text" id=dbquantity name=dbquantity value="<%=dbquantity%>" style="FONT-SIZE: larger; WIDTH: 200px; HEIGHT: 40px"></TD>
	</TR>
	<TR>
		<TD><B>Size (mm)</B></TD>
		<TD><INPUT type="text" id=dbpolypsize name=dbpolypsize value="<%=dbpolypsize%>" style="FONT-SIZE: larger; WIDTH: 200px; HEIGHT: 40px"></TD>
	</TR>
	<TR>
		<TD><B>Distance (cm)</B></TD>
		<TD><INPUT type="text" id=dbpolyplength name=dbpolyplength value="<%=dbpolyplength%>" style="FONT-SIZE: larger; WIDTH: 200px; HEIGHT: 40px"></TD>
	</TR>
	<INPUT type="hidden" id=dbdysplasia name=dbdysplasia value="">
	<TR>
		<TD><B>Descriptors</B></TD>
		<TD><B>(colors)</B></TD>
	</TR>
	<TR>
		<TD colspan=2><HR><INPUT type="hidden" id=dbcolor name=dbcolor style="FONT-SIZE: larger; WIDTH: 200px; HEIGHT: 40px" value="<%=dbcolor%>"></TD>
	</TR>
	<TR>
		<TD colspan=2>
		<%		
				if (len(dbcolor) >= 3) then				sqlconnection.ConnectionTimeout=60
				sqlconnection.Open session("dbColonDSN"),session("dbUsername"),session("dbPassword")
				'Response.Write "SELECT text FROM id_polyp_color WHERE id IN ("+ replace(replace(dbcolor,"''",","),"'","") +")"						rs.Open "SELECT text FROM id_polyp_color WHERE id IN ("+ replace(replace(replace(dbcolor,"P","'"),"''",","),"'","") +")", sqlconnection
						
				if (not rs.EOF) then
					do while (not rs.EOF)
						Response.Write rs.Fields("text") + ", "
						rs.movenext
					loop
				end if

				rs.close
				sqlconnection.close
				end if		%>
		</TD>
	</TR>
	<TR>
		<TD colspan=2><HR></TD>
	</TR>
	<TR>
		<TD></TD>
		<TD align=right><INPUT type="submit" value="Modify" id=button1 name=button1 style="WIDTH: 105px; HEIGHT: 40px;" onclick="document.forms(0).item('from').value='modifyColors';"></TD>
	</TR>
	<TR>
		<TD><B>Where taken</B></TD>
		<TD></TD>
	</TR>
	<TR>
		<TD colspan=2><HR><INPUT type="hidden" id=dbparttaken name=dbparttaken style="FONT-SIZE: larger; WIDTH: 200px; HEIGHT: 40px" value="<%=dbparttaken%>"></TD>
	</TR>
	<TR>
		<TD colspan=2><%=dbparttaken%></TD>
	</TR>
	<TR>
		<TD colspan=2><HR></TD>
	</TR>
	<TR>
		<TD></TD>
		<TD align=right><INPUT type="submit" value="Modify" id=button1 name=button1 style="WIDTH: 105px; HEIGHT: 40px;" onclick="document.forms(0).item('from').value='modifyPart'"></TD>
	</TR>
	<TR>
		<TD><B>How taken</B></TD>
		<TD></TD>
	</TR>
	<TR>
		<TD colspan=2><HR><INPUT type="hidden" id=dbhowtaken name=dbhowtaken style="FONT-SIZE: larger; WIDTH: 200px; HEIGHT: 40px" value="<%=dbhowtaken%>"></TD>
	</TR>
	<TR>
		<TD colspan=2><%=dbhowtaken%></TD>
	</TR>
	<TR>
		<TD colspan=2><HR></TD>
	</TR>
	<TR>
		<TD></TD>
		<TD align=right><INPUT type="submit" value="Modify" id=button1 name=button1 style="WIDTH: 105px; HEIGHT: 40px;" onclick="document.forms(0).item('from').value='modifyHow'"></TD>
	</TR>
	<TR>
		<TD COLSPAN=2>
		<TABLE WIDTH=100% BORDER=0 CELLSPACING=0 CELLPADDING=0>
			<TR>
				<TD><B>Destroyed</B></TD>
				<%if dbdestroyed = "1" then%>
					<TD><INPUT <%=dbdestroyed%> type="checkbox" style="WIDTH: 50px; HEIGHT: 40px" id=dbdestroyed name=dbdestroyed checked></TD>
				<%else%>
					<TD><INPUT <%=dbdestroyed%> type="checkbox" style="WIDTH: 50px; HEIGHT: 40px" id=dbdestroyed name=dbdestroyed></TD>
				<%end if%>
				<INPUT type="hidden" id=dbignoredestroyed name=dbignoredestroyed value="">
			</TR>
		</TABLE>
		</TD>
	</TR>
</TABLE>
<TABLE width=320 border=0 CELLSPACING=0 CELLPADDING=0>
	<TR>
		<TD><INPUT id=nextBtn style="FONT-WEIGHT: bold; FONT-SIZE: larger; WIDTH: 105px; COLOR: white; FONT-FAMILY: monospace; HEIGHT: 76px; BACKGROUND-COLOR: black" type=button size=31 value="Back" name=nextBtn onclick="document.location.href='findings.asp'"></TD>
		<TD colspan=2 align=right><INPUT id=nextBtn style="FONT-WEIGHT: bold; FONT-SIZE: larger; WIDTH: 105px; COLOR: black; FONT-FAMILY: monospace; HEIGHT: 76px; BACKGROUND-COLOR: grey" type=submit size=31 value="Ok" name=nextBtn></TD>
	</TR>
</TABLE>
</FORM>
</CENTER>
</BODY>
</HTML>
