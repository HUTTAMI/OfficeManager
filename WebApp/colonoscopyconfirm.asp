<%
for each x in Application.Contents
if len(x) > 36 AND left(x,36) = request("operation_id") then
  Session(right(x,len(x)-36))=Application.Contents(x)
  'Response.Write(x + "=" + Application.Contents(x) + "<br>")
end if
Next

'session.SessionID = request("sessionid")
if Session("grantAccess") <> 1 then 
	Response.Redirect "login.html"
end if
%>

<%		
Set sqlconnection = Server.CreateObject("ADODB.Connection")Set rs = Server.CreateObject("ADODB.recordset")
			sqlconnection.ConnectionTimeout=60
sqlconnection.Open session("dbAppDSN"),session("dbUsername"),session("dbPassword")
			
rs.Open "SELECT lastname,firstname,homeaddr1,homeaddr2,homecity,homestate,homezipcode,homephone,pinsurance_name,dob,colondata.dbo.physicians.text as physicianname FROM appointments,patients,colondata.dbo.physicians WHERE patients.chartno LIKE '"+ Session("chartno") + "' AND appointments.operatingdoctor=colondata.dbo.physicians.id AND appointments.chartno=patients.chartno", sqlconnection
if not rs.EOF thenlastname=rs("lastname")
firstname=rs("firstname")
homeaddr1=rs("homeaddr1") + rs("homeaddr2") 
homecity=rs("homecity") 
homestate=rs("homestate") 
homezipcode=rs("homezipcode")homephone=rs("homephone")pinsurance_name=rs("pinsurance_name")dob=rs("dob")physicianname=rs("physicianname")
end ifrs.close
sqlconnection.closeif Session("optype") = "egd" then
	Session("postopdescription")="The patient was placed in the high Fowler's position with the head " & _
			"elevated at a 90° angle.  The patient's throat was sprayed twice with " & _
			"Cetacaine and a bite block was applied to keep the mouth open for " & _
			"scope insertion.  Using " & Session("postopdesc_scopetype") & " videoscope the patient's mouth was " & _
			"intubated.  "
			if Session("postopdesc_cords") = "on" then
				Session("postopdescription")=Session("postopdescription")+"Vocal cords were noted "
			end if
			if Session("postopdesc_cords_abnormal") = "on" then
				Session("postopdescription")=Session("postopdescription")+"and appeared abnormal due to " + Session("postopdesc_cords_abnormal_how") + ".  "
			else
				Session("postopdescription")=Session("postopdescription")+"and appeared normal.  "
			end if
			if 	Session("postopdesc_esophagitis") = "on" then
				if Session("postopdesc_esophagitis_erosive") = "on" then
					Session("postopdescription")=Session("postopdescription")+"Grade " + Session("postopdesc_esophagitis_grade") + " erosive esophagitis was noted.  "
				else
					Session("postopdescription")=Session("postopdescription")+"Grade " + Session("postopdesc_esophagitis_grade") + " esophagitis was noted.  "
				end if
			end if
			if 	Session("postopdesc_barretts") = "on" then
				Session("postopdescription")=Session("postopdescription")+"Barrett's was noted at " + Session("postopdesc_barretts_location") + ".  "
			end if
			if Session("postopdesc_esophogeal_ring") = "on" then
				Session("postopdescription")=Session("postopdescription")+"A lower esophogeal ring was noted.  "
			end if
			Session("postopdescription")=Session("postopdescription")+"The scope tip was gradually advanced in the esophagus to the esophagogastral " & _
			"junction, noted at " & Session("postopdesc_gejunction") & " cm from the incisors. Advancement " & _
			"of the scope was continued towards the stomach entering through the " & _
			"lower esophageal sphincter (LES)"
			if 	Session("postopdesc_patulous") = "on" then
				Session("postopdescription")=Session("postopdescription")+", which appeared patulous,"
			end if
			Session("postopdescription")=Session("postopdescription")+" and following the lesser curvature " & _
			"to view the pylorus. " & Session("postopdesc_scopetype") & " Scope was advanced through the pyloric " & _
			"sphincter to view the duodenal bulb and the second part of the duodenum. "
			if Session("postopdesc_duodenitis") = "on" then
				Session("postopdescription")=Session("postopdescription")+Session("postopdesc_duodenitis_level") + " duodenitis was noted.  "
			end if
			if Session("postopdesc_duodenal_nodules") = "on" then
				Session("postopdescription")=Session("postopdescription")+ "Duodenal nodules were noted.  "
				if Session("postopdesc_duodenal_nodules_metaplasia") = "on" then
					Session("postopdescription")=Session("postopdescription")+ "Suspected intestinal metaplaysia.  "
				end if
				if Session("postopdesc_duodenal_biopsied") = "on" then
					Session("postopdescription")=Session("postopdescription")+ "Nodules were biopsied.  "
				end if
			end if
			Session("postopdescription")=Session("postopdescription")+"The scope was then withdrawn back into the " & _
			"stomach to view the antrum, body and fundus. "
			
			if Session("postopdesc_hiatal_hernia") = "on" then
				if Session("postopdesc_hiatal_hernia_sliding") = "on" then
					Session("postopdescription")=Session("postopdescription")+ "A sliding hiatal hernia was noted.  "
				else
					Session("postopdescription")=Session("postopdescription")+ "A hiatal hernia was noted.  "
				end if
			end if
			Session("postopdescription")=Session("postopdescription")+"The scope tip " & _
			"was then retroflexed to view the LES.  The scope was then " & _
			"removed from the patient, thus concluding the procedure."
			
			Set sqlconnection = Server.CreateObject("ADODB.Connection")			Set rs = Server.CreateObject("ADODB.recordset")
								sqlconnection.ConnectionTimeout=60
			sqlconnection.Open session("dbColonDSN"),session("dbUsername"),session("dbPassword")
			rs.Open "SELECT polyps.polypid, polyps.polypsize, polyps.polyplength, id_polyp_parttaken.text as parttaken,id_polyp_howtaken.text as howtaken, polyps.destroyed FROM polyps,id_polyp_parttaken,id_polyp_howtaken WHERE id_polyp_howtaken.id=polyps.howtaken AND id_polyp_parttaken.id=polyps.parttaken AND polyps.operationid LIKE '"+ Session("operation_id") +"'", sqlconnection
			x=0
			if (not rs.EOF) then
				do until rs.EOF
					x=x+1
					rs.MoveNext
				loop
			end if
			Session("specimencount")=x

			rs.close
			sqlconnection.close
	
