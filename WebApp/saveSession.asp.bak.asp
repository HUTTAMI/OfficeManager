<%

Set sqlconnection = Server.CreateObject("ADODB.Connection")		
Set rs = Server.CreateObject("ADODB.recordset")
Set rs2 = Server.CreateObject("ADODB.recordset")
sqlconnection.ConnectionTimeout=60
sqlconnection.Open session("dbColonDSN"),session("dbUsername"),session("dbPassword")

If (Session.Contents("optype") <> "") Then
	optype = Session.Contents("optype")
Else
	optype = "colonoscopy"
End If

theDate = Left(Session.Contents("starttime"),9)

for each x in Session.Contents
	If (Session.Contents(x) = "on") then
		Session.Contents(x) = 1
	ElseIf (Session.Contents(x) = "off") then
		Session.Contents(x) = 0
	End if
next

phyStatement = "SELECT * FROM physicians WHERE id = " & Session("physicianid")

rs.Open phyStatement, sqlconnection
			if (not rs.EOF) then
				phyName = rs.Fields("text")
				phyName = Left(phyName, (InStr(phyName, ",") - 1))
			end if
rs.Close

sqlStatement = "INSERT INTO " & optype & " (operationid, operationdate, patientid, lname, fname, physician, preopdiagother, vitalbp, vitalhr, vitalrr, vitalsao2, heent, heart, lungs, abdomen, neuro, extremities, informedconsent, attendingphysician, path_chartno) VALUES ('" & Session.Contents("operation_id") & "','" & theDate & "','" & Session.Contents("chartno") & "','" & Session.Contents("lastname") & "','" & Session.Contents("firstname") & "','" & phyName & "','" & " " & "','" & Session.Contents("BP0") & "/" & Session.Contents("BP1") & "','" & Session.Contents("HR") & "','" & Session.Contents("RR") & "','" & Session.Contents("SaO2") & "','" & Session.Contents("HEENT") & "','" & Session.Contents("HEART") & "','" & Session.Contents("LUNGS") & "','" & Session.Contents("ABDOMEN") & "','" & Session.Contents("NEURO") & "','" & Session.Contents("EXTREMITIES") & "','" & Session.Contents("consent") & "','" & Session.Contents("physicianid") & "','" & Session.Contents("chartno") & "')"
'on error resume Next

sqlconnection.Execute sqlStatement
			if Err <> 0 Then
				Response.Write(sqlStatement)
				insertValid = 0
			else
				if (optype = "colonoscopy") then

					'cecumduration = (Session.Contents("endtime") - Session.Contents("maxtime"))
					cecumduration = 0
					duration = 0
					'duration = (Session.Contents("endtime") - Session.Contents("starttime"))

					updStatement = "UPDATE colonoscopy SET prep='" & Session.Contents("prep") & "', prepother='" & Session.Contents("prepcommenttext") & "', starttime='" & Session.Contents("starttime") & "', endtime='" & Session.Contents("endtime") & "', cecumstarttime='" & Session.Contents("maxtime") & "', cecumduration='" & cecumduration & "', duration='" & duration & "',appendixseen='" & Session.Contents("postopdesc_appendixseen") &"', termileumintubated='" & Session.Contents("postopdesc_ileumintubated") & "', incompleteexam='" & Session.Contents("postopdesc_incomplete") & "', diverticulaeseen='" & Session.Contents("postopdesc_diverticulae") & "', melanosiscoliseen='" & Session.Contents("postopdesc_melanosis") & "', lipomaseen='" & Session.Contents("postopdesc_lipoma") & "', hemorrhoidsseen='" & Session.Contents("postopdesc_inthemorrhoids") & "' WHERE operationid='" & Session.Contents("operation_id") &"' AND operationdate='" & theDate & "'"

					sqlconnection.Execute updStatement
						if Err <> 0 Then
							insertValid = 0
						else
							insertValid = 1
						end if

				end if
			end if

if (optype = "colonscopy") then
	medTable = "colon"
else
	medTable = "egd"
end if

start = 1
'Response.Write Session("preopMedstr") + "  len=" +cstr(len(Session("preopMedstr")))+ "<BR>"

Do
	
	strlocation = InStr(start,Session("preopMedstr"), ",")
	medName = Mid(Session("preopMedstr"), start, (strlocation - start))
	medNum = Mid(medName, 1, InStr(1,medName, "_") - 1)
	'Response.Write "Mid(" + medName + ",1," + cstr(InStr(1,medName, "_")) + " - " + cstr(start) + ")" + "<BR>"
	medType = Mid(medName, InStr(1,medName, "_") + 1, Len(medName) - InStr(1,medName, "_"))

	if (medType = "med") then
		rs2.open "SELECT * FROM id_colon_preopmeds WHERE id =" & medNum, sqlconnection
			if (not rs2.EOF) then
				'Response.Write "Med=" + medNum + "<BR>"
				medText = rs2("text")
			end if
		rs2.Close

		sqlStatement = "INSERT INTO " & medTable & "_preopmeds (operationid, id, text) VALUES(" & Session.Contents("operation_id") & "," & medNum & "," & medText & ")"
	elseif (medType = "anti") then
		'Response.Write "Anti=" + medNum + "<BR>"
		sqlStatement = "INSERT INTO " & medTable & "_preopantibiotics (operationid, id) VALUES(" & Session.Contents("operation_id") & "," & medNum & ")"
	end if

	start = strlocation+1
	'Response.Write "start=" & start & "<BR>"
loop while start < len(Session("preopMedstr"))

'on error resume next
start = 1
Do
	strlocation = InStr(start, Session("intraopMedstr"), ",")
	'Response.Write "Mid(" + Session("intraopMedstr") + "," + cstr(start) + "," + cstr(strlocation) + " - " + cstr(start) + ")" + "<BR>"
	medName = Mid(Session("intraopMedstr"), start, strlocation - start)
	'Response.Write "SELECT * FROM id_colon_preopmeds WHERE id =" & medName & "<BR>"
		rs2.open "SELECT * FROM id_colon_preopmeds WHERE id =" & medName, sqlconnection
			if (not rs2.EOF) then
				'Response.Write rs2("text") + "<BR>"
				medText = rs2("text")
			end if
	rs2.Close

	sqlStatement = "INSERT INTO " & medTable & "_preopmeds (operationid, id, text) VALUES(" & Session.Contents("operation_id") & "," & medNum & "," & medText & ")"
	start = strlocation+1
loop while start < len(Session("intraopMedstr"))
%>