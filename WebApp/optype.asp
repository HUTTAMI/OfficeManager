<%
if Session("grantAccess") <> 1 then 
	Response.Redirect "login.html"
end if
%>

<%
Session("chartno")=request("chartno")
opid=Session("chartno") & Month(Now) & Day(Now) & Year(Now) & Hour(Now) & Minute(Now) & Second(Now)
do while (len(opid)<32)
	opid=opid+"a"
loop
Session("operation_id")=mid(opid,1,8) + "-" + mid(opid,9,4) + "-" + mid(opid,13,4) + "-" + mid(opid,17,4) + "-" + mid(opid,21,12)

'Session("operation_id")=Session("chartno") & "_" & Month(Now) & Day(Now) & Year(Now) & Hour(Now) & Minute(Now) & Second(Now)
Session("physicianid")=1

if trim(cstr(request("optype"))) <> "" then
Session("optype")=request("optype")
end if
'Response.Write Session("optype")
Response.Redirect "opwizardmenu.asp"
%>
