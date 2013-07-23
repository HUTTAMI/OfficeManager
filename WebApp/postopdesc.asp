<%
if Session("grantAccess") <> 1 then 
	Response.Redirect "login.html"
end if
%>

<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<TITLE></TITLE>

<SCRIPT LANGUAGE=JAVASCRIPT>
<!--


    function expandAll(varclass) {
    var myclass=varclass
    divColl = document.all.tags("tr");


        for (i=0; i<divColl.length; i++) {


            if (divColl(i).className == myclass) {
            divColl(i).style.display = (divColl(i).style.display == "none" ) ? "" : "none";
        }
    }
}
//-->
</SCRIPT>
</HEAD>
<BODY  bgcolor=lightgrey>
<input type="hidden" id="operation_id" name="operation_id" value="<%=Session("operation_id")%>">
<FORM action=formSubmit.asp method="post">
<CENTER>
<TABLE WIDTH=* BORDER=0 CELLSPACING=0 CELLPADDING=0>
	<TR>
		<TD colspan=2 rowspan=2 align=left width=* height=350 valign=top>
		<FONT size=+1><B>Description of Procedure</B></FONT>
	<HR width=320 align=left>
	<TABLE WIDTH=* BORDER=0 CELLSPACING=3 CELLPADDING=1>
	<TR>
	<TD>
	<B>Scope Type</B>
	</TD>
	<TD>
	<SELECT id=postopdesc_scopetype name=postopdesc_scopetype STYLE="FONT-SIZE: large">		<OPTION value="Olympus" <% If Session("postopdesc_scopetype") = "Olympus" Then Response.Write("selected") End If %>>Olympus</OPTION>		<OPTION value="Pantex" <% If Session("postopdesc_scopetype") = "Pantex" Then Response.Write("selected") End If %>>Pantex</OPTION>
	</SELECT>
	</TD>
	</TR>
	<%if Session("optype")="colonoscopy" then%>
	<TR>
	<TD><INPUT type=checkbox id=appendixseen name=appendixseen style="WIDTH: 40px; HEIGHT: 40px" size=41 <% If Session("postopdesc_appendixseen") = "on" Then Response.Write("checked") End If %>></TD>
	<TD><FONT size=+1><B>Appendix seen</B></FONT></TD>
	</TR>
	<TR>
	<TD><INPUT type=checkbox id=ileumintubated name=ileumintubated style="WIDTH: 40px; HEIGHT: 40px" size=41 <% If Session("postopdesc_ileumintubated") = "on" Then Response.Write("checked") End If %>></TD>
	<TD><FONT size=+1><B>Terminal Ileum Intubated</B></FONT></TD>
	</TR>
	<%end if%>
	<%if Session("optype")="egd" then%>
	
	
	
	<TR>
	<TD><INPUT type=checkbox id=postopdesc_cords name=postopdesc_cords style="WIDTH: 40px; HEIGHT: 40px" size=41 <% If Session("postopdesc_cords") = "on" Then Response.Write("checked") End If %> onclick="expandAll('cords');"></TD>
	<TD><FONT size=+1><B>Vocal cords seen</B></FONT></TD>
	</TR>
	<TR CLASS="cords" STYLE="DISPLAY: <% If Session("postopdesc_cords") <> "on" Then Response.Write("none") End If %>">
		<TD><FONT size=+1>Abnormal:</FONT></TD>
	<TD><INPUT type=checkbox id=postopdesc_cords_abnormal name=postopdesc_cords_abnormal style="WIDTH: 40px; HEIGHT: 40px" size=41 <% If Session("postopdesc_cords_abnormal") = "on" Then Response.Write("checked") End If %>  onclick="expandAll('cords_abnormal');"></TD>
	</TR>
	<TR CLASS="cords_abnormal" STYLE="DISPLAY: <% If Session("postopdesc_cords_abnormal") <> "on" Then Response.Write("none") End If %>">
	<TD>How:</TD>
	<TD><INPUT type="text" value="<%=Session("postopdesc_cords_abnormal_how")%>" id=postopdesc_cords_abnormal_how name=postopdesc_cords_abnormal_how STYLE="WIDTH: 200px; FONT-SIZE: large"></TD>
	</TR>
	<TR>
		<TD><B>GE Junction (cm)</B></TD>
		<TD><INPUT type="text" id=postopdesc_gejunction name=postopdesc_gejunction value="<%=Session("postopdesc_gejunction")%>" style="FONT-SIZE: larger; WIDTH: 200px; HEIGHT: 40px"></TD>
	</TR>
	<TR>
	<TD><INPUT type=checkbox id=postopdesc_gejunction_normal name=postopdesc_gejunction_normal style="WIDTH: 40px; HEIGHT: 40px" size=41 <% If Session("postopdesc_gejunction_normal") = "on" Then Response.Write("checked") End If %>></TD>
	<TD><FONT size=+1><B>GE Junction Normal</B></FONT></TD>
	</TR>
	<TR>
	<TD><INPUT type=checkbox id=postopdesc_esophagitis name=postopdesc_esophagitis style="WIDTH: 40px; HEIGHT: 40px" size=41 <% If Session("postopdesc_esophagitis") = "on" Then Response.Write("checked") End If %> onclick="expandAll('esophagitis');"></TD>
	<TD><FONT size=+1><B>Esophagitis</B></FONT></TD>
	</TR>
	<TR CLASS="esophagitis" STYLE="DISPLAY: <% If Session("postopdesc_esophagitis") <> "on" Then Response.Write("none") End If %>">
	<TD>
	Grade:
	</TD>
	<TD>
	<SELECT id=postopdesc_esophagitis_grade name=postopdesc_esophagitis_grade STYLE="FONT-SIZE: large">		<OPTION value="I" <% If Session("postopdesc_esophagitis_grade") = "I" Then Response.Write("selected") End If %>>I</OPTION>		<OPTION value="II" <% If Session("postopdesc_esophagitis_grade") = "II" Then Response.Write("selected") End If %>>II</OPTION>		<OPTION value="III" <% If Session("postopdesc_esophagitis_grade") = "III" Then Response.Write("selected") End If %>>III</OPTION>		<OPTION value="IV" <% If Session("postopdesc_esophagitis_grade") = "IV" Then Response.Write("selected") End If %>>IV</OPTION>		<OPTION value="A" <% If Session("postopdesc_esophagitis_grade") = "A" Then Response.Write("selected") End If %>>A</OPTION>		<OPTION value="B" <% If Session("postopdesc_esophagitis_grade") = "B" Then Response.Write("selected") End If %>>B</OPTION>		<OPTION value="C" <% If Session("postopdesc_esophagitis_grade") = "C" Then Response.Write("selected") End If %>>C</OPTION>		<OPTION value="D" <% If Session("postopdesc_esophagitis_grade") = "D" Then Response.Write("selected") End If %>>D</OPTION>	</SELECT>
	</TD>
	</TR>
	<TR CLASS="esophagitis" STYLE="DISPLAY: <% If Session("postopdesc_esophagitis") <> "on" Then Response.Write("none") End If %>">
		<TD><FONT size=+1>Erosive:</FONT></TD>
	<TD><INPUT type=checkbox id=postopdesc_esophagitis_erosive name=postopdesc_esophagitis_erosive style="WIDTH: 40px; HEIGHT: 40px" size=41 <% If Session("postopdesc_esophagitis_erosive") = "on" Then Response.Write("checked") End If %>></TD>
	</TR>
	<TR>
	<TD><INPUT type=checkbox id=postopdesc_barretts name=postopdesc_barretts style="WIDTH: 40px; HEIGHT: 40px" size=41 <% If Session("postopdesc_barretts") = "on" Then Response.Write("checked") End If %> onclick="expandAll('postopdesc_barretts');"></TD>
	<TD><FONT size=+1><B>Barrett's</B></FONT></TD>
	</TR>
	<TR CLASS="barretts" STYLE="DISPLAY: <% If Session("postopdesc_barretts") <> "on" Then Response.Write("none") End If %>">
	<TD>
	Location (cm):
	</TD>
	<TD>
		<INPUT type="text" value="<%=Session("postopdesc_barretts_location")%>" id=postopdesc_barretts_location name=postopdesc_barretts_location STYLE="WIDTH: 200px; FONT-SIZE: large">
	</TD>
	</TR>
	<TR>
	<TD><INPUT type=checkbox id=postopdesc_patulous name=postopdesc_patulous style="WIDTH: 40px; HEIGHT: 40px" size=41 <% If Session("postopdesc_patulous") = "on" Then Response.Write("checked") End If %>></TD>
	<TD><FONT size=+1><B>LES Patulous</B></FONT></TD>
	</TR>
	<TR>
	<TD><INPUT type=checkbox id=postopdesc_esophogeal_ring name=postopdesc_esophogeal_ring style="WIDTH: 40px; HEIGHT: 40px" size=41 <% If Session("postopdesc_esophogeal_ring") = "on" Then Response.Write("checked") End If %>></TD>
	<TD><FONT size=+1><B>Lower esophogeal ring seen</B></FONT></TD>
	</TR>
	<TR>
	<TD><INPUT type=checkbox id=postopdesc_duodenitis name=postopdesc_duodenitis style="WIDTH: 40px; HEIGHT: 40px" size=41 <% If Session("postopdesc_duodenitis") = "on" Then Response.Write("checked") End If %> onclick="expandAll('duodenitis');"></TD>
	<TD><FONT size=+1><B>Duodenitis</B></FONT></TD>
	</TR>
	<TR CLASS="duodenitis" STYLE="DISPLAY: <% If Session("postopdesc_duodenitis") <> "on" Then Response.Write("none") End If %>">
	<TD>
	</TD>
	<TD>
	<SELECT id=postopdesc_duodenitis_level name=postopdesc_duodenitis_level STYLE="FONT-SIZE: large">		<OPTION value="Mild" <% If Session("postopdesc_duodenitis_level") = "I" Then Response.Write("selected") End If %>>Mild</OPTION>		<OPTION value="Moderate" <% If Session("postopdesc_duodenitis_level") = "II" Then Response.Write("selected") End If %>>Moderate</OPTION>		<OPTION value="Severe" <% If Session("postopdesc_duodenitis_level") = "III" Then Response.Write("selected") End If %>>Severe</OPTION>	</SELECT>
	</TD>
	</TR>
	<TR>
	<TD><INPUT type=checkbox id=postopdesc_duodenal_nodules name=postopdesc_duodenal_nodules style="WIDTH: 40px; HEIGHT: 40px" size=41 <% If Session("postopdesc_duodenal_nodules") = "on" Then Response.Write("checked") End If %> onclick="expandAll('duodenal_nodules');"></TD>
	<TD><FONT size=+1><B>Duodenal Nodules</B></FONT></TD>
	</TR>
	<TR CLASS="duodenal_nodules" STYLE="DISPLAY: <% If Session("postopdesc_duodenal_nodules") <> "on" Then Response.Write("none") End If %>">
		<TD><FONT size=+1>Metaplasia:</FONT></TD>
	<TD><INPUT type=checkbox id=postopdesc_duodenal_nodules_metaplasia name=postopdesc_duodenal_nodules_metaplasia style="WIDTH: 40px; HEIGHT: 40px" size=41 <% If Session("postopdesc_duodenal_nodules_metaplasia") = "on" Then Response.Write("checked") End If %>></TD>
	</TR>
		<TR CLASS="duodenal_nodules" STYLE="DISPLAY: <% If Session("postopdesc_duodenal_nodules") <> "on" Then Response.Write("none") End If %>">
		<TD><FONT size=+1>Biopsied:</FONT></TD>
	<TD><INPUT type=checkbox id=postopdesc_duodenal_biopsied name=postopdesc_duodenal_biopsied style="WIDTH: 40px; HEIGHT: 40px" size=41 <% If Session("postopdesc_duodenal_biopsied") = "on" Then Response.Write("checked") End If %>></TD>
	</TR>
	<TR>
	<TD><INPUT type=checkbox id=postopdesc_gastritis name=postopdesc_gastritis style="WIDTH: 40px; HEIGHT: 40px" size=41 <% If Session("postopdesc_gastritis") = "on" Then Response.Write("checked") End If %> onclick="expandAll('gastritis');"></TD>
	<TD><FONT size=+1><B>Gastritis</B></FONT></TD>
	</TR>
	<TR CLASS="gastritis" STYLE="DISPLAY: <% If Session("postopdesc_gastritis") <> "on" Then Response.Write("none") End If %>">
	<TD>
	Location:
	</TD>
	<TD>
		<INPUT type="text" value="<%=Session("postopdesc_gastritis_location")%>" id=postopdesc_gastritis_location name=postopdesc_gastritis_location STYLE="WIDTH: 200px; FONT-SIZE: large">
	</TD>
	</TR>
	<TR>
	<TD><INPUT type=checkbox id=postopdesc_hiatal_hernia name=postopdesc_hiatal_hernia style="WIDTH: 40px; HEIGHT: 40px" size=41 <% If Session("postopdesc_hiatal_hernia") = "on" Then Response.Write("checked") End If %> onclick="expandAll('hiatal_hernia');"></TD>
	<TD><FONT size=+1><B>Hiatal Hernia</B></FONT></TD>
	</TR>
	<TR CLASS="hiatal_hernia" STYLE="DISPLAY: <% If Session("postopdesc_esophagitis") <> "on" Then Response.Write("none") End If %>">
		<TD><FONT size=+1>Sliding:</FONT></TD>
	<TD><INPUT type=checkbox id=postopdesc_hiatal_hernia_sliding name=postopdesc_hiatal_hernia_sliding style="WIDTH: 40px; HEIGHT: 40px" size=41 <% If Session("postopdesc_hiatal_hernia_sliding") = "on" Then Response.Write("checked") End If %>></TD>
	</TR>

	<%end if%>
	<TR>
	<TD><INPUT type=checkbox id=incomplete name=incomplete style="WIDTH: 40px; HEIGHT: 40px" size=41 <% If Session("postopdesc_incomplete") = "on" Then Response.Write("checked") End If %> onclick="expandAll('incomplete');"></TD>
	<TD><FONT size=+1><B>Incomplete Exam</B></FONT></TD>
	</TR>
	<TR CLASS="incomplete" STYLE="DISPLAY: <% If Session("postopdesc_incomplete") <> "on" Then Response.Write("none") End If %>">
	<TD>
	Stopped at:
	</TD>
	<TD>
		<INPUT type="text" value="<%=Session("postopdesc_incomplete_advancedto")%>" id=postopdesc_incomplete_advancedto name=postopdesc_incomplete_advancedto STYLE="WIDTH: 200px; FONT-SIZE: large">
	</TD>
	</TR>
		<TR CLASS="incomplete" STYLE="DISPLAY: <% If Session("postopdesc_incomplete") <> "on" Then Response.Write("none") End If %>">
	<TD>
	Why:
	</TD>
	<TD>
		<INPUT type="text" value="<%=Session("postopdesc_incomplete_why")%>" id=postopdesc_incomplete_why name=postopdesc_incomplete_why STYLE="WIDTH: 200px; FONT-SIZE: large">
	</TD>
	</TR>
	<%if Session("optype")="colonoscopy" then%>
	<TR>
	<TD><INPUT type=checkbox id=inthemorrhoids name=inthemorrhoids style="WIDTH: 40px; HEIGHT: 40px" size=41 <% If Session("postopdesc_inthemorrhoids") = "on" Then Response.Write("checked") End If %>></TD>
	<TD><FONT size=+1><B>Internal Hemorrhoids seen</B></FONT></TD>
	</TR>
	<TR>
	<TD><INPUT type=checkbox id=inthemorrhoids name=exthemorrhoids style="WIDTH: 40px; HEIGHT: 40px" size=41 <% If Session("postopdesc_exthemorrhoids") = "on" Then Response.Write("checked") End If %>></TD>
	<TD><FONT size=+1><STRONG>External Hemorrhoids seen</STRONG></FONT></TD>
	</TR>
	<TR>
	<TD><INPUT type=checkbox id=hypertrophic name=hypertrophic style="WIDTH: 40px; HEIGHT: 40px" size=41 <% If Session("postopdesc_hypertrophic") = "on" Then Response.Write("checked") End If %>></TD>
	<TD><FONT size=+1><STRONG>Hypertrophic Anal Papillae seen</STRONG></FONT></TD>
	</TR>
	<TR>
	<TD><INPUT type=checkbox id=melanosis name=melanosis style="WIDTH: 40px; HEIGHT: 40px" size=41 <% If Session("postopdesc_melanosis") = "on" Then Response.Write("checked") End If %>></TD>
	<TD><FONT size=+1><STRONG>Melanosis Coli seen</STRONG></FONT></TD>
	</TR>
	<TR>
	<TD><INPUT type=checkbox id=lipoma name=lipoma style="WIDTH: 40px; HEIGHT: 40px" size=41 <% If Session("postopdesc_lipoma") = "on" Then Response.Write("checked") End If %>></TD>
	<TD><FONT size=+1><STRONG>Lipoma was noted</STRONG></FONT></TD>
	</TR>
	<TR>
	<TD><INPUT type=checkbox id=diverticulae name=diverticulae style="WIDTH: 40px; HEIGHT: 40px" size=41 <% If Session("postopdesc_diverticulae") = "on" Then Response.Write("checked") End If %> onclick="expandAll('divert');"></TD>
	<TD><FONT size=+1><STRONG>Diverticulae seen</STRONG></FONT></TD>
	</TR>
	<TR CLASS="divert" STYLE="DISPLAY: <% If Session("postopdesc_diverticulae") <> "on" Then Response.Write("none") End If %>">
	<TD>
	Quantity:
	</TD>
	<TD>
	<SELECT id=postopdesc_diverticulae_quantity name=postopdesc_diverticulae_quantity STYLE="FONT-SIZE: large">		<OPTION value="Rare" <% If Session("postopdesc_diverticulae_quantity") = "Rare" Then Response.Write("selected") End If %>>Rare</OPTION>		<OPTION value="Few" <% If Session("postopdesc_diverticulae_quantity") = "Few" Then Response.Write("selected") End If %>>Few</OPTION>		<OPTION value="Scattered" <% If Session("postopdesc_diverticulae_quantity") = "Scattered" Then Response.Write("selected") End If %>>Scattered</OPTION>		<OPTION value="Numerous" <% If Session("postopdesc_diverticulae_quantity") = "Numerous" Then Response.Write("selected") End If %>>Numerous</OPTION>
	</SELECT>
	</TD>
	</TR>
	<TR CLASS="divert" STYLE="DISPLAY: <% If Session("postopdesc_diverticulae") <> "on" Then Response.Write("none") End If %>">
	<TD colspan=2>
	Size:
	</TD>
	</TR>
	<TR CLASS="divert" STYLE="DISPLAY: <% If Session("postopdesc_diverticulae") <> "on" Then Response.Write("none") End If %>">
	<TD><INPUT type=checkbox id=sizelarge name=sizelarge style="WIDTH: 40px; HEIGHT: 40px" size=41 <% If instr(1,Session("postopdesc_diverticulae_size"),"Large") > 0 Then Response.Write("checked") End If %>></TD>
	<TD>Large</TD>
	</TR>
	<TR CLASS="divert" STYLE="DISPLAY: <% If Session("postopdesc_diverticulae") <> "on" Then Response.Write("none") End If %>">
	<TD><INPUT type=checkbox id=sizemedium name=sizemedium style="WIDTH: 40px; HEIGHT: 40px" size=41 <% If instr(1,Session("postopdesc_diverticulae_size"),"Medium") Then Response.Write("checked") End If %>></TD>
	<TD>Medium</TD>
	</TR>
	<TR CLASS="divert" STYLE="DISPLAY: <% If Session("postopdesc_diverticulae") <> "on" Then Response.Write("none") End If %>">
	<TD><INPUT type=checkbox id=sizesmall name=sizesmall style="WIDTH: 40px; HEIGHT: 40px" size=41 <% If instr(1,Session("postopdesc_diverticulae_size"),"Small") Then Response.Write("checked") End If %>></TD>
	<TD>Small</TD>
	</TR>
	<TR CLASS="divert" STYLE="DISPLAY: <% If Session("postopdesc_diverticulae") <> "on" Then Response.Write("none") End If %>">
	<TD>
	Location:
	</TD>
	</TR>
		<TR CLASS="divert" STYLE="DISPLAY: <% If Session("postopdesc_diverticulae") <> "on" Then Response.Write("none") End If %>">
	<TD><INPUT type=checkbox id=locationleft name=locationleft style="WIDTH: 40px; HEIGHT: 40px" size=41 <% If instr(1,Session("postopdesc_diverticulae_location"),"Left") > 0 Then Response.Write("checked") End If %>></TD>
	<TD>Left</TD>
	</TR>
	<TR CLASS="divert" STYLE="DISPLAY: <% If Session("postopdesc_diverticulae") <> "on" Then Response.Write("none") End If %>">
	<TD><INPUT type=checkbox id=locationright name=locationright style="WIDTH: 40px; HEIGHT: 40px" size=41 <% If instr(1,Session("postopdesc_diverticulae_location"),"Right") Then Response.Write("checked") End If %>></TD>
	<TD>Right</TD>
	</TR>
	<TR CLASS="divert" STYLE="DISPLAY: <% If Session("postopdesc_diverticulae") <> "on" Then Response.Write("none") End If %>">
	<TD><INPUT type=checkbox id=locationcecum name=locationcecum style="WIDTH: 40px; HEIGHT: 40px" size=41 <% If instr(1,Session("postopdesc_diverticulae_location"),"Cecum") Then Response.Write("checked") End If %>></TD>
	<TD>Cecum</TD>
	<%end if%>
</TABLE>
<TABLE width=320 border=0 CELLSPACING=0 CELLPADDING=0>
	<TR>
		<TD><INPUT id=exitBtn style="FONT-WEIGHT: bold; FONT-SIZE: larger; WIDTH: 105px; COLOR: white; FONT-FAMILY: monospace; HEIGHT: 76px; BACKGROUND-COLOR: black" type=button size=31 value="Back" name=exitBtn onclick="document.location.href='postopmenu.html'"></TD>
		<TD colspan=2 align=right><INPUT id=nextBtn style="FONT-WEIGHT: bold; FONT-SIZE: larger; WIDTH: 105px; COLOR: black; FONT-FAMILY: monospace; HEIGHT: 76px" type=submit size=31 value="Ok" name=nextBtn></TD>
	</TR>
</TABLE>
<input type="hidden" name="type" value="postopdesc">
</FORM>
</BODY>
</HTML>
