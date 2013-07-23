<%
if Session("grantAccess") <> 1 then 
	Response.Redirect "login.html"
end if
%>

<HTML>
<HEAD>
<TITLE></TITLE>
<SCRIPT LANGUAGE="JavaScript" SRC="CalendarPopup.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript">document.write(getCalendarStyles());</SCRIPT>
<STYLE>
	.TESTcpYearNavigation,
	.TESTcpMonthNavigation
			{
			background-color:#6677DD;
			text-align:center;
			vertical-align:center;
			text-decoration:none;
			color:#FFFFFF;
			font-weight:bold;
			}
	.TESTcpDayColumnHeader,
	.TESTcpYearNavigation,
	.TESTcpMonthNavigation,
	.TESTcpCurrentMonthDate,
	.TESTcpCurrentMonthDateDisabled,
	.TESTcpOtherMonthDate,
	.TESTcpOtherMonthDateDisabled,
	.TESTcpCurrentDate,
	.TESTcpCurrentDateDisabled,
	.TESTcpTodayText,
	.TESTcpTodayTextDisabled,
	.TESTcpText
			{
			font-family:arial;
			font-size:8pt;
			}
	TD.TESTcpDayColumnHeader
			{
			text-align:right;
			border:solid thin #6677DD;
			border-width:0 0 1 0;
			}
	.TESTcpCurrentMonthDate,
	.TESTcpOtherMonthDate,
	.TESTcpCurrentDate
			{
			text-align:right;
			text-decoration:none;
			}
	.TESTcpCurrentMonthDateDisabled,
	.TESTcpOtherMonthDateDisabled,
	.TESTcpCurrentDateDisabled
			{
			color:#D0D0D0;
			text-align:right;
			text-decoration:line-through;
			}
	.TESTcpCurrentMonthDate
			{
			color:#6677DD;
			font-weight:bold;
			}
	.TESTcpCurrentDate
			{
			color: #FFFFFF;
			font-weight:bold;
			}
	.TESTcpOtherMonthDate
			{
			color:#808080;
			}
	TD.TESTcpCurrentDate
			{
			color:#FFFFFF;
			background-color: #6677DD;
			border-width:1;
			border:solid thin #000000;
			}
	TD.TESTcpCurrentDateDisabled
			{
			border-width:1;
			border:solid thin #FFAAAA;
			}
	TD.TESTcpTodayText,
	TD.TESTcpTodayTextDisabled
			{
			border:solid thin #6677DD;
			border-width:1 0 0 0;
			}
	A.TESTcpTodayText,
	SPAN.TESTcpTodayTextDisabled
			{
			height:20px;
			}
	A.TESTcpTodayText
			{
			color:#6677DD;
			font-weight:bold;
			}
	SPAN.TESTcpTodayTextDisabled
			{
			color:#D0D0D0;
			}
	.TESTcpBorder
			{
			border:solid thin #6677DD;
			}
</STYLE>
</HEAD>
<BODY BGCOLOR=#FFFFFF LINK="#00615F" VLINK="#00615F" ALINK="#00615F">
<FORM id=form1 name=form1>
<SCRIPT LANGUAGE="JavaScript" ID="jscal1xx">
var cal1xx = new CalendarPopup("testdiv1");
var isready=0;
cal1xx.showNavigationDropdowns();
</SCRIPT>

<SCRIPT LANGUAGE="JavaScript" >
var dateState=2;
var nameState=0;
var phoneState=0;
var followUpState=0;
var dobState=0;

var orderByStr='operationdate ASC';

