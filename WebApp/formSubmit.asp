<%
if Session("grantAccess") <> 1 then 
	Response.Redirect "login.html"
end if
%>

<%

If Request.Form("type") = "prep" Then
	Session("prep")=request("prep")

	if request("addcomment") = "on" then
		Session("prepcomment")=1
		Response.Redirect "prepcomment.asp"
	else
		Session("prepcomment")=0
		Response.Redirect "preopmenu.html"
	end if 
ElseIf Request.Form("type") = "prepcomment" Then
	Session("prepcommenttext")=request("prepcommenttext")
	Response.Redirect "preopmenu.html"
End If



If Request.Form("type") = "preopconsent" Then
	Session("consent")=request("consent")
	Response.Redirect "preopmenu.html"
End if



If Request.Form("type") = "preopphysical" Then
	Session("BP0")=request("BP0")
	Session("BP1")=request("BP1")
	Session("HR")=request("HR")
	Session("RR")=request("RR")
	Session("SaO2")=request("SaO2")
	Session("HEENT")=request("HEENT")
	Session("HEART")=request("HEART")
	Session("LUNGS")=request("LUNGS")
	Session("ABDOMEN")=request("ABDOMEN")
	Session("NEURO")=request("NEURO")
	Session("EXTREMITIES")=request("EXTREMITIES")
	Response.Redirect "preopmenu.html"
End If



If Request.Form("type") = "preopmeds" Then
medstr=request("medstr")
medstr=medstr+" "
parsedMedstr=""
currentId=""
currentPos=0
commaPos=0
oldCommaPos=0
commaPos=InStr(medstr,",")
do until commaPos=0
	if commaPos > 0 then
		currentId=Mid(medstr,oldCommaPos+1,commaPos-oldCommaPos)
		Response.Write " InStr: " + cstr(InStr(parsedMedstr,currentId)) + "<BR>" + vbcrlf
		if InStr(parsedMedstr,currentId) > 0 then
			parsedMedstr=Replace(parsedMedstr, currentId, "")
		else
			parsedMedstr=parsedMedstr+currentId
		end if
		oldCommaPos=commaPos
		currentPos=commaPos+1
	end if
	commaPos=instr(currentPos,Medstr,",")
loop
Session("preopMedstr")=parsedMedstr
Response.Redirect "preopmenu.html"
ElseIf Request.Form("type") = "clearpreopmeds" Then
	Session("preopmeds")=""
	Response.Redirect "preopmeds.asp"
End If



If Request.Form("type") = "intraOpMeds" Then
	Session("intraopmeds_othermed") = Request("intraopmeds_othermed")
	Session("intraopmeds_othermed_text") = Request("intraopmeds_othermed_text")
	medstr=request("medstr")
	medstr=medstr+" "
	parsedMedstr=""
	currentId=""
	currentPos=0
	commaPos=0
	oldCommaPos=0
	commaPos=InStr(medstr,",")
	do until commaPos=0
		if commaPos > 0 then
				currentId=Mid(medstr,oldCommaPos+1,commaPos-oldCommaPos)
				Response.Write " InStr: " + cstr(InStr(parsedMedstr,currentId)) + "<BR>" + vbcrlf
			if InStr(parsedMedstr,currentId) > 0 then
				parsedMedstr=Replace(parsedMedstr, currentId, "")
			else
				parsedMedstr=parsedMedstr+currentId
			end if
				oldCommaPos=commaPos
				currentPos=commaPos+1
		end if
	commaPos=instr(currentPos,Medstr,",")
	loop
	Session("intraopMedstr")=parsedMedstr
	Response.Redirect "intraopmenu.asp"
ElseIf Request.Form("type") = "clearIntraOpMeds" Then
	Session("intraopmeds")=""
	Response.Redirect "intraopmeds.asp"
End If



If Request.Form("type") = "setStartTime" Then
	Session("starttime")=now()
	Response.Redirect "intraopmenu.asp"
ElseIf Request.Form("type") = "setMaxTime" Then
	Session("maxtime")=now()
	Response.Redirect "intraopmenu.asp"
ElseIf Request.Form("type") = "setEndTime" Then
	Session("endtime")=now()
	Response.Redirect "intraopmenu.asp"
End If



