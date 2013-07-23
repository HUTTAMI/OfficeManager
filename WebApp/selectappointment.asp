<%
if Session("grantAccess") <> 1 then 
	Response.Redirect "login.html"
end if

session("operation_id")=""
session("imageURL")="http://phax.homelinux.com/opimages/"
session("dbColonDSN")="DSN=scmec"
session("dbAppDSN")="DSN=scmec"
session("dbUsername")="root"
session("dbPassword")="1bigphax"
%>

<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<TITLE></TITLE>
</HEAD>
<BODY  bgcolor=lightgrey>
<input type="hidden" id="operation_id" name="operation_id" value="SelectPage">
<CENTER>
<FORM action="optype.asp">
<TABLE WIDTH=100% BORDER=0 CELLSPACING=0 CELLPADDING=0>
	<TR>
		<TD colspan=2 rowspan=2 align=left  align=left width=* height=350 valign=top>
		<FONT size=+1><B>Today's Appointments</B></FONT>
		<HR width=320 align=left>
		<TABLE WIDTH=100% BORDER=0 CELLSPACING=4 CELLPADDING=1>
	<TR>
		<TD rowspan=2></TD>
		<TD valign=top bgcolor=gray><FONT color=white><B>Time</B></FONT></TD>
		<TD valign=top bgcolor=gray><FONT color=white><B>Patient</B></FONT></TD>
	</TR>
	<TR>
		<TD valign=top bgcolor=gray><FONT color=white><B>Doctor</B></FONT></TD>
		<TD valign=top bgcolor=gray><FONT color=white><B>Procedure</B></FONT></TD>
	</TR>
	<TR>
		<TD colspan=3><HR></TD>
	</TR>
			<%			
			Set sqlconnection = Server.CreateObject("ADODB.Connection")			Set rs = Server.CreateObject("ADODB.recordset")
						sqlconnection.ConnectionTimeout=60
			sqlconnection.Open session("dbAppDSN"),session("dbUsername"),session("dbPassword")
			
			rs.Open "SELECT appointments.appid, appointments.proctype, convert(varchar,appointments.apptime,100) as apptime, appointments.chartno, (patients.lastname + ', ' + patients.firstname) as patientname, appointments.chartno, colondata.dbo.physicians.text as physicianname FROM appointments, patients, colondata.dbo.physicians WHERE appointments.operatingdoctor=colondata.dbo.physicians.id AND appointments.chartno=patients.chartno AND CONVERT(varchar,appointments.appdate,110) LIKE CONVERT(varchar,getdate(),110) ORDER BY appointments.apptime", sqlconnection
			
			if (not rs.EOF) then
				do until rs.EOF
					if rs("proctype") = 1 then
						optype="colonoscopy"
						Session("optype")="colonoscopy"
					elseif (rs("proctype") = 2) then
						optype="egd"
						Session("optype")="egd"
					end if
					Response.Write "<TR>" + vbcrlf
					Response.Write "<TD rowspan=2><INPUT type=radio id=chartno name=chartno style=""WIDTH: 60px; HEIGHT: 60px"" size=41 value=" + Cstr(rs.Fields("chartno")) + " onclick=""document.forms(0).item('optype').value='"& optype &"';""></TD>" + vbcrlf
					Response.Write "<TD>" + replace(replace(right(rs.Fields("apptime"),7),"AM"," am"),"PM"," pm") + "</B></TD>" + vbcrlf
					Response.Write "<TD><B>" + rs.Fields("patientname") + "</TD>" + vbcrlf
					Response.Write "</TR>" + vbcrlf
					Response.Write "<TR>" + vbcrlf
					Response.Write "<TD valign=top>Dr. "+ rs("physicianname") +"</B></TD>" + vbcrlf
					if rs("proctype") = 1 then
						optype="colonoscopy"
						Session("optype")="colonoscopy"
						Response.Write "<TD valign=top>Colonoscopy</B></TD>" + vbcrlf
					elseif (rs("proctype") = 2) then
						optype="egd"
						Session("optype")="egd"
						Response.Write "<TD valign=top>EGD</B></TD>" + vbcrlf
					end if
					Response.Write "</TR>" + vbcrlf
					Response.Write "<TR>" + vbcrlf
					Response.Write "<TD colspan=3><HR></TD>" + vbcrlf
					Response.Write "</TR>" + vbcrlf
					rs.MoveNext
				loop
			end if

			rs.close
			sqlconnection.close
			%>

</TABLE>
		</TD>
	</TR>
</TABLE>
<TABLE width=320 border=0 CELLSPACING=0 CELLPADDING=0>
	<TR>
		<TD></TD>
		<TD colspan=2 align=right><INPUT id=nextBtn style="FONT-WEIGHT: bold; FONT-SIZE: larger; WIDTH: 105px; COLOR: black; FONT-FAMILY: monospace; HEIGHT: 76px; BACKGROUND-COLOR: grey" type=submit size=31 value="Ok" name=nextBtn></TD>
	</TR>
</TABLE>
<INPUT type="hidden" id=optype name=optype value="<%=optype%>">
</FORM>
</CENTER>
</BODY>
</HTML>
