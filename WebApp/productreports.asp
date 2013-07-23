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
var textState=2;
var reachedState=0;
var notReachedState=0;
var totalState=0;
var percentState=0;

var orderByStr='text ASC';

function doDisplay() {
	if (textState!=0) {
		if (textState==1) {
			document.forms[0].imgText.src='images/down.gif';
			orderByStr='text DESC';
		}
		else {
			document.forms[0].imgText.src='images/up.gif';
			orderByStr='text ASC';
		}
		document.forms[0].imgReached.src='images/blank.gif';
		document.forms[0].imgNotReached.src='images/blank.gif';
		document.forms[0].imgTotal.src='images/blank.gif';
		document.forms[0].imgPercent.src='images/blank.gif';
	}
	else if (reachedState!=0) {
		if (reachedState==1) {
			document.forms[0].imgReached.src='images/down.gif';
			orderByStr='reached DESC';
		}
		else {
			document.forms[0].imgReached.src='images/up.gif';
			orderByStr='reached ASC';
		}
		document.forms[0].imgText.src='images/blank.gif';
		document.forms[0].imgNotReached.src='images/blank.gif';
		document.forms[0].imgTotal.src='images/blank.gif';
		document.forms[0].imgPercent.src='images/blank.gif';
	}
	else if (notReachedState!=0) {
		if (notReachedState==1) {
			document.forms[0].imgNotReached.src='images/down.gif';
			orderByStr='notreached DESC';
		}
		else {
			document.forms[0].imgNotReached.src='images/up.gif';
			orderByStr='notreached ASC';
		}
		document.forms[0].imgText.src='images/blank.gif';
		document.forms[0].imgReached.src='images/blank.gif';
		document.forms[0].imgTotal.src='images/blank.gif';
		document.forms[0].imgPercent.src='images/blank.gif';
	}
	else if (totalState!=0) {
		if (totalState==1) {
			document.forms[0].imgTotal.src='images/down.gif';
			orderByStr='total DESC';
		}
		else {
			document.forms[0].imgTotal.src='images/up.gif';
			orderByStr='total ASC';
		}
		document.forms[0].imgText.src='images/blank.gif';
		document.forms[0].imgReached.src='images/blank.gif';
		document.forms[0].imgNotReached.src='images/blank.gif';
		document.forms[0].imgPercent.src='images/blank.gif';
	}
	else if (percentState!=0) {
		if (percentState==1) {
			document.forms[0].imgPercent.src='images/down.gif';
			orderByStr='pcent DESC';
		}
		else {
			document.forms[0].imgPercent.src='images/up.gif';
			orderByStr='pcent ASC';
		}
		document.forms[0].imgTotal.src='images/blank.gif';
		document.forms[0].imgText.src='images/blank.gif';
		document.forms[0].imgReached.src='images/blank.gif';
		document.forms[0].imgNotReached.src='images/blank.gif';
	}
	if (isready>=2) {
		frames['iframe1'].location.href='results.asp?startdate=' + document.forms[0].startdate.value + '&enddate=' + document.forms[0].enddate.value + '&orderByStr='+ orderByStr; 
		document.forms[0].button1.disabled=true;
	}
}

function byText() {
	reachedState=0;
	notReachedState=0;
	totalState=0;
	percentState=0;
	
	if (textState!=1) {
		textState=1;
	}
	else {
		textState=2;
	}	
	doDisplay();
return;
}
function byReached() {
	notReachedState=0;
	totalState=0;
	percentState=0;
	textState=0;
	
	if (reachedState!=1) {
		reachedState=1;
	}
	else {
		reachedState=2;
	}	
	doDisplay();
return;
}
function byNotReached() {
	reachedState=0;
	totalState=0;
	percentState=0;
	textState=0;
	
	if (notReachedState!=1) {
		notReachedState=1;
	}
	else {
		notReachedState=2;
	}	
	doDisplay();
return;
}
function byTotal() {
	reachedState=0;
	notReachedState=0;
	percentState=0;
	textState=0;
	
	if (totalState!=1) {
		totalState=1;
	}
	else {
		totalState=2;
	}	
	doDisplay();
return;
}
function byPercent() {
	reachedState=0;
	notReachedState=0;
	totalState=0;
	textState=0;
	
	if (percentState!=1) {
		percentState=1;
	}
	else {
		percentState=2;
	}	
	doDisplay();
return;
}
</SCRIPT>
<TABLE WIDTH=* valign=top ALIGN=center BORDER=0 CELLSPACING=1 CELLPADDING=1>
	<TR>
		<TD><B>Start Date:</B></TD>
		<TD><INPUT type="text" id=startdate name=startdate value="Required!" readonly size=11 onclick="cal1xx.select(document.forms[0].startdate,'startdate','MM/dd/yyyy'); isready=isready+1; if(isready>=2) {document.forms[0].button1.disabled=false}; return false;"><BR></TD>
		<TD><B>End Date:</B></TD>
		<TD><INPUT type="text" id=enddate name=enddate value="Required!" readonly size=11 onclick="cal1xx.select(document.forms[0].enddate,'enddate','MM/dd/yyyy'); isready=isready+1; if(isready>=2) {document.forms[0].button1.disabled=false}; return false;"><BR></TD>
		<TD align=right><INPUT type="button" value="Update" id=button1 name=button1 onclick="frames['iframe1'].location.href='results.asp?startdate=' + document.forms[0].startdate.value + '&enddate=' + document.forms[0].enddate.value + '&orderByStr='+ orderByStr; document.forms[0].button1.disabled=true" disabled>
		<TD align=right><INPUT type="button" value="Exit" id=button2 name=button2 onclick="document.location.href='menu.html'">
	</TR>
</TABLE>
<BR>
<CENTER>
<TABLE WIDTH=600>
<TR>
<TD width=150 align=left onclick="byText();"><FONT size=-1><B>Physician</B></FONT><IMG name= "imgText" src="images/up.gif" border=0></TD>
<TD width=150 onclick="byReached();"><CENTER><FONT size=-1><B>Cecum Reached</B></FONT><IMG name= "imgReached" src="images/blank.gif" border=0></CENTER></TD>
<TD width=150 onclick="byNotReached();"><CENTER><FONT size=-1><B>Not Reached</B></FONT><IMG name= "imgNotReached" src="images/blank.gif" border=0></CENTER></TD>
<TD width=150 onclick="byTotal();"><CENTER><FONT size=-1><B>Total</B></FONT><IMG name= "imgTotal" src="images/blank.gif" border=0></CENTER></TD>
<TD width=150 onclick="byPercent();"><CENTER><FONT size=-1><B>Percent Reached</B></FONT><IMG name= "imgPercent" src="images/blank.gif" border=0></CENTER></TD>
</TR>
</TABLE>
</CENTER>
<IFRAME SRC="blank.html" WIDTH=750 HEIGHT=380  FRAMEBORDER=0 name="iframe1" id="iframe1">
If you can see this, your browser doesn't 
understand IFRAME.  However, we'll still 
<A HREF="menu.html">link</A> 
you to the file.
</IFRAME>
</FORM>
<DIV ID="testdiv1" STYLE="position:absolute;visibility:hidden;background-color:white;layer-background-color:white;"></DIV>
</BODY>
</HTML>