function doDisplay() {
	if (dateState!=0) {
		if (dateState==1) {
			document.forms[0].imgDate.src='images/down.gif';
			orderByStr='operationdate DESC';
		}
		else {
			document.forms[0].imgDate.src='images/up.gif';
			orderByStr='operationdate ASC';
		}
		document.forms[0].imgName.src='images/blank.gif';
		document.forms[0].imgPhone.src='images/blank.gif';
		document.forms[0].imgFollowUp.src='images/blank.gif';
		document.forms[0].imgDOB.src='images/blank.gif';
	}
	else if (nameState!=0) {
		if (nameState==1) {
			document.forms[0].imgName.src='images/down.gif';
			orderByStr='patientname DESC';
		}
		else {
			document.forms[0].imgName.src='images/up.gif';
			orderByStr='patientname ASC';
		}
		document.forms[0].imgDate.src='images/blank.gif';
		document.forms[0].imgPhone.src='images/blank.gif';
		document.forms[0].imgFollowUp.src='images/blank.gif';
		document.forms[0].imgDOB.src='images/blank.gif';
	}
	else if (phoneState!=0) {
		if (phoneState==1) {
			document.forms[0].imgPhone.src='images/down.gif';
			orderByStr='patientphone DESC';
		}
		else {
			document.forms[0].imgPhone.src='images/up.gif';
			orderByStr='patientphone ASC';
		}
		document.forms[0].imgName.src='images/blank.gif';
		document.forms[0].imgDate.src='images/blank.gif';
		document.forms[0].imgFollowUp.src='images/blank.gif';
		document.forms[0].imgDOB.src='images/blank.gif';
	}
	else if (followUpState!=0) {
		if (followUpState==1) {
			document.forms[0].imgFollowUp.src='images/down.gif';
			orderByStr='followupdate DESC';
		}
		else {
			document.forms[0].imgFollowUp.src='images/up.gif';
			orderByStr='followupdate ASC';
		}
		document.forms[0].imgName.src='images/blank.gif';
		document.forms[0].imgPhone.src='images/blank.gif';
		document.forms[0].imgDate.src='images/blank.gif';
		document.forms[0].imgDOB.src='images/blank.gif';
	}
	else if (dobState!=0) {
		if (dobState==1) {
			document.forms[0].imgDOB.src='images/down.gif';
			orderByStr='dob DESC';
		}
		else {
			document.forms[0].imgDOB.src='images/up.gif';
			orderByStr='dob ASC';
		}
		document.forms[0].imgName.src='images/blank.gif';
		document.forms[0].imgPhone.src='images/blank.gif';
		document.forms[0].imgFollowUp.src='images/blank.gif';
		document.forms[0].imgDate.src='images/blank.gif';
	}
	if (isready>=2) {
		frames['iframe1'].location.href='phyresults.asp?startdate=' + document.forms[0].startdate.value + '&enddate=' + document.forms[0].enddate.value + '&physician=' + document.forms[0].physician.value + '&orderByStr='+ orderByStr; 
		document.forms[0].button1.disabled=true;
	}
}

function byDate() {
	nameState=0;
	phoneState=0;
	followUpState=0;
	dobState=0;

	
	if (dateState!=1) {
		dateState=1;
	}
	else {
		dateState=2;
	}	
	doDisplay();
return;
}
function byName() {
	phoneState=0;
	followUpState=0;
	dobState=0;
	dateState=0;
	
	if (nameState!=1) {
		nameState=1;
	}
	else {
		nameState=2;
	}	
	doDisplay();
return;
}
function byPhone() {
	nameState=0;
	followUpState=0;
	dobState=0;
	dateState=0;
	
	if (phoneState!=1) {
		phoneState=1;
	}
	else {
		phoneState=2;
	}	
	doDisplay();
return;
}
function byFollowUp() {
	nameState=0;
	phoneState=0;
	dobState=0;
	dateState=0;
	
	if (followUpState!=1) {
		followUpState=1;
	}
	else {
		followUpState=2;
	}	
	doDisplay();
return;
}
function byDOB() {
	nameState=0;
	phoneState=0;
	followUpState=0;
	dateState=0;
	
	if (dobState!=1) {
		dobState=1;
	}
	else {
		dobState=2;
	}	
	doDisplay();
return;
}
</SCRIPT>