If Request.Form("type") = "preopdiagnosis" OR Request.Form("type") = "postopdiagnosis" Then
	If Request.Form("type") = "preopdiagnosis" then
		Session("preopdiagnosis_othermed") = Request("preopdiagnosis_othermed")
		Session("preopdiagnosis_othermed_text") = Request("preopdiagnosis_othermed_text")
	else if Request.Form("type") = "postopdiagnosis" Then
		Session("postopdiagnosis_othermed") = Request("postopdiagnosis_othermed")
		Session("postopdiagnosis_othermed_text") = Request("postopdiagnosis_othermed_text")
	end if
	preopdiagnosis_othermed
	diagstr=request("diagstr")
	diagstr=diagstr+" "
	parsedDiagstr=""
	currentId=""
	currentPos=0
	commaPos=0
	oldCommaPos=0
	commaPos=InStr(diagstr,",")
	do until commaPos=0
		if commaPos > 0 then
			currentId=Mid(diagstr,oldCommaPos+1,commaPos-oldCommaPos)
			Response.Write " InStr: " + cstr(InStr(parsedDiagstr,currentId)) + "<BR>" + vbcrlf
			if InStr(parsedDiagstr,currentId) > 0 then
				parsedDiagstr=Replace(parsedDiagstr, currentId, "")
			else
				parsedDiagstr=parsedDiagstr+currentId
			end if
			oldCommaPos=commaPos
			currentPos=commaPos+1
		end if
		commaPos=instr(currentPos,diagstr,",")
	loop

	If Request.Form("type") = "preopdiagnosis" Then
		Session("preopdiagstr")=parsedDiagstr
		Response.Redirect "preopmenu.html"
	ElseIf Request.Form("type") = "postopdiagnosis" Then
		if session("optype")="colonoscopy" then
			if InStr(parsedDiagstr,"2") > 0 then Session("postopdesc_diverticulae")="on" end if
		else
			if InStr(parsedDiagstr,"2") > 0 then Session("postopdesc_esophagitis")="on" end if
			if InStr(parsedDiagstr,"4") > 0 then Session("postopdesc_gastritis")="on" end if
		end if
		Session("postopdiagstr")=parsedDiagstr
		Response.Redirect "postopmenu.html"
	End If
End If



If Request.Form("type") = "postoprecommend" Then
	diagstr=request("recostr")
	diagstr=diagstr+" "
	parsedDiagstr=""
	currentId=""
	currentPos=0
	commaPos=0
	oldCommaPos=0
	commaPos=InStr(diagstr,",")
	do until commaPos=0
		if commaPos > 0 then
			currentId=Mid(diagstr,oldCommaPos+1,commaPos-oldCommaPos)
			Response.Write " InStr: " + cstr(InStr(parsedDiagstr,currentId)) + "<BR>" + vbcrlf
			if InStr(parsedDiagstr,currentId) > 0 then
				parsedDiagstr=Replace(parsedDiagstr, currentId, "")
			else
				parsedDiagstr=parsedDiagstr+currentId
			end if
			oldCommaPos=commaPos
			currentPos=commaPos+1
		end if
		commaPos=instr(currentPos,diagstr,",")
	loop
	Session("postoprecostr")=parsedDiagstr
	Response.Redirect "postopmenu.html"
End If



