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
		<TD colspan=2 rowspan=2 align=left width=800 height=350 valign=top>
		<FONT size=+1><B>Procedure Prep.</B></FONT>
	<HR width=320 align=left>
	<TABLE WIDTH=* BORDER=0 CELLSPACING=4 CELLPADDING=1>
	<TR>
		<TD width=51><INPUT value=Excellent type="radio" id=prep name=prep style="WIDTH: 50px; HEIGHT: 50px" size=41 <% if Session("prep")="Excellent" then response.write "checked" end if %>></TD>
		<TD><FONT size=+1>Excellent</FONT></TD>
	</TR>
	<TR>
		<TD><INPUT value=Good type="radio" id=prep name=prep style="WIDTH: 50px; HEIGHT: 50px" size=41 <% if Session("prep")="Good" then response.write "checked" end if %>></TD>
		<TD><FONT size=+1>Good</FONT></TD>
	</TR>
	<TR>
		<TD><INPUT value=Fair type="radio" id=prep name=prep style="WIDTH: 50px; HEIGHT: 50px" size=41 <% if Session("prep")="Fair" then response.write "checked" end if %>></TD>
		<TD><FONT size=+1>Fair</FONT></TD>
	</TR>
	<TR>
		<TD><INPUT value=Poor type="radio" id=prep name=prep style="WIDTH: 50px; HEIGHT: 50px" size=41 <% if Session("prep")="Poor" then response.write "checked" end if %>></TD>
		<TD><FONT size=+1>Poor</FONT></TD>
	</TR>
	<TR>
		<TD><INPUT type="checkbox" id=addcomment name=addcomment style="WIDTH: 50px; HEIGHT: 50px" size=41 <% if Session("prepcomment")=1 then response.write "checked" end if %>></TD>
		<TD><FONT size=+1>Add Comment?</FONT></TD>
	</TR>
</TABLE>
<TABLE width=320 border=0 CELLSPACING=0 CELLPADDING=0>
	<TR>
		<TD><INPUT id=exitBtn style="FONT-WEIGHT: bold; FONT-SIZE: larger; WIDTH: 105px; COLOR: white; FONT-FAMILY: monospace; HEIGHT: 76px; BACKGROUND-COLOR: black" type=button size=31 value="Back" name=exitBtn onclick="document.location.href='preopmenu.html'"></TD>
		<TD colspan=2 align=right><INPUT id=nextBtn style="FONT-WEIGHT: bold; FONT-SIZE: larger; WIDTH: 105px; COLOR: black; FONT-FAMILY: monospace; HEIGHT: 76px; BACKGROUND-COLOR: grey" type=submit size=31 value="Ok" name=nextBtn></TD>
	</TR>
</TABLE>
</CENTER>
<input type="hidden" name="type" value="prep">
</FORM>
</BODY>
</HTML>