<TABLE WIDTH=* ALIGN=center BORDER=0 CELLSPACING=1 CELLPADDING=1>
	<TR>
		<TD align=right><B>Start Date:</B></TD>
		<TD align=right><INPUT type="text" id=startdate name=startdate value="Required!" readonly size=11 onclick="cal1xx.select(document.forms[0].startdate,'startdate','MM/dd/yyyy'); isready=isready+1; if(isready>=2) {document.forms[0].button1.disabled=false}; return false;"><BR></TD>
		<TD align=right><B>End Date:</B></TD>
		<TD align=right><INPUT type="text" id=enddate name=enddate value="Required!" readonly size=11 onclick="cal1xx.select(document.forms[0].enddate,'enddate','MM/dd/yyyy'); isready=isready+1; if(isready>=2) {document.forms[0].button1.disabled=false}; return false;"><BR></TD>
		<TD align=right><B>Physician:</B></TD>
		<TD align=right>
			<SELECT id=physician name=physician onclick="if (isready>=2) {document.forms[0].button1.disabled=false};">
			<%
			Set sqlconnection = Server.CreateObject("ADODB.Connection")			Set rs = Server.CreateObject("ADODB.recordset")
						sqlconnection.ConnectionTimeout=60
			sqlconnection.Open session("dbColonDSN"),session("dbUsername"),session("dbPassword")
			
			rs.Open "SELECT id, text FROM physicians WHERE id > 0 AND active=1 ORDER BY text", sqlconnection
			
			
			do until rs.EOF
			    Response.Write "<OPTION value=" + CStr(rs.Fields("id")) + ">" + rs.Fields("text")+ "</OPTION>" + vbcrlf
			    rs.MoveNext
			loop

			rs.close
			sqlconnection.close
			%>			</SELECT>
		</TD>
		</TR>
		<TR>
		<TD colspan=5 align=right></TD>
		<TD align=right><INPUT type="button" value="Update" id=button1 name=button1 onclick="frames['iframe1'].location.href='phyresults.asp?startdate=' + document.forms[0].startdate.value + '&enddate=' + document.forms[0].enddate.value + '&physician=' + document.forms[0].physician.value + '&orderByStr='+ orderByStr; document.forms[0].button1.disabled=true" disabled> <INPUT type="button" value="Exit" id=button2 name=button2 onclick="document.location.href='menu.html'"></TD>
	</TR>
</TABLE>
<BR>
<TABLE WIDTH=600 align=center>
<TR>
<TD width=100 align=left onclick="byDate();"><FONT size=-1><B>Date</B></FONT><IMG name= "imgDate" src="images/up.gif" border=0></TD>
<TD width=200 onclick="byName();"><CENTER><FONT size=-1><B>Patient Name</B></FONT><IMG name= "imgName" src="images/blank.gif" border=0></CENTER></TD>
<TD width=100 onclick="byPhone();"><CENTER><FONT size=-1><B>Phone</B></FONT><IMG name= "imgPhone" src="images/blank.gif" border=0></CENTER></TD>
<TD width=200 onclick="byFollowUp();"><CENTER><FONT size=-1><B>Follow Up Date</B></FONT><IMG name= "imgFollowUp" src="images/blank.gif" border=0></CENTER></TD>
<TD width=100 onclick="byDOB();"><FONT size=-1><B>Patient DOB</B></FONT><IMG name= "imgDOB" src="images/blank.gif" border=0></TD>
</TR>
</TABLE>
<IFRAME SRC="blank.html" WIDTH=750 HEIGHT=350  FRAMEBORDER=0 name="iframe1" id="iframe1">
If you can see this, your browser doesn't 
understand IFRAME.  However, we'll still 
<A HREF="menu.html">link</A> 
you to the file.
</IFRAME>
</FORM>
<DIV ID="testdiv1" STYLE="position:absolute;visibility:hidden;background-color:white;layer-background-color:white;"></DIV>
</BODY>
</HTML>