If Request.Form("type") = "postopdesc" Then
	Session("postopdesc_appendixseen") = Request("appendixseen")
	Session("postopdesc_ileumintubated") = Request("ileumintubated")
	Session("postopdesc_incomplete") = Request("incomplete")
	Session("postopdesc_inthemorrhoids") = Request("inthemorrhoids")
	if Session("postopdesc_inthemorrhoids")= "on" then
		Session("postopdiagstr")=Session("postopdiagstr") + "3,"
	end if
	Session("postopdesc_exthemorrhoids") = Request("exthemorrhoids")
	if Session("postopdesc_diverticulae")= "on" then
		Session("postopdiagstr")=Session("postopdiagstr") + "4,"
	end if
	Session("postopdesc_hypertrophic") = Request("hypertrophic")
	Session("postopdesc_melanosis") = Request("melanosis")
	Session("postopdesc_lipoma") = Request("lipoma")
	if Session("postopdesc_lipoma")= "on" then
		Session("postopdiagstr")=Session("postopdiagstr") + "5,"
	end if
	Session("postopdesc_diverticulae") = Request("diverticulae")
	if Session("postopdesc_diverticulae")= "on" then
		Session("postopdiagstr")=Session("postopdiagstr") + "2,"
	end if
	Session("postopdescription") = Request("postopdescription")

	Session("postopdesc_incomplete_advancedto") = Request("postopdesc_incomplete_advancedto")
	Session("postopdesc_incomplete_why") = Request("postopdesc_incomplete_why")
	if request("sizelarge") = "on" then Session("postopdesc_diverticulae_size") = "Large " end if
	if request("sizemedium") = "on" then Session("postopdesc_diverticulae_size") = Session("postopdesc_diverticulae_size") + "Medium " end if
	if request("sizesmall") = "on" then Session("postopdesc_diverticulae_size") = Session("postopdesc_diverticulae_size") + "Small " end if
	Session("postopdesc_diverticulae_size") = replace(trim(Session("postopdesc_diverticulae_size"))," ",", ")
	if request("locationleft") = "on" then Session("postopdesc_diverticulae_location")= "Left " end if
	if request("locationright") = "on" then Session("postopdesc_diverticulae_location")= Session("postopdesc_diverticulae_location") + "Right " end if
	if request("locationcecum") = "on" then Session("postopdesc_diverticulae_location")= Session("postopdesc_diverticulae_location") + "Cecum " end if
	Session("postopdesc_diverticulae_location") = replace(trim(Session("postopdesc_diverticulae_location"))," ",", ")
	Session("postopdesc_diverticulae_quantity") = Request("postopdesc_diverticulae_quantity")
	'Session("postopdesc_diverticulae_size") = Request("postopdesc_diverticulae_size")
	'Session("postopdesc_diverticulae_location") = Request("postopdesc_diverticulae_location")
	Session("postopdesc_gejunction") = Request("postopdesc_gejunction")
	Session("postopdesc_esophagitis") = Request("postopdesc_esophagitis")
	if Session("postopdesc_esophagitis")= "on" then
		Session("postopdiagstr")=Session("postopdiagstr") + "2,"
	end if
	Session("postopdesc_esophagitis_grade") = Request("postopdesc_esophagitis_grade")
	Session("postopdesc_esophagitis_erosive") = Request("postopdesc_esophagitis_erosive")
	Session("postopdesc_gastritis") = Request("postopdesc_gastritis")
	if Session("postopdesc_gastritis")= "on" then
		Session("postopdiagstr")=Session("postopdiagstr") + "4,"
	end if
	Session("postopdesc_gastritis_location") = Request("postopdesc_gastritis_location")
	Session("postopdesc_scopetype") = Request("postopdesc_scopetype")
	Session("postopdesc_hiatal_hernia_sliding") = Request("postopdesc_hiatal_hernia_sliding")
	Session("postopdesc_hiatal_hernia") = Request("postopdesc_hiatal_hernia")
	Session("postopdesc_duodenal_biopsied") = Request("postopdesc_duodenal_biopsied")
	Session("postopdesc_duodenal_nodules_metaplasia") = Request("postopdesc_duodenal_nodules_metaplasia")
	Session("postopdesc_duodenal_nodules") = Request("postopdesc_duodenal_nodules")
	Session("postopdesc_duodenitis_level") = Request("postopdesc_duodenitis_level")
	Session("postopdesc_duodenitis") = Request("postopdesc_duodenitis")
	Session("postopdesc_esophogeal_ring") = Request("postopdesc_esophogeal_ring")
	Session("postopdesc_patulous") = Request("postopdesc_patulous")
	Session("postopdesc_barretts_location") = Request("postopdesc_barretts_location")
	Session("postopdesc_barretts") = Request("postopdesc_barretts")
	Session("postopdesc_gejunction_normal") = Request("postopdesc_gejunction_normal")
	Session("postopdesc_cords_abnormal_how") = Request("postopdesc_cords_abnormal_how")
	Session("postopdesc_cords_abnormal") = Request("postopdesc_cords_abnormal")
	Session("postopdesc_cords") = Request("postopdesc_cords")
	Response.Redirect "postopmenu.html"
End If



Response.Write(Request.Form("type"))

%>