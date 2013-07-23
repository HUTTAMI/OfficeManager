<%
if Session("grantAccess") <> 1 then 
	Response.Redirect "login.html"
end if
%>

<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<TITLE></TITLE>
</HEAD>
<BODY  bgcolor=lightgrey scroll=no>

<input type="hidden" id="operation_id" name="operation_id" value="<%=Session("operation_id")%>">
<FORM action=formSubmit.asp method="post">
<CENTER>
<TABLE WIDTH=* BORDER=0 CELLSPACING=0 CELLPADDING=0>
	<TR>
		<TD colspan=2 rowspan=2 align=left width=* height=350 valign=top>
		<FONT size=+1><B>Preoperative Physical</B></FONT>
	<HR width=320 align=left>
<TABLE WIDTH=320 BORDER=0 CELLSPACING=4 CELLPADDING=1>
<TR><TD>
<FONT size=+1>BP: </FONT>
</TD>
<TD>
<INPUT id=BP0 name=BP0 style="FONT-SIZE: larger; WIDTH: 45px; HEIGHT: 40px" size=4 value="<%=Session("BP0")%>"><FONT size=+1><B>/</B></FONT><INPUT id=BP1 name=BP1 style="FONT-SIZE: larger; WIDTH: 45px; HEIGHT: 40px" size=5 value="<%=Session("BP1")%>">
</TD>
</TR>
<TR>
<TD>
<FONT size=+1>HR: </FONT>
</TD>
<TD>
<INPUT id=HR name=HR style="FONT-SIZE: larger; WIDTH: 45px; HEIGHT: 40px" value=<%=Session("HR")%>></FONT>
</TD>
</TR>
<TR>
<TD>
<FONT size=+1>RR: </FONT>
</TD>
<TD>
<INPUT id=RR name=RR style="FONT-SIZE: larger; WIDTH: 45px; HEIGHT: 40px" value=<%=Session("RR")%>></FONT>
</TD>
</TR>
<TR>
<TD>
<FONT size=+1>SaO2: </FONT>
</TD>
<TD>
<INPUT id=SaO2 name=SaO2 style="FONT-SIZE: larger; WIDTH: 45px; HEIGHT: 40px" value=<%=Session("SaO2")%>></FONT>
</TD></TR>
</TABLE>
<TABLE WIDTH=320 BORDER=0 CELLSPACING=4 CELLPADDING=1>
<TR>
<TD>
<FONT size=+1>HEENT:</FONT></TD>
<TD>
<INPUT id=HEENT name=HEENT style="FONT-SIZE: larger; WIDTH: 150px; HEIGHT: 40px" value=<%if Session("HEENT") <> "" then response.write Session("HEENT") else response.write "Normal" end if%>></TD></TR>
<TR>
<TD>
<FONT size=+1>HEART:</FONT></TD>
<TD>
<INPUT id=HEART name=HEART style="FONT-SIZE: larger; WIDTH: 150px; HEIGHT: 40px" value=<%if Session("HEART") <> "" then response.write Session("HEART") else response.write "Normal" end if%>></TD></TR>
<TR>
<TD>
<FONT size=+1>LUNGS:</FONT></TD>
<TD>
<INPUT id=LUNGS name=LUNGS style="FONT-SIZE: larger; WIDTH: 150px; HEIGHT: 40px" value=<%if Session("LUNGS") <> "" then response.write Session("LUNGS") else response.write "Normal" end if%>></TD></TR>
<TR>
<TD>
<FONT size=+1>ABDOMEN:</FONT></TD>
<TD>
<INPUT id=ABDOMEN name=ABDOMEN style="FONT-SIZE: larger; WIDTH: 150px; HEIGHT: 40px" value=<%if Session("ABDOMEN") <> "" then response.write Session("ABDOMEN") else response.write "Normal" end if%>></TD></TR>
<TR>
<TD>
<FONT size=+1>NEURO:</FONT></TD>
<TD>
<INPUT id=NEURO name=NEURO style="FONT-SIZE: larger; WIDTH: 150px; HEIGHT: 40px" value=<%if Session("NEURO") <> "" then response.write Session("NEURO") else response.write "Normal" end if%>></TD></TR>
<TR>
<TD>
<FONT size=+1>EXTREMITIES:</FONT></TD>
<TD>
<INPUT id=EXTREMITIES name=EXTREMITIES style="FONT-SIZE: larger; WIDTH: 150px; HEIGHT: 40px" value=<%if Session("EXTREMITIES") <> "" then response.write Session("EXTREMITIES") else response.write "Normal" end if%>>
</TD></TR></TABLE>
	</TD>
	</TR>
</TABLE>
<TABLE width=320 border=0 CELLSPACING=0 CELLPADDING=0>
	<TR>
		<TD><INPUT id=exitBtn style="FONT-WEIGHT: bold; FONT-SIZE: larger; WIDTH: 105px; COLOR: white; FONT-FAMILY: monospace; HEIGHT: 76px; BACKGROUND-COLOR: black" type=button size=31 value="Back" name=exitBtn onclick="document.location.href='preopmenu.html'"></TD>
		<TD colspan=2 align=right><INPUT id=nextBtn style="FONT-WEIGHT: bold; FONT-SIZE: larger; WIDTH: 105px; COLOR: black; FONT-FAMILY: monospace; HEIGHT: 76px" type  =submit size=31 value="Ok" name=nextBtn></TD>
	</TR>
</TABLE>
      <CENTER></CENTER>
<input type="hidden" name="type" value="preopphysical">
</FORM></TR></TBODY></TABLE></CENTER>
</BODY>
</HTML>
