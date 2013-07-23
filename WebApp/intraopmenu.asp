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
<CENTER>
<TABLE WIDTH=* BORDER=0 CELLSPACING=0 CELLPADDING=0>
	<TR>
		<TD colspan=2 rowspan=2 align=left width=* height=350 valign=top>
		<FONT size=+1><B>Intra-operative Menu</B></FONT>
	<HR width=320 align=left>
	<center>
	<TABLE WIDTH=* BORDER=0 CELLSPACING=4 CELLPADDING=1>
	<TR>
	<form action="formSubmit.asp" method="post">
	<%
		if session("starttime") <> "" then
			Response.Write "<TD align=middle><INPUT id=backBtn style=""FONT-WEIGHT: bold; FONT-SIZE: larger; WIDTH: 312px; COLOR: black; FONT-FAMILY: monospace; HEIGHT: 60px"" type=submit size=92 value=""Start: " + cstr(session("starttime")) + """ name=backBtn></TD>"
		else
			Response.Write "<TD align=middle><INPUT id=backBtn style=""FONT-WEIGHT: bold; FONT-SIZE: larger; WIDTH: 312px; COLOR: black; FONT-FAMILY: monospace; HEIGHT: 60px"" type=submit size=92 value=""Record start time"" name=backBtn></TD>"
		end if
	%>
	<input type="hidden" name="type" value="setStartTime">
	</form>
	</TR>
	<TR>
		<TD align=center><INPUT id=backBtn style="FONT-WEIGHT: bold; FONT-SIZE: larger; WIDTH: 313px; COLOR: black; FONT-FAMILY: monospace; HEIGHT: 60px; BACKGROUND-COLOR: grey" onclick="document.location.href='intraopmeds.asp'" type=button size=92 value=Medications name=backBtn></TD>
	</TR>
	<TR>
		<TD align=center><INPUT id=backBtn style="FONT-WEIGHT: bold; FONT-SIZE: larger; WIDTH: 312px; COLOR: black; FONT-FAMILY: monospace; HEIGHT: 60px; BACKGROUND-COLOR: grey" onclick="document.location.href='findings.asp'" type=button size=92 value="Findings" name=backBtn></TD>
	</TR>
	<TR>
	<form action="formSubmit.asp" method="post">
	<%
		if session("maxtime") <> "" then
			Response.Write "<TD align=middle><INPUT id=backBtn style=""FONT-WEIGHT: bold; FONT-SIZE: larger; WIDTH: 312px; COLOR: black; FONT-FAMILY: monospace; HEIGHT: 60px"" type=submit size=92 value=""Max: " + cstr(session("maxtime")) + """ name=backBtn></TD>"
		else
			Response.Write "<TD align=middle><INPUT id=backBtn style=""FONT-WEIGHT: bold; FONT-SIZE: larger; WIDTH: 312px; COLOR: black; FONT-FAMILY: monospace; HEIGHT: 60px"" type=submit size=92 value="" Record max progress time"" name=backBtn></TD>"
		end if
	%>
	<input type="hidden" name="type" value="setMaxTime">
	</form>
	</TR>
	<TR>
	<form action="formSubmit.asp" method="post">
	<%
		if session("endtime") <> "" then
			Response.Write "<TD align=middle><INPUT id=backBtn style=""FONT-WEIGHT: bold; FONT-SIZE: larger; WIDTH: 312px; COLOR: black; FONT-FAMILY: monospace; HEIGHT: 60px"" type=submit size=92 value=""End: " + cstr(session("endtime")) + """ name=backBtn></TD>"
		else
			Response.Write "<TD align=middle><INPUT id=backBtn style=""FONT-WEIGHT: bold; FONT-SIZE: larger; WIDTH: 312px; COLOR: black; FONT-FAMILY: monospace; HEIGHT: 60px"" type=submit size=92 value=""Record end time"" name=backBtn></TD>"
		end if
	%>
	<input type="hidden" name="type" value="setEndTime">
	</form>
	</TR>
	<TR>
		<TD align=center><INPUT id=backBtn style="FONT-WEIGHT: bold; FONT-SIZE: larger; WIDTH: 312px; COLOR: black; FONT-FAMILY: monospace; HEIGHT: 60px; BACKGROUND-COLOR: grey" onclick="document.location.href='opwizardmenu.asp'" type=button size=92 value="Procedure Menu" name=backBtn></TD>
	</TR>
	</TABLE>
	</center>
		</TD>
	</TR>
</TABLE>
</CENTER>
</BODY>
</HTML>
