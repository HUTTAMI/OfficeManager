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
		<FONT size=+1><B>Patient Consent</B></FONT>
	<HR width=320 align=left>
	<TABLE WIDTH=* BORDER=0 CELLSPACING=4 CELLPADDING=1>
	<TR>
		<TD width=62><INPUT value=1 type="radio" id=consent name=consent style="WIDTH: 60px; HEIGHT: 60px" size=41 <% if Session("consent")="1" then response.write "checked" end if %>></TD>
		<TD><FONT size=+1>Appropriate informed consent was obtained and signed by the physician and the responsible party.</FONT></TD>
	</TR>
	<TR>
		<TD><INPUT value=0 type="radio" id=consent name=consent style="WIDTH: 60px; HEIGHT: 60px" size=41 <% if Session("consent")="0" then response.write "checked" end if %>></TD>
		<TD><FONT size=+1>Appropriate informed consent was <b>not</b> obtained and signed by the physician and the responsible party.</FONT></TD>
	</TR>

</TABLE>
<TABLE width=320 border=0 CELLSPACING=0 CELLPADDING=0>
	<TR>
		<TD><INPUT id=exitBtn style="FONT-WEIGHT: bold; FONT-SIZE: larger; WIDTH: 105px; COLOR: white; FONT-FAMILY: monospace; HEIGHT: 76px; BACKGROUND-COLOR: black" type=button size=31 value="Back" name=exitBtn onclick="document.location.href='preopmenu.html'"></TD>
		<TD colspan=2 align=right><INPUT id=nextBtn style="FONT-WEIGHT: bold; FONT-SIZE: larger; WIDTH: 105px; COLOR: black; FONT-FAMILY: monospace; HEIGHT: 76px; BACKGROUND-COLOR: grey" type=submit size=31 value="Ok" name=nextBtn></TD>
	</TR>
</TABLE>
</CENTER>
<input type="hidden" name="type" value="preopconsent">
</FORM>
</BODY>
</HTML>