elseif Session("optype") = "colonoscopy" then
	Session("postopdescription")= "Patient was placed in the left lateral decubitus position. Using " & _
			Session("postopdesc_scopetype") & " videoscope, the patient's rectum was intubated after " & _
			"lubricating anal area, No significant lesions were noticed in the " & _
			"perineum. Scope tip was then gradually advanced up to the "
	if session("postopdesc_incomplete")<> "on" then
		Session("postopdescription")=Session("postopdescription") + "cecum, " & _
				"which was identified by landmarks including converging tinea coli, "
				
		if Session("postopdesc_appendixseen")="on" then
			Session("postopdescription")=Session("postopdescription")+"appendiceal orifice "
		end if
	
		Session("postopdescription")=Session("postopdescription")+" and the bulbous ileocecal valve. "
				
		if Session("postopdesc_appendixseen")="on" then
			Session("postopdescription")=Session("postopdescription")+"The appendical orifice was photodocumented. "
		end if

	else
		Session("postopdescription")=Session("postopdescription")+session("postopdesc_incomplete_advancedto")+". Further advance was not possible due to "+session("postopdesc_incomplete_why")+". "
	end if
		
	Session("postopdescription")=Session("postopdescription")+"Scope tip was gradually withdrawn while " & _
	"circumferentially examining the luminal surfaces of the ascending, " & _
	"transverse descending and sigmoid colon. "			if Session("postopdesc_diverticulae")="on" then
			Session("postopdescription")=Session("postopdescription")+Session("postopdesc_diverticulae_size")+" diverticulae seen throughout the colon. "
		end if	
	Set sqlconnection = Server.CreateObject("ADODB.Connection")	Set rs = Server.CreateObject("ADODB.recordset")
				sqlconnection.ConnectionTimeout=60
	sqlconnection.Open session("dbColonDSN"),session("dbUsername"),session("dbPassword")
	rs.Open "SELECT polyps.polypid, polyps.polypsize, polyps.polyplength, id_polyp_parttaken.text as parttaken,id_polyp_howtaken.text as howtaken, polyps.destroyed FROM polyps,id_polyp_parttaken,id_polyp_howtaken WHERE id_polyp_howtaken.id=polyps.howtaken AND id_polyp_parttaken.id=polyps.parttaken AND polyps.operationid LIKE '"+ Session("operation_id") +"'", sqlconnection
	x=0
	if (not rs.EOF) then
		Session("postopdescription")=Session("postopdescription") + "<BR> <BR>" + vbcrlf
		do until rs.EOF
		x=x+1
			Session("postopdescription")=Session("postopdescription") + "<B>A " + Cstr(rs.Fields("polypsize")) + " finding at " + Cstr(rs.Fields("polyplength")) + " " + Cstr(rs.Fields("parttaken")) + " was " + Cstr(rs.Fields("howtaken"))
			if rs.Fields("destroyed") then
				Session("postopdescription")=Session("postopdescription") + " Polyp was destroyed.</B><BR>" + vbcrlf
			else
				Session("postopdescription")=Session("postopdescription") + "</B><BR>" + vbcrlf
			end if
			rs.MoveNext
		loop
		Session("postopdescription")=Session("postopdescription") + "<BR> <BR>" + vbcrlf
	end if
	Session("specimencount")=x

	rs.close
	sqlconnection.close

	Session("postopdescription")=Session("postopdescription") & "The scope tip was retroflexed in the rectum. "
	if Session("postopdesc_inthemorrhoids")="on" then
		Session("postopdescription")=Session("postopdescription")+"Internal hemorrhoids were seen. "
	end if
	if Session("postopdesc_hypertrophic")="on" then
		Session("postopdescription")=Session("postopdescription")+"Anal Papillae were seen. "
	end if	
	
	Session("postopdescription")=Session("postopdescription")+"The scope tip unretroflexed and insuflated air was suctioned and the scope tip was then withdrawn " & _
			"from the patient, thus concluding the procedure. "
			
	if Session("postopdesc_melanosis")="on" then
		Session("postopdescription")=Session("postopdescription")+"Melanosis Coli was noted. "
	end if	
	if Session("postopdesc_lipoma")="on" then
		Session("postopdescription")=Session("postopdescription")+"Lipoma was noted. "
	end if							
	Session("postopdescription")=Session("postopdescription")+"Patient tolerated the procedure well. Patient was given post-endoscopy instruction."
