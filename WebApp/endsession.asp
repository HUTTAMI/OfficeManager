<%
for each x in Application.Contents
if len(x) > 36 AND left(x,36) = session("operation_id") then
  Application.Contents.Remove(x)
end if
Next

for each x in session.Contents
if (cstr(x) <> "grantAccess") then
  session.Contents.Remove(x)
end if
Next

Response.Redirect("selectappointment.asp")
%>

