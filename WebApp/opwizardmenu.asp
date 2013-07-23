<%
if Session("grantAccess") <> 1 then 
	Response.Redirect "login.html"
end if

for each x in Session.Contents
  'Response.Write(x & "=" & Session.Contents(x) & "<br />")
  Application(Session("operation_id")+x)=Session(x)
next
%>

<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<TITLE></TITLE>
<SCRIPT LANGUAGE="JavaScript">
<!-- Begin
function popUp(URL) {
day = new Date();
id = day.getTime();
eval("page" + id + " = window.open(URL, '" + id + "', 'toolbar=0,scrollbars=1,location=0,statusbar=0,menubar=0,resizable=0,width=1024,height=768,left = 0,top = 0');");
//newWind=window.createPopup
//newWind.open(URL, '" + id + "', 'toolbar=0,scrollbars=1,location=0,statusbar=0,menubar=0,resizable=0,width=1024,height=768,left = 0,top = 0');
}
// End -->
</script>
</HEAD>
<BODY  bgcolor=lightgrey scroll=no>
<input type="hidden" id="operation_id" name="operation_id" value="<%=Session("operation_id")%>">
<CENTER>
<TABLE WIDTH=310 BORDER=0 CELLSPACING=0 CELLPADDING=0>
	<TR>
		<TD colspan=2 rowspan=2 align=left width=320 valign=top>
		<FONT size=+1><B>Procedure Menu</B></FONT>
	<HR width=320 align=left>
	<center>
	<TABLE WIDTH=320 BORDER=0 CELLSPACING=4 CELLPADDING=1>
	<TR>
		<TD align=middle><INPUT id=backBtn style="FONT-WEIGHT: bold; FONT-SIZE: larger; WIDTH: 313px; COLOR: black; FONT-FAMILY: monospace; HEIGHT: 60px" onclick  ="document.location.href='preopmenu.html'" type=button size=92 value="Preoperative" name=backBtn></TD>
	</TR>
	<TR>
		<TD align=middle><INPUT id=backBtn style="FONT-WEIGHT: bold; FONT-SIZE: larger; WIDTH: 312px; COLOR: black; FONT-FAMILY: monospace; HEIGHT: 60px" onclick  ="document.location.href='intraopmenu.asp'" type=button size=92 value="Intra-operative" name=backBtn></TD>
	</TR>
	<TR>
		<TD align=middle><INPUT id=backBtn style="FONT-WEIGHT: bold; FONT-SIZE: larger; WIDTH: 312px; COLOR: black; FONT-FAMILY: monospace; HEIGHT: 60px" onclick  ="document.location.href='postopmenu.html'" type=button size=92 value="Postoperative" name=backBtn></TD>
	</TR>
	<TR>
		<TD align=middle><INPUT id=backBtn style="FONT-WEIGHT: bold; FONT-SIZE: larger; WIDTH: 312px; COLOR: black; FONT-FAMILY: monospace; HEIGHT: 60px" onclick  ="popUp('colonoscopyconfirm.asp?operation_id=<%=session("operation_id")%>');" type=button size=92 value="Confirm and Save" name=backBtn></TD>
	</TR>
	<TR>
		<TD align=middle><INPUT id=backBtn style="FONT-WEIGHT: bold; FONT-SIZE: larger; WIDTH: 312px; COLOR: black; FONT-FAMILY: monospace; HEIGHT: 60px" onclick  ="document.location.href='endsession.asp'" type=button size=92 value="Exit" name=backBtn></TD>
	</TR>
	</TABLE>
	</center>
		</TD>
	</TR>
</TABLE>
</CENTER>
</BODY>
</HTML>