end if	if len(Session("postopdiagstr")) > 0 then
		Set sqlconnection = Server.CreateObject("ADODB.Connection")		Set rs = Server.CreateObject("ADODB.recordset")
						sqlconnection.ConnectionTimeout=60
		sqlconnection.Open session("dbColonDSN"),session("dbUsername"),session("dbPassword")	
		if Session("optype") = "colonoscopy" then			rs.Open "SELECT text FROM id_colon_postopdiag WHERE id IN (" + left(Session("postopdiagstr"), len(Session("postopdiagstr"))-1) + ")", sqlconnection		else
			rs.Open "SELECT text FROM id_egd_postopdiag WHERE id IN (" + left(Session("postopdiagstr"), len(Session("postopdiagstr"))-1) + ")", sqlconnection		end if
		if (not rs.EOF) then
			do until rs.EOF
				postopdiagtext=postopdiagtext+rs("text") + ", "
				rs.MoveNext
			loop
		end if
		
		rs.close
		sqlconnection.close
		
		postopdiagtext=left(postopdiagtext, len(postopdiagtext)-2)	end if		if len(Session("preopdiagstr")) > 0 then
		Set sqlconnection = Server.CreateObject("ADODB.Connection")		Set rs = Server.CreateObject("ADODB.recordset")
						sqlconnection.ConnectionTimeout=60
		sqlconnection.Open session("dbColonDSN"),session("dbUsername"),session("dbPassword")	
		if Session("optype") = "colonoscopy" then			rs.Open "SELECT text FROM id_colon_preopdiag WHERE id IN (" + left(Session("preopdiagstr"), len(Session("preopdiagstr"))-1) + ")", sqlconnection		else
			rs.Open "SELECT text FROM id_egd_preopdiag WHERE id IN (" + left(Session("preopdiagstr"), len(Session("preopdiagstr"))-1) + ")", sqlconnection		end if
		if (not rs.EOF) then
			do until rs.EOF
				preopdiagtext=preopdiagtext+rs("text") + ", "
				rs.MoveNext
			loop
		end if
		
		rs.close
		sqlconnection.close
		
		preopdiagtext=left(preopdiagtext, len(preopdiagtext)-2)	end if		if len(Session("intraopmedstr")) > 0 then
		Set sqlconnection = Server.CreateObject("ADODB.Connection")		Set rs = Server.CreateObject("ADODB.recordset")
						sqlconnection.ConnectionTimeout=60
		sqlconnection.Open session("dbColonDSN"),session("dbUsername"),session("dbPassword")	
		if Session("optype") = "colonoscopy" then			rs.Open "SELECT text FROM id_colon_intraopmeds WHERE id IN (" + left(Session("intraopmedstr"), len(Session("intraopmedstr"))-1) + ")", sqlconnection		else
			rs.Open "SELECT text FROM id_egd_intraopmeds WHERE id IN (" + left(Session("intraopmedstr"), len(Session("intraopmedstr"))-1) + ")", sqlconnection		end if
		if (not rs.EOF) then
			do until rs.EOF
				intraopmedstext=intraopmedstext+rs("text") + ", "
				rs.MoveNext
			loop
		end if
		
		rs.close
		sqlconnection.close
		
		intraopmedstext=left(intraopmedstext, len(intraopmedstext)-2)	end if
	if len(Session("postoprecostr")) > 0 then
		Set sqlconnection = Server.CreateObject("ADODB.Connection")		Set rs = Server.CreateObject("ADODB.recordset")
						sqlconnection.ConnectionTimeout=60
		sqlconnection.Open session("dbColonDSN"),session("dbUsername"),session("dbPassword")	
		if Session("optype") = "colonoscopy" then			rs.Open "SELECT text FROM id_colon_recommendations WHERE id IN (" + left(Session("postoprecostr"), len(Session("postoprecostr"))-1) + ")", sqlconnection		else
			rs.Open "SELECT text FROM id_egd_recommendations WHERE id IN (" + left(Session("postoprecostr"), len(Session("postoprecostr"))-1) + ")", sqlconnection		end if
		if (not rs.EOF) then
			do until rs.EOF
				postoprecostrtext=postoprecostrtext+rs("text") + ", "
				rs.MoveNext
			loop
		end if
		
		rs.close
		sqlconnection.close
		
		postoprecostrtext=left(postoprecostrtext, len(postoprecostrtext)-2)	end if
		if len(Session("preopmedstr")) > 0 then	currentPos=1
	do while(instr(currentPos,Session("preopmedstr"),",")>0)	commaPos=instr(currentPos,Session("preopmedstr"),",")	segment=mid(Session("preopmedstr"),currentPos,commaPos-currentPos)	if instr(1,segment,"_med") >0 then		medStr=medStr+left(segment,instr(1,segment,"_med")-1)+","
	else		antiStr=antiStr+left(segment,instr(1,segment,"_anti")-1)+","
	end if	currentPos=commaPos+1
	loop	 	
		Set sqlconnection = Server.CreateObject("ADODB.Connection")		Set rs = Server.CreateObject("ADODB.recordset")
						sqlconnection.ConnectionTimeout=60
		sqlconnection.Open session("dbColonDSN"),session("dbUsername"),session("dbPassword")	
		if Session("optype") = "colonoscopy" then			rs.Open "SELECT text FROM id_colon_preopmeds WHERE id IN (" + left(medStr, len(medStr)-1) + ") UNION SELECT text FROM id_colon_preopantibiotics WHERE id IN (" + left(antiStr, len(antiStr)-1) + ")", sqlconnection		else
			rs.Open "SELECT text FROM id_egd_preopmeds WHERE id IN (" + left(medStr, len(medStr)-1) + ") UNION SELECT text FROM id_egd_preopantibiotics WHERE id IN (" + left(antiStr, len(antiStr)-1) + ")", sqlconnection		end if
		if (not rs.EOF) then
			do until rs.EOF
				preopmedstext=preopmedstext+rs("text") + ", "
				rs.MoveNext
			loop
		end if
		
		rs.close
		sqlconnection.close
		
		preopmedstext=left(preopmedstext, len(preopmedstext)-2)	end if
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
	<META HTTP-EQUIV="CONTENT-TYPE" CONTENT="text/html; charset=windows-1252">
	<TITLE><%=lastname%>,&nbsp;<%=firstname%></TITLE>
	<STYLE>
	<!--
		@page { size: 8.5in 11in; margin-right: 0.75in; margin-top: 0.5in; margin-bottom: 0.5in }
		P { margin-bottom: 0in; direction: ltr; color: #000000; text-align: justify; widows: 2; orphans: 2 }
		P.western { font-family: "Times New Roman", serif; font-size: 10pt; so-language: en-US }
		P.cjk { font-family: "Times New Roman", serif; font-size: 10pt }
		P.ctl { font-family: "Times New Roman", serif; font-size: 12pt; so-language: ar-SA }
		TD P { margin-bottom: 0in; direction: ltr; color: #000000; text-align: justify; widows: 2; orphans: 2 }
		TD P.western { font-family: "Times New Roman", serif; font-size: 10pt; so-language: en-US }
		TD P.cjk { font-family: "Times New Roman", serif; font-size: 10pt }
		TD P.ctl { font-family: "Times New Roman", serif; font-size: 12pt; so-language: ar-SA }
	-->
	</STYLE>
</HEAD>
<BODY LANG="en-US" TEXT="#000000" DIR="ltr">
<INPUT type="hidden" id=fullscreen name=fullscreen value="true">
	<CENTER><b>
	<FONT SIZE=3>South Carolina Medical Endoscopy Center</FONT><br>
	<FONT SIZE=3>1735 Taylor Street, Columbia, SC 29201</FONT><br>
	<FONT SIZE=2 STYLE="FONT-SIZE: 11pt">(803) 254-8449    Fax (803) 254-8984</FONT>
	</b>
	</CENTER>
	<TABLE WIDTH=100% BORDER=0 CELLPADDING=7 CELLSPACING=0>
		<TR>
		<TD><FONT SIZE=3><%if (Session("optype")="colonoscopy") then response.write "COLONOSCOPY" else response.write "EGD" end if%></FONT></TD>
		<TD align=right><FONT SIZE=3>DATE: <%=Session("starttime")%></FONT></TD>
		</TR>
	</TABLE>	
<TABLE WIDTH=686 BORDER=0 CELLPADDING=7 CELLSPACING=0>
  <COLGROUP>
	<COL WIDTH=89>
	<COL WIDTH=569>
	<TR VALIGN=top>
		<TD WIDTH=89>
			<P CLASS="western" ALIGN=left><FONT SIZE=3>PATIENT:</FONT></P>
		</TD>
		<TD WIDTH=569>
			<P CLASS="western" ALIGN=left><FONT SIZE=3><%=firstname%>&nbsp;<%=lastname%></FONT></P>
			<P CLASS="western" ALIGN=left><FONT SIZE=3><%=homeaddr1%><BR><%=homecity%>      ,&nbsp;<%=homestate%>&nbsp;<%=homezipcode%><BR>Ph: <%=homephone%></FONT></P>
			<P CLASS="western" ALIGN=left><FONT SIZE=3>Date of Birth: <%=dob%><BR>Insurance Carrier: <%=pinsurance_name%><BR>Primary Care Physician: Dr. <%=physicianname%></FONT></P>
		</TD>
	</TR>
</TABLE>
<P CLASS="western" ALIGN=left><BR>
</P>
<P CLASS="western" ALIGN=left><FONT SIZE=3>PREOPERATIVE DIAGNOSIS:
<%=preopdiagtext%></FONT></P>
<P CLASS="western" ALIGN=left><FONT SIZE=3>POSTOPERATIVE DIAGNOSIS:
<%=postopdiagtext%></FONT></P>
<P CLASS="western" ALIGN=left><BR>
</P>
<P CLASS="western" ALIGN=left><FONT SIZE=3>PREOPERATIVE PHYSICAL:</FONT></P>
<P CLASS="western" ALIGN=left><BR>
</P>
<TABLE WIDTH=657 BORDER=0 CELLPADDING=7 CELLSPACING=0>
  <COLGROUP>
	<COL WIDTH=125>
	<COL WIDTH=504>
	<TR VALIGN=top>
		<TD WIDTH=125>
			<P CLASS="western" ALIGN=left><FONT SIZE=3>Vital Signs:</FONT></P>
		</TD>
		<TD WIDTH=504>
			<P CLASS="western" ALIGN=left><FONT SIZE=3>BP: <%=Session("BP0")%>       /<%=Session("BP1")%>           HR: <%=Session("HR")%>   
			       RR: <%=Session("RR")%>           SaO2: <%=Session("SaO2")%></FONT></P>
		</TD>
	</TR>
	<TR VALIGN=top>
		<TD WIDTH=125>
			<P CLASS="western" ALIGN=left><FONT SIZE=3>HEENT:</FONT></P>
		</TD>
		<TD WIDTH=504>
			<P CLASS="western" ALIGN=left><FONT SIZE=3><%=Session("HEENT")%></FONT></P>
		</TD>
	</TR>
	<TR VALIGN=top>
		<TD WIDTH=125>
			<P CLASS="western" ALIGN=left><FONT SIZE=3>HEART:</FONT></P>
		</TD>
		<TD WIDTH=504>
			<P CLASS="western" ALIGN=left><FONT SIZE=3><%=Session("HEART")%></FONT></P>
		</TD>
	</TR>
	<TR VALIGN=top>
		<TD WIDTH=125>
			<P CLASS="western" ALIGN=left><FONT SIZE=3>LUNGS:</FONT></P>
		</TD>
		<TD WIDTH=504>
			<P CLASS="western" ALIGN=left><FONT SIZE=3><%=Session("LUNGS")%></FONT></P>
		</TD>
	</TR>
	<TR VALIGN=top>
		<TD WIDTH=125>
			<P CLASS="western" ALIGN=left><FONT SIZE=3>ABDOMEN:</FONT></P>
		</TD>
		<TD WIDTH=504>
			<P CLASS="western" ALIGN=left><FONT SIZE=3><%=Session("ABDOMEN")%></FONT></P>
		</TD>
	</TR>
	<TR VALIGN=top>
		<TD WIDTH=125>
			<P CLASS="western" ALIGN=left><FONT SIZE=3>NEURO:</FONT></P>
		</TD>
		<TD WIDTH=504>
			<P CLASS="western" ALIGN=left><FONT SIZE=3><%=Session("NEURO")%></FONT></P>
		</TD>
	</TR>
	<TR VALIGN=top>
		<TD WIDTH=125>
			<P CLASS="western" ALIGN=left><FONT SIZE=3>EXTREMITIES:</FONT></P>
		</TD>
		<TD WIDTH=504>
			<P CLASS="western" ALIGN=left><FONT SIZE=3><%=Session("EXTREMITIES")%></FONT></P>
		</TD>
	</TR>
</TABLE>
<P CLASS="western" ALIGN=left><BR>
</P>
<P CLASS="western" ALIGN=left><FONT SIZE=3>INFORMED CONSENT: Risks,
benefits, alternatives and conscious sedation issues were discussed
with patient prior to the procedure, including the risks (bleeding,
infection, perforation and/or missing polyps).  Appropriate informed
consent was obtained and signed by the physician and the responsible
party.</FONT></P>
<P CLASS="western" ALIGN=left><BR>
</P>
<P CLASS="western" ALIGN=left><FONT SIZE=3>PREOPERATIVE MEDICATIONS:
<%=preopmedstext%></FONT></P>
<P CLASS="western" ALIGN=left><FONT SIZE=3>INTRA-OPERATIVE MEDICATIONS: <%=intraopmedstext%></FONT></P>
<P CLASS="western" ALIGN=left><BR>
</P>
<P CLASS="western" ALIGN=left><FONT SIZE=3>SPECIMEN: <%=Session("specimencount")%></P>
<P CLASS="western" ALIGN=left><BR>
</P>
<P CLASS="western" ALIGN=left><FONT SIZE=3>DESCRIPTION OF PROCEDURE:
</FONT></P>

<P LANG="fr-FR" ALIGN=left>
<%=Session("postopdescription")%>
</P>
<P LANG="fr-FR" ALIGN=left><FONT SIZE=3>Prep was considered <%=Session("prep")%>
<%
if Session("prepcomment") = "1" then
	Response.Write " with comment:"
else
	Response.Write "."
end if
%>
</FONT></P>
<P LANG="fr-FR" CLASS="western" ALIGN=left>
<%
if Session("prepcomment") = "1" then
	Response.Write trim(Session("prepcommenttext"))
end if
%>
<BR>
</P>
<P CLASS="western" ALIGN=left><BR>
</P>
<TABLE WIDTH=676 BORDER=0 CELLPADDING=7 CELLSPACING=0>
  <COLGROUP>
	<COL WIDTH=177>
	<COL WIDTH=471>
	<TR VALIGN=top>
		<TD WIDTH=177>
			<P LANG="fr-FR" CLASS="western" ALIGN=left><FONT SIZE=3><B>RECOMMENDATIONS:</B></FONT></P>
		</TD>
		<TD WIDTH=471>
			<P LANG="fr-FR" CLASS="western" ALIGN=left><FONT SIZE=3><B><%=postoprecostrtext%></B></FONT></P>
		</TD>
	</TR>
</TABLE>
<TABLE WIDTH=676 BORDER=0 CELLPADDING=7 CELLSPACING=0>
  <COLGROUP>
	<COL WIDTH=177>
	<COL WIDTH=471>
	<TR VALIGN=top>
		<TD WIDTH=177>
			<P LANG="fr-FR" CLASS="western" ALIGN=left><FONT SIZE=3><B>IMPRESSIONS:</B></FONT></P>
		</TD>
		<TD WIDTH=471>
			<P LANG="fr-FR" CLASS="western" ALIGN=left><FONT SIZE=3><B><%=replace(postopdiagtext,", ","<BR>")%></B></FONT></P>
		</TD>
	</TR>
</TABLE>

<P LANG="fr-FR" CLASS="western" ALIGN=left><BR>
</P>
<P ALIGN=left><BR>
</P>
<TABLE WIDTH=334 BORDER=0 CELLPADDING=7 CELLSPACING=0>
  <COLGROUP>
	<COL WIDTH=294>
	<COL WIDTH=13>
	<TR>
		<TD COLSPAN=2 WIDTH=320 VALIGN=top>
			<P CLASS="western" ALIGN=left><FONT SIZE=3>________________________________________</FONT></P>
		</TD>
	</TR>
	<TR>
		<TD COLSPAN=2 WIDTH=320 VALIGN=top>
			<P CLASS="western" ALIGN=left><FONT SIZE=3><STRONG><%=physicianname%>, MD, Attending 
      Physician</STRONG></FONT></P>
		</TD>
	</TR>
	<TR VALIGN=top>
		<TD WIDTH=294>
			<P CLASS="western" ALIGN=left><BR>
			</P>
		</TD>
		<TD WIDTH=13>
			<P CLASS="western" ALIGN=left><BR>
			</P>
		</TD>
	</TR>
	<TR>
		<TD COLSPAN=2 WIDTH=320 VALIGN=top>
			<P CLASS="western"><BR>
			</P>
		</TD>
	</TR>
</TABLE>
<P CLASS="western" ALIGN=left><TABLE DIR="ltr" ALIGN=right WIDTH=308 HSPACE="6" BORDER=0 CELLPADDING=7 CELLSPACING=0>
  <COLGROUP>
	<COL WIDTH=294>
	<TR>
		<TD WIDTH=294 VALIGN=top>
			<P CLASS="western" ALIGN=left> 
			</P>
		</TD>
	</TR>
	<TR>
		<TD WIDTH=294 VALIGN=top>
			<P CLASS="western" ALIGN=left><BR>
			</P>
		</TD>
	</TR>
</TABLE><BR>
</P>
<P CLASS="western" ALIGN=left><BR>
</P>
<DIV TYPE="FOOTER">
	<P ALIGN=center><FONT SIZE=2 STYLE="FONT-SIZE: 9pt">Patient: <%=lastname%>, <%=firstname%>&nbsp;&nbsp;&nbsp;Operation Date: <%=Session("starttime")%></FONT>
	 <SDFIELD TYPE="DATETIME" SDNUM="1033;1033;M/D/YYYY"></SDFIELD></SDFIELD></P>
</DIV>
<TABLE width=100% border=0 CELLSPACING=0 CELLPADDING=0>
	<TR>
		<TD><INPUT id=exitBtn style="FONT-WEIGHT: bold; FONT-SIZE: larger; WIDTH: 105px; COLOR: white; FONT-FAMILY: monospace; HEIGHT: 76px; BACKGROUND-COLOR: black" type=button size=31 value="EXIT" name=exitBtn onclick="top.close();"></TD>
		<TD colspan=2 align=right><INPUT id=nextBtn style="FONT-WEIGHT: bold; FONT-SIZE: larger; WIDTH: 210px; COLOR: white; FONT-FAMILY: monospace; HEIGHT: 76px; BACKGROUND-COLOR: light gray" type=button size=61 value="Save and Print->" name=nextBtn onclick="document.location.href='colonoscopyprint.asp'"></TD>
	</TR>
</TABLE></FONT>
<P CLASS="western" ALIGN=left><FONT SIZE=3>PROCEDURE IMAGES:</FONT></P>
<TABLE width=100%>
<%
Set sqlconnection = Server.CreateObject("ADODB.Connection")Set rs = Server.CreateObject("ADODB.recordset")
			sqlconnection.ConnectionTimeout=60
sqlconnection.Open session("dbColonDSN"),session("dbUsername"),session("dbPassword")

rs.Open "SELECT * FROM operation_pics WHERE operationid='"+ replace(replace(request("operation_id"),"{",""),"}","") +"'", sqlconnection

			if (not rs.EOF) then
				do until rs.EOF
					preLineCount=0
					Response.Write "<TR>" + vbcrlf
					do until preLineCount>=2 or rs.eof
						Response.Write "<TD><CENTER><img width=320 src="""+session("imageURL")+Cstr(rs.Fields("filename"))+"""><BR>" + Cstr(rs.Fields("photocaption")) + "</CENTER><BR></TD>" + vbcrlf
						preLineCount=preLineCount+1
						rs.MoveNext
					loop
					Response.Write "</TR>" + vbcrlf
				loop
			else
					Response.Write "<TR>" + vbcrlf
					Response.Write "<TD><B>No images for this procedure<B></TD>" + vbcrlf
					Response.Write "</TR>" + vbcrlf
			end if
rs.close
sqlconnection.close
%>
</TABLE>
</BODY>
</HTML>